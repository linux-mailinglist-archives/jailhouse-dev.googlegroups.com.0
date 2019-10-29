Return-Path: <jailhouse-dev+bncBCDJXM4674ERBHE633WQKGQEON6TTKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 41316E7DBE
	for <lists+jailhouse-dev@lfdr.de>; Tue, 29 Oct 2019 02:00:15 +0100 (CET)
Received: by mail-ot1-x33d.google.com with SMTP id e104sf7255783ote.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Oct 2019 18:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AE3KxeWHgQbOhjPowsgjEeVm1fIlBU7XcZKwfhFCt6s=;
        b=VB9G4WnFyxBF9xR2ryAVzimbzeGp88DDtOpHSWEE+UTEsbUZxaAIJkexp4+JATzoRf
         KZbcbFbIDmQXQJVy8edoSJHZ6D33xqthtZ7pQaIcJ9I8edSzgq2iTtDWack1i1k5Cv0n
         /gjfwrEPaIZRTkQRFZlhoVU5Tlq00ffNeIZZ+cQo/R4zzIIVUS2E2tBNyosHs95rIRbA
         kAOD/MZbfx7sB+bNz4UmOeCgivBUdYR9AnlU11b18RaDbj2nPr1HP7L4kmQAhJGPgLxc
         bMxBI7QsJCTOthI/d+L9MT1i3zzFVFe/p72813R4BHqRLqIX6mHXy1D9qArF6jLripFh
         brgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AE3KxeWHgQbOhjPowsgjEeVm1fIlBU7XcZKwfhFCt6s=;
        b=buFpl20wOUfUIJB0F/9xEk1kF+6gLpfCyRS0F5E6V+/hk2S+MtxFCjCwYNc3bHZVJK
         Z71Sslgh8sXNWjdDMkg43gwc0Yva4yZf9nL59iNAYJ8Hd2LLag7dxJFMWXlGfeNbsGnD
         yVd5hX/d/PtNQ2uF/jgzAib8Vv506YuRhoYm927Lm3gQKDi6wu32eMQMZxfgoqc0NOG1
         EVbe5QVOOqkL0gouj28jLrLeHfyup9sYXTcnFcYh3FhdBvpBTJ20uWNomQmLAZynXpI+
         2sl+Clh/ZGjXCr3K5h41xbUwlThWpzrYRKQYiZuJgtS+tY1yWIezXjNpm/pwpqmZyzR0
         NR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AE3KxeWHgQbOhjPowsgjEeVm1fIlBU7XcZKwfhFCt6s=;
        b=dGtf6jFpYVISAwm56ZRtM4k9KoQr9r/JoPvSluLsOQ8Z6yhbAsvOTnK1Dm0xwLAZ7o
         MnOt1klrppxLiVc1sSsLp9FvK/7zg4mbgSWMamMUNvjCZsKPDFpe+kKErh7r+7kDP8CT
         mlQnKtHzcr9Cds8iUxniB/SMLkY7lvhXyGb54j/IorJC31h2VgmDJUYZLKacbdNH6p7a
         RvA2xO/vZwQpf0dWT2ZMaH3/IZmzE/ka3Bfb8sEbXWdCfATshtl4JPZQjfY7YIHVuZE4
         2yUECHTEiK3v8LBLZgufQSF/W+YPBETDfXhjfc21OOiYODh/gUoYMQUIjkPnfHhQ6lEJ
         y9LA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX/6GLynSDcEiSzCqd8hrdavDjZJsVv+o93oS5V7j7I1s6uyS07
	l7S85WJWcZHkY+rXF95qFDw=
X-Google-Smtp-Source: APXvYqyp5+CVBL6jdWuLJ1QTL1A6Q4/es3tjhrhD1BuqVgYF51VFr42cuUBD7BltmJvhAXQmWsVTqw==
X-Received: by 2002:a9d:ef0:: with SMTP id 103mr15514691otj.2.1572310812585;
        Mon, 28 Oct 2019 18:00:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:5886:: with SMTP id m128ls702484oib.14.gmail; Mon, 28
 Oct 2019 18:00:12 -0700 (PDT)
