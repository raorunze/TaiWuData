@echo off
jre\bin\java.exe -cp simple.jar;desktop-1.0.jar -Xmx1G -Dsun.java2d.dpiaware=true -javaagent:byteman.jar=script:common.btm,script:Ironclad.btm,script:TheSilent.btm,script:Defect.btm com.megacrit.cardcrawl.desktop.DesktopLauncher

