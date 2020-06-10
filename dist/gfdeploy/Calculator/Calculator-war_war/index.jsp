<%-- 
    Document   : index
    Created on : May 23, 2020, 12:35:55 AM
    Author     : Anggara Diebrata
    Credits    : RozyZzx
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link href="./css/styles.css" rel="stylesheet" type="text/css"/>
        <title>Statefull Calculator</title>
    </head>
    <body>
        <div class="bgo" id="home" style="background-color: #333333; height: 100%; color: white;">
            <div class="topnav" id="myTopnav">
                <a href="#" class="active">Calculator</a>
                <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                    <i class="fa fa-bars"></i>
                </a>
            </div>

            <div class="content">
                <div class="row">
                    <div class="column remainingDisplay" style="padding-top: 20px">
                        <p>Anggara DIebrata / 21120117140008</p>
                        <p>Heidi Amellie Ayu Astria / 21120117120022</p>
                        <p>Hizikia Josef Adi Pradana / 21120117130040</p>
                    </div>
                    <div class="column mainDisplay">
                        <div class="card" style="padding: 0;">
                            <div class="row">
                                <div class="column remainingDisplay" id="history">
                                    <h3 style="margin: 0; margin-bottom: 20px;">History</h3>
                                    <div id="historyPanel">
                                        <%
                                            String[] answerOld = (String[])request.getSession().getAttribute("answerOld");
                                            String[] calcOld = (String[])request.getSession().getAttribute("calcOld");
                                            int length;
                                            if(answerOld == null) {
                                                out.print("<p>History</p>");
                                            }
                                            else {
                                                    length = answerOld.length;
                                                    for (int i = 1; i <= length; ++i) {
                                                        out.print("<div class='historyItem' onclick='appendText(");
                                                        out.print(answerOld[length - i]);
                                                        out.print(")'>\n<p style='margin: 0; cursor: default;'>\n");
                                                        out.print(calcOld[length - i]);
                                                        out.print("</p><br/>\n<p style='font-size: 20px; margin: 0; cursor: default;'>");
                                                        out.print(answerOld[length - i]);
                                                        out.print("</p>\n</div>\n");
                                                    }
                                                }
                                        %>
                                    </div>
                                </div>
                                <div class="column mainDisplay" id="calcPanel">
                                    <div class="card" style="padding: 0; background-color: black; color: white;">
                                        <form class="full" method="post" action="Calculator">
                                            <%
                                                String res;
   
                                                if(request.getSession().getAttribute("result")!=null) res = request.getSession().getAttribute("result").toString();
                                                else res="";
                                            %>
                                            <div id="mainScreen">
                                                <input class="equationScreen" type="text" id="equationValue" name="value" value='<% out.print(res); %>'/>
                                              
                                            </div>
                                            <div class="grid-container" style="height: 70%">
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="deleteAllText()">C</button></div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="minused()">&#x2213</button></div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="deleteText()">&#x25C1</button></div>  
                                                <div class="grid-item accent accentButton" style="font-weight: bold; color: white">
                                                    <button type="button" class="clearButton" onclick="appendText(' / ')" style="color:#108000;" >/</button>
                                                </div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(1)">1</button></div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(2)">2</button></div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(3)">3</button></div>  
                                                <div class="grid-item accent accentButton" style="font-weight: bold; color: white">
                                                    <button type="button" class="clearButton" onclick="appendText(' x ')" style="color:#108000;">x</button>
                                                </div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(4)">4</button></div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(5)">5</button></div>  
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(6)">6</button></div>
                                                <div class="grid-item accent accentButton" style="font-weight: bold; color: white">
                                                    <button type="button" class="clearButton" onclick="appendText(' - ')" style="color:#108000;">-</button>
                                                </div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(7)">7</button></div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(8)">8</button></div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(9)">9</button></div>
                                                <div class="grid-item accent accentButton" style="font-weight: bold; color: white">
                                                    <button type="button" class="clearButton" onclick="appendText(' + ')" style="color:#108000;">+</button>
                                                </div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText('Ans')">Ans</button></div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText(0)">0</button></div>
                                                <div class="grid-item"><button type="button" class="clearButton" onclick="appendText('.')">.</button></div>
                                                <div class="grid-item accent accentButton" style="font-weight: bold; color: white;">
                                                    <input type="submit" value="=" class="clearButton accent accentButton" style=" background-color:#15400f;"/>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function myFunction() {
                var x = document.getElementById("myTopnav");
                if (x.className === "topnav") {
                    x.className += " responsive";
                } else {
                    x.className = "topnav";
                }
            }

            function appendText(x) {
                var eq = document.getElementById("equationValue").value.toString();
                if(eq === ""){
                    if(x === ' － ' || x === ' ＋ ' || x === ' × ' || x === ' ÷ '){
                        //do nothing
                    } else document.getElementById("equationValue").value += x;
                } else document.getElementById("equationValue").value += x;
            }

            function deleteText() {
                var str = document.getElementById("equationValue").value.toString();
                if(str.charAt(str.length - 1)===" " || str.charAt(str.length - 1)==="s") document.getElementById("equationValue").value = str.slice(0, -3);
                else document.getElementById("equationValue").value = str.slice(0, -1);
            }

            function deleteAllText() {
                document.getElementById("equationValue").value = "";
            }
            
            function minused(){
                var target = document.getElementById("equationValue").value.toString();
                if(target.charAt(target.length -1) === "-"){
                    deleteText();
                } else {
                    appendText("-");
                }
            }

            function etc() {
                alert("not implemented yet");
            }
        </script>
    </body>
</html> 