X-Received: by 2002:a05:6808:b15:: with SMTP id s21mr1668846oij.138.1572310811622;
        Mon, 28 Oct 2019 18:00:11 -0700 (PDT)
Date: Mon, 28 Oct 2019 18:00:10 -0700 (PDT)
From: michael.g.hinton@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d2ed6570-f881-4958-9782-9fba669fbe7d@googlegroups.com>
In-Reply-To: <5b73c7ca-5302-826e-9dfa-71610e31d8f3@siemens.com>
References: <f524bf21-7361-4cac-9766-789ed9c92ab2@googlegroups.com>
 <5b73c7ca-5302-826e-9dfa-71610e31d8f3@siemens.com>
Subject: Re: GCC 8 + 9 not compiling cell configs correctly in Kubuntu 19.10
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1580_1639454791.1572310810864"
X-Original-Sender: Michael.G.Hinton@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_1580_1639454791.1572310810864
Content-Type: multipart/alternative; 
	boundary="----=_Part_1581_1007885696.1572310810864"

------=_Part_1581_1007885696.1572310810864
Content-Type: text/plain; charset="UTF-8"

Hey Jan,

Here are the generated cells and their corresponding .o files for GCC 7, 8, 
and 9, as well as the original .c config file.

Quick overview of the beginning of each .o file, with changes bolded:

GCC 7:

7f45 4c46 0201 0100 0000 0000 0000 0000
0100 3e00 0100 0000 0000 0000 0000 0000
0000 0000 0000 0000 *d802* 0000 0000 0000
0000 0000 4000 0000 0000 4000* 0900 0800*
4a48 4345 4c4c 0c00 6261 7a6f 6f6b 612d
696e 6d61 7465 0000 0000 0000 0000 0000


GCC 8:

7f45 4c46 0201 0100 0000 0000 0000 0000
0100 3e00 0100 0000 0000 0000 0000 0000
0000 0000 0000 0000 *2803* 0000 0000 0000
0000 0000 4000 0000 0000 4000* 0a00 0900*
4a48 4345 4c4c 0c00 6261 7a6f 6f6b 612d
696e 6d61 7465 0000 0000 0000 0000 0000

GCC 9:

7f45 4c46 0201 0100 0000 0000 0000 0000
0100 3e00 0100 0000 0000 0000 0000 0000
0000 0000 0000 0000 *3003* 0000 0000 0000
0000 0000 4000 0000 0000 4000* 0a00 0900*
4a48 4345 4c4c 0c00 6261 7a6f 6f6b 612d
696e 6d61 7465 0000 0000 0000 0000 0000

The second bolded part in each file is different for GCC 8/9 than for GCC 
7, so I wonder if that is messing up the .o to .cell translation.

Thanks,
Michael

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d2ed6570-f881-4958-9782-9fba669fbe7d%40googlegroups.com.

------=_Part_1581_1007885696.1572310810864
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Jan,<div><br></div><div>Here are the generated cells a=
nd their corresponding .o files for GCC 7, 8, and 9, as well as the origina=
l .c config file.</div><div><br></div><div>Quick overview of the beginning =
of each .o file, with changes bolded:</div><div><br></div><div><font face=
=3D"courier new, monospace">GCC 7:</font></div><div><font face=3D"courier n=
ew, monospace"><br></font></div><div><div><font face=3D"courier new, monosp=
ace">7f45 4c46 0201 0100 0000 0000 0000 0000</font></div><div><font face=3D=
"courier new, monospace">0100 3e00 0100 0000 0000 0000 0000 0000</font></di=
v><div><font face=3D"courier new, monospace">0000 0000 0000 0000 <b>d802</b=
> 0000 0000 0000</font></div><div><font face=3D"courier new, monospace">000=
0 0000 4000 0000 0000 4000<b> 0900 0800</b></font></div><div><font face=3D"=
courier new, monospace">4a48 4345 4c4c 0c00 6261 7a6f 6f6b 612d</font></div=
><div><font face=3D"courier new, monospace">696e 6d61 7465 0000 0000 0000 0=
000 0000</font></div></div><div><font face=3D"courier new, monospace"><br><=
/font></div><div><font face=3D"courier new, monospace"><br></font></div><di=
v><font face=3D"courier new, monospace">GCC 8:</font></div><div><font face=
=3D"courier new, monospace"><br></font></div><div><div><font face=3D"courie=
r new, monospace">7f45 4c46 0201 0100 0000 0000 0000 0000</font></div><div>=
<font face=3D"courier new, monospace">0100 3e00 0100 0000 0000 0000 0000 00=
00</font></div><div><font face=3D"courier new, monospace">0000 0000 0000 00=
00 <b>2803</b> 0000 0000 0000</font></div><div><font face=3D"courier new, m=
onospace">0000 0000 4000 0000 0000 4000<b> 0a00 0900</b></font></div><div><=
font face=3D"courier new, monospace">4a48 4345 4c4c 0c00 6261 7a6f 6f6b 612=
d</font></div><div><font face=3D"courier new, monospace">696e 6d61 7465 000=
0 0000 0000 0000 0000</font></div></div><div><font face=3D"courier new, mon=
ospace"><br></font></div><div><font face=3D"courier new, monospace">GCC 9:<=
/font></div><div><br></div><div><div><font face=3D"courier new, monospace">=
7f45 4c46 0201 0100 0000 0000 0000 0000</font></div><div><font face=3D"cour=
ier new, monospace">0100 3e00 0100 0000 0000 0000 0000 0000</font></div><di=
v><font face=3D"courier new, monospace">0000 0000 0000 0000 <b>3003</b> 000=
0 0000 0000</font></div><div><font face=3D"courier new, monospace">0000 000=
0 4000 0000 0000 4000<b> 0a00 0900</b></font></div><div><font face=3D"couri=
er new, monospace">4a48 4345 4c4c 0c00 6261 7a6f 6f6b 612d</font></div><div=
><font face=3D"courier new, monospace">696e 6d61 7465 0000 0000 0000 0000 0=
000</font></div></div><div><br></div><div>The second bolded part in each fi=
le is different for GCC 8/9 than for GCC 7, so I wonder if that is messing =
up the .o to .cell translation.</div><div><br></div><div>Thanks,</div><div>=
Michael</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d2ed6570-f881-4958-9782-9fba669fbe7d%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/d2ed6570-f881-4958-9782-9fba669fbe7d%40googlegroups.com<=
/a>.<br />

------=_Part_1581_1007885696.1572310810864--

------=_Part_1580_1639454791.1572310810864
Content-Type: application/octet-stream; name=bazooka-inmate.cell.gcc7
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=bazooka-inmate.cell.gcc7
X-Attachment-Id: 9e2f175e-1873-4cb0-8edb-19cec4150457
Content-ID: <9e2f175e-1873-4cb0-8edb-19cec4150457>

SkhDRUxMDABiYXpvb2thLWlubWF0ZQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACACAAAAAQAAAAA
AAAAAAAAAAIAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPgDAAAAAAAAAAAAAAIA
AAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAGA6AAAAAAAAAAAAAAAAAAAQAAAAAABHAAAAAAAA
AAAAAAAAAAAAAAAQAAAAAAAAEAAAAAAAACMAAAAAAAAAAAAQPwAAAAAAABA/AAAAAAAAEAAAAAAA
gwAAAAAAAAAAAHA6AAAAAAAAIAAAAAAAAACgBAAAAABHAAAAAAAAAPgCCAD4AwgAAwAAAHgAAP//
//////8AAAAAAAAAAOD/////////AAAAAAAAAQAAAAAAAAAAAAAAAgAAAAAAAAA=
------=_Part_1580_1639454791.1572310810864
Content-Type: application/octet-stream; name=bazooka-inmate.cell.gcc8
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=bazooka-inmate.cell.gcc8
X-Attachment-Id: 100c7a16-9937-46a7-8156-8cf73074bd03
Content-ID: <100c7a16-9937-46a7-8156-8cf73074bd03>

BAAAABAAAAAFAAAAR05VAAIAAMAEAAAAAwAAAAAAAAAAAAAAAAAAAAAAAAAAAACACAAAAAQAAAAA
AAAAAAAAAAIAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPgDAAAAAAAAAAAAAAIA
AAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAGA6AAAAAAAAAAAAAAAAAAAQAAAAAABHAAAAAAAA
AAAAAAAAAAAAAAAQAAAAAAAAEAAAAAAAACMAAAAAAAAAAAAQPwAAAAAAABA/AAAAAAAAEAAAAAAA
gwAAAAAAAAAAAHA6AAAAAAAAIAAAAAAAAACgBAAAAABHAAAAAAAAAPgCCAD4AwgAAwAAAHgAAP//
//////8AAAAAAAAAAOD/////////AAAAAAAAAQAAAAAAAAAAAAAAAgAAAAAAAAA=
------=_Part_1580_1639454791.1572310810864
Content-Type: application/octet-stream; name=bazooka-inmate.cell.gcc9
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=bazooka-inmate.cell.gcc9
X-Attachment-Id: 861ed63a-07b3-43b8-bd3f-47f1e3934343
Content-ID: <861ed63a-07b3-43b8-bd3f-47f1e3934343>

BAAAABAAAAAFAAAAR05VAAIAAMAEAAAAAwAAAAAAAAAAAAAAAAAAAAAAAAAAAACACAAAAAQAAAAA
AAAAAAAAAAIAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPgDAAAAAAAAAAAAAAIA
AAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAGA6AAAAAAAAAAAAAAAAAAAQAAAAAABHAAAAAAAA
AAAAAAAAAAAAAAAQAAAAAAAAEAAAAAAAACMAAAAAAAAAAAAQPwAAAAAAABA/AAAAAAAAEAAAAAAA
gwAAAAAAAAAAAHA6AAAAAAAAIAAAAAAAAACgBAAAAABHAAAAAAAAAPgCCAD4AwgAAwAAAHgAAP//
//////8AAAAAAAAAAOD/////////AAAAAAAAAQAAAAAAAAAAAAAAAgAAAAAAAAA=
------=_Part_1580_1639454791.1572310810864
Content-Type: application/octet-stream; name=bazooka-inmate.o.gcc7
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=bazooka-inmate.o.gcc7
X-Attachment-Id: 5f39fade-f8fe-4f8c-9b8a-3f32bc6d0915
Content-ID: <5f39fade-f8fe-4f8c-9b8a-3f32bc6d0915>

f0VMRgIBAQAAAAAAAAAAAAEAPgABAAAAAAAAAAAAAAAAAAAAAAAAANgCAAAAAAAAAAAAAEAAAAAA
AEAACQAIAEpIQ0VMTAwAYmF6b29rYS1pbm1hdGUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAgA
AAAEAAAAAAAAAAAAAAACAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD4AwAAAAAA
AAAAAAACAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAABgOgAAAAAAAAAAAAAAAAAAEAAAAAAA
RwAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAABAAAAAAAAAjAAAAAAAAAAAAED8AAAAAAAAQPwAAAAAA
ABAAAAAAAIMAAAAAAAAAAABwOgAAAAAAACAAAAAAAAAAoAQAAAAARwAAAAAAAAD4AggA+AMIAAMA
AAB4AAD/////////AAAAAAAAAADg/////////wAAAAAAAAEAAAAAAAAAAAAAAAIAAAAAAAAAAEdD
QzogKFVidW50dSA3LjQuMC0xNHVidW50dTIpIDcuNC4wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAABAAAABADx/wAAAAAAAAAAAAAAAAAAAAAAAAAAAwABAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAwACAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwAFAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAwAEAAAAAAAAAAAAAAAAAAAAAAASAAAAEQACAAAAAAAAAAAATAEA
AAAAAAAAYmF6b29rYS1pbm1hdGUuYwBjb25maWcAAC5zeW10YWIALnN0cnRhYgAuc2hzdHJ0YWIA
LnRleHQALmRhdGEALmJzcwAuY29tbWVudAAubm90ZS5HTlUtc3RhY2sAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGwAAAAEA
AAAGAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAA
ACEAAAABAAAAAwAAAAAAAAAAAAAAAAAAAEAAAAAAAAAATAEAAAAAAAAAAAAAAAAAACAAAAAAAAAA
AAAAAAAAAAAnAAAACAAAAAMAAAAAAAAAAAAAAAAAAACMAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB
AAAAAAAAAAAAAAAAAAAALAAAAAEAAAAwAAAAAAAAAAAAAAAAAAAAjAEAAAAAAAAlAAAAAAAAAAAA
AAAAAAAAAQAAAAAAAAABAAAAAAAAADUAAAABAAAAAAAAAAAAAAAAAAAAAAAAALEBAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAABAAAAAgAAAAAAAAAAAAAAAAAAAAAAAAC4AQAA
AAAAAMAAAAAAAAAABwAAAAcAAAAIAAAAAAAAABgAAAAAAAAACQAAAAMAAAAAAAAAAAAAAAAAAAAA
AAAAeAIAAAAAAAAZAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAABEAAAADAAAAAAAAAAAA
AAAAAAAAAAAAAJECAAAAAAAARQAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAA=
------=_Part_1580_1639454791.1572310810864
Content-Type: application/octet-stream; name=bazooka-inmate.o.gcc8
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=bazooka-inmate.o.gcc8
X-Attachment-Id: 9f559abf-c013-48b5-9dbd-168fef2edc0e
Content-ID: <9f559abf-c013-48b5-9dbd-168fef2edc0e>

f0VMRgIBAQAAAAAAAAAAAAEAPgABAAAAAAAAAAAAAAAAAAAAAAAAACgDAAAAAAAAAAAAAEAAAAAA
AEAACgAJAEpIQ0VMTAwAYmF6b29rYS1pbm1hdGUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAgA
AAAEAAAAAAAAAAAAAAACAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD4AwAAAAAA
AAAAAAACAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAABgOgAAAAAAAAAAAAAAAAAAEAAAAAAA
RwAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAABAAAAAAAAAjAAAAAAAAAAAAED8AAAAAAAAQPwAAAAAA
ABAAAAAAAIMAAAAAAAAAAABwOgAAAAAAACAAAAAAAAAAoAQAAAAARwAAAAAAAAD4AggA+AMIAAMA
AAB4AAD/////////AAAAAAAAAADg/////////wAAAAAAAAEAAAAAAAAAAAAAAAIAAAAAAAAAAEdD
QzogKFVidW50dSA4LjMuMC0yM3VidW50dTIpIDguMy4wAAAAAAAAAAAEAAAAEAAAAAUAAABHTlUA
AgAAwAQAAAADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAEAPH/AAAAAAAAAAAA
AAAAAAAAAAAAAAADAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAADAAIAAAAAAAAAAAAAAAAAAAAAAAAA
AAADAAMAAAAAAAAAAAAAAAAAAAAAAAAAAAADAAUAAAAAAAAAAAAAAAAAAAAAAAAAAAADAAYAAAAA
AAAAAAAAAAAAAAAAAAAAAAADAAQAAAAAAAAAAAAAAAAAAAAAABIAAAARAAIAAAAAAAAAAABMAQAA
AAAAAABiYXpvb2thLWlubWF0ZS5jAGNvbmZpZwAALnN5bXRhYgAuc3RydGFiAC5zaHN0cnRhYgAu
dGV4dAAuZGF0YQAuYnNzAC5jb21tZW50AC5ub3RlLkdOVS1zdGFjawAubm90ZS5nbnUucHJvcGVy
dHkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAbAAAAAQAAAAYAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAIQAAAAEAAAADAAAAAAAAAAAAAAAAAAAAQAAAAAAAAABM
AQAAAAAAAAAAAAAAAAAAIAAAAAAAAAAAAAAAAAAAACcAAAAIAAAAAwAAAAAAAAAAAAAAAAAAAIwB
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAsAAAAAQAAADAAAAAAAAAAAAAA
AAAAAACMAQAAAAAAACUAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAEAAAAAAAAANQAAAAEAAAAAAAAA
AAAAAAAAAAAAAAAAsQEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAEUAAAAH
AAAAAgAAAAAAAAAAAAAAAAAAALgBAAAAAAAAIAAAAAAAAAAAAAAAAAAAAAgAAAAAAAAAAAAAAAAA
AAABAAAAAgAAAAAAAAAAAAAAAAAAAAAAAADYAQAAAAAAANgAAAAAAAAACAAAAAgAAAAIAAAAAAAA
ABgAAAAAAAAACQAAAAMAAAAAAAAAAAAAAAAAAAAAAAAAsAIAAAAAAAAZAAAAAAAAAAAAAAAAAAAA
AQAAAAAAAAAAAAAAAAAAABEAAAADAAAAAAAAAAAAAAAAAAAAAAAAAMkCAAAAAAAAWAAAAAAAAAAA
AAAAAAAAAAEAAAAAAAAAAAAAAAAAAAA=
------=_Part_1580_1639454791.1572310810864
Content-Type: application/octet-stream; name=bazooka-inmate.o.gcc9
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=bazooka-inmate.o.gcc9
X-Attachment-Id: da4d3675-7ceb-416b-b720-d55851071a98
Content-ID: <da4d3675-7ceb-416b-b720-d55851071a98>

f0VMRgIBAQAAAAAAAAAAAAEAPgABAAAAAAAAAAAAAAAAAAAAAAAAADADAAAAAAAAAAAAAEAAAAAA
AEAACgAJAEpIQ0VMTAwAYmF6b29rYS1pbm1hdGUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAgA
AAAEAAAAAAAAAAAAAAACAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD4AwAAAAAA
AAAAAAACAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAABgOgAAAAAAAAAAAAAAAAAAEAAAAAAA
RwAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAABAAAAAAAAAjAAAAAAAAAAAAED8AAAAAAAAQPwAAAAAA
ABAAAAAAAIMAAAAAAAAAAABwOgAAAAAAACAAAAAAAAAAoAQAAAAARwAAAAAAAAD4AggA+AMIAAMA
AAB4AAD/////////AAAAAAAAAADg/////////wAAAAAAAAEAAAAAAAAAAAAAAAIAAAAAAAAAAEdD
QzogKFVidW50dSA5LjIuMS05dWJ1bnR1MikgOS4yLjEgMjAxOTEwMDgAAAAAAAAAAAQAAAAQAAAA
BQAAAEdOVQACAADABAAAAAMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAQA8f8A
AAAAAAAAAAAAAAAAAAAAAAAAAAMAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAMAAgAAAAAAAAAAAAAA
AAAAAAAAAAAAAAMAAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAMABQAAAAAAAAAAAAAAAAAAAAAAAAAA
AAMABgAAAAAAAAAAAAAAAAAAAAAAAAAAAAMABAAAAAAAAAAAAAAAAAAAAAAAEgAAABEAAgAAAAAA
AAAAAEwBAAAAAAAAAGJhem9va2EtaW5tYXRlLmMAY29uZmlnAAAuc3ltdGFiAC5zdHJ0YWIALnNo
c3RydGFiAC50ZXh0AC5kYXRhAC5ic3MALmNvbW1lbnQALm5vdGUuR05VLXN0YWNrAC5ub3RlLmdu
dS5wcm9wZXJ0eQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABsAAAABAAAABgAAAAAAAAAAAAAAAAAAAEAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAhAAAAAQAAAAMAAAAAAAAAAAAAAAAAAABA
AAAAAAAAAEwBAAAAAAAAAAAAAAAAAAAgAAAAAAAAAAAAAAAAAAAAJwAAAAgAAAADAAAAAAAAAAAA
AAAAAAAAjAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAACwAAAABAAAAMAAA
AAAAAAAAAAAAAAAAAIwBAAAAAAAALQAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAQAAAAAAAAA1AAAA
AQAAAAAAAAAAAAAAAAAAAAAAAAC5AQAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAA
AAAARQAAAAcAAAACAAAAAAAAAAAAAAAAAAAAwAEAAAAAAAAgAAAAAAAAAAAAAAAAAAAACAAAAAAA
AAAAAAAAAAAAAAEAAAACAAAAAAAAAAAAAAAAAAAAAAAAAOABAAAAAAAA2AAAAAAAAAAIAAAACAAA
AAgAAAAAAAAAGAAAAAAAAAAJAAAAAwAAAAAAAAAAAAAAAAAAAAAAAAC4AgAAAAAAABkAAAAAAAAA
AAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAEQAAAAMAAAAAAAAAAAAAAAAAAAAAAAAA0QIAAAAAAABY
AAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAA==
------=_Part_1580_1639454791.1572310810864
Content-Type: text/x-csrc; charset=US-ASCII; name=bazooka-inmate.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=bazooka-inmate.c
X-Attachment-Id: 9b9a30df-e630-4bba-9430-043f05fe32cd
Content-ID: <9b9a30df-e630-4bba-9430-043f05fe32cd>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Minimal configuration for ivshmem inmate demo:
 * 1 CPU, 1MB RAM, serial ports, 4K shmem
 *
 * Copyright (c) Siemens AG, 2013, 2014
 *
 * Authors:
 *  Henning Schild <henning.schild@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	// struct jailhouse_memory mem_regions[3];
	struct jailhouse_memory mem_regions[4];
	struct jailhouse_pio pio_regions[2];
	struct jailhouse_pci_device pci_devices[1];
	struct jailhouse_pci_capability pci_caps[0];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "bazooka-inmate",
		.flags = JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,
		/* MGH: Remove the JAILHOUSE_CELL_PASSIVE_COMMREG flag to make
		 * the hypervisor ask the inmate for permission before shutting
		 * it down (see apic-demo.c) */
		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_irqchips = 0,
		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
		.num_pci_caps = ARRAY_SIZE(config.pci_caps),

		.console = {
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO,
			.address = 0x3f8,
		},
	},

	.cpus = {
		0b0100,
	},

	.mem_regions = {
		/* RAM */
		{
			.phys_start = 0x3a600000,
			.virt_start = 0,
			// 1 MB of RAM for the inmate's program
			.size = 0x00100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
		},
		/* communication region */
		{
			/* MGH: This virtual memory region points to memory
			 * allocated by Jailhouse within its own hypervisor
			 * memory region for communication to each inmate.
			 * This is NOT pointing to anything in the 75 MB inmate
			 * memory region */
			.virt_start = 0x00100000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_COMM_REGION |
				/* MGH: Allow the inmate to write to the comm
				 * region, so it can send messages to root */
				JAILHOUSE_MEM_WRITE,
		},
		/* MGH: IVSHMEM shared memory region */
		{
			.phys_start = 0x3f100000,
			.virt_start = 0x3f100000,
			// Create 1 MB of shared memory
			.size = 0x00100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
			/* MGH: I think virt_start could be set to 0x00101000.
			 * However, then the virtual address would be different
			 * than the physical address for no good reason. Being
			 * the same is a convenience */
		},
		/* MGH: RAM - Heap */
		{
			/* MGH: We have 75 MB of memory allocated to the inmate
			 * in the root config, but are only using 1 MB for the
			 * inmate's stack and program. So create an additional
			 * "heap" area with the other 74 MB to allow the program
			 * more memory to work with. */
			.phys_start = 0x3a700000,
			.virt_start = 0x00200000,
			// 74 MB (3a7 + 4a = 3f1)
			.size = 0x04a00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
		},
	},

	.pio_regions = {
		PIO_RANGE(0x2f8, 8), /* serial 2 */
		PIO_RANGE(0x3f8, 8), /* serial 1 */
	},

	.pci_devices = {
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0x0000,
			.bdf = 0x0f << 3,
			.bar_mask = {
				0xffffff00, 0xffffffff, 0x00000000,
				0x00000000, 0xffffffe0, 0xffffffff,
			},
			.num_msix_vectors = 1,
			.shmem_region = 2,
		},
	},
};

------=_Part_1580_1639454791.1572310810864--
