Return-Path: <jailhouse-dev+bncBDPMHDOS4MIBBWXW7GKQMGQE5IFXOAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 38721562A9F
	for <lists+jailhouse-dev@lfdr.de>; Fri,  1 Jul 2022 06:43:07 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id w17-20020a5d6811000000b0021ba89c2e27sf111241wru.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jun 2022 21:43:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656650587; cv=pass;
        d=google.com; s=arc-20160816;
        b=TzQ9zm3NrgECd8gr9IjqqqaPEABQeXpQ2gqqN89KC66CEP6uFpE7MKJ4yU8/9dgxYY
         UR9ia4AWZRhGnxKJmMpJA4Y+TFUTb76ePx66xxEyu9ttwXqOEL6qbPAma+cwqeyiQVfh
         a0YLLckFyoARsfHLuIVEwctey+u0XKCWozil8Cn9ggLNKdIaBy6e4AgBIYHruN754Zl1
         19eev7OTlJR6K5QBw7A9vfyKeX6qE0hcD2Z1HGNjDPHm10CEHHajdwQw7a0rIrA8qYzb
         zTdDir/s33xXJ0kA3t3I6fUfq8P/JNdKGyHTh2lFPIGm6i0PEzP+BdDu0IeAy/ehk3WY
         y0Rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:to:subject:message-id:date:from
         :list-unsubscribe:list-unsubscribe-post:mime-version:sender
         :dkim-signature;
        bh=F3oPlj/buEl49Mox03zwHlGxcMdbiRuAiif37zeLlB4=;
        b=f2DOLAlWDK1jaxztwRbcWf9tCCgoEMfi/2wLAOUl6zhKqKFdjhUqFwO6f+rxvQZHN8
         JNVYz/3Nh5VszK76oaLTAHOyMXVzlpxCfJGwsaGTGA9kOc5iYNw3rtTk3ZhdaClXNXn1
         l1A87rrfyHEya3aL0/2CW3mTCJmK3RaaXc+4FMD3OWcBgTTZO+QuWQSWsUm4sN3yUG1x
         9Ni800khATi6mmw84EyGLlwQAmAqXajjyspgezLHDGJxt9OJD76DKQmOtD6tbrnjzHKc
         0xGFf/AMbAUUuPeSgAT9qnupBlBXgBgDoqxpBCg9CNr3cq8zvR8qpR7xYClEdD+9TtVZ
         26sQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@rtu-ac-in.20210112.gappssmtp.com header.s=20210112 header.b="ga/pBaYL";
       spf=neutral (google.com: 2a00:1450:4864:20::22a is neither permitted nor denied by best guess record for domain of conf3@rtu.ac.in) smtp.mailfrom=conf3@rtu.ac.in
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:list-unsubscribe-post:list-unsubscribe:from
         :date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe;
        bh=F3oPlj/buEl49Mox03zwHlGxcMdbiRuAiif37zeLlB4=;
        b=OyhX8NyIBOk6Hni7qVaean0CQZRJ60YKEX5XqYEchljyinn02bZGCN8DXauvHUFYA+
         iDmEnxA9f5MH5jYYR+uYS73ztNOFeU2eQFmgVUJfWlrMbm3GsZwizFrwXqMjVMcsoEm3
         y1KwZMhUUW7GrMdyiFtuSI2s0bX2INtAtyPGjAx25KeEugsQ76Fu81WUo/f7fW8eJmgO
         QpwrEWd33f7QVXvkTO54j18J9TC8Bzmp9ivDsK6Cc728QQtjX6IDMlqDK+ygchFt9xW8
         xtQsKTXXES9VoQSevuyyef4gOdofsycu4z2s2ueXd5T7jbUfDteog+5FztuS+ebSJVI8
         DXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:list-unsubscribe-post
         :list-unsubscribe:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=F3oPlj/buEl49Mox03zwHlGxcMdbiRuAiif37zeLlB4=;
        b=SCcIK1ZuMuUNtv1DCtcuDsIOQphVgn6x8FuAdEwASgqcAfpITP1WYEc7APJoibSQ8S
         PIrJKFbcNb1iAgg7KqjnvEWawE5vfnOFm2E6AOnBkyfzH8fUXAdm/kG7UgY3vuddbVkv
         htCQd86d27ju7/HSCfgo3Zlqhu7kr5VBr4FIsgssMTdwHFlBYMYD/WXaP4cjxb0AaKEi
         6IVubhJfZDfNSV+h91TZLPFFT6l3VqeXdSaNW0+MQiNDfN5TD89z8N/9/uuA/cS1f/OG
         J+kXIWkopz4Q/ubz8atsk82VkYPoUS9vF2+mM5DTDEkOTbt1s8uVxD28yLl5vVB14INS
         YY7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8hR8gPs30rDrL39w9KY2WF6fCCQ7VE0Rk9+i1P5Uy5Kc+S7jxo
	DNx/FO+t/LwigiZmmiDCQTY=
X-Google-Smtp-Source: AGRyM1vfY/R3+NJaujQoFg3AX7dyRP00C9b6CdloFkkTnUqX5Sp6PjUpNDjfJXpiCZg4CnLfg4ctGw==
X-Received: by 2002:a1c:e90c:0:b0:3a1:7527:cd3c with SMTP id q12-20020a1ce90c000000b003a17527cd3cmr10973250wmc.91.1656650586694;
        Thu, 30 Jun 2022 21:43:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:47ce:0:b0:21d:339f:dc1 with SMTP id o14-20020a5d47ce000000b0021d339f0dc1ls7354244wrc.0.gmail;
 Thu, 30 Jun 2022 21:43:05 -0700 (PDT)
X-Received: by 2002:a05:6000:137c:b0:21b:994a:a6e1 with SMTP id q28-20020a056000137c00b0021b994aa6e1mr11682844wrz.636.1656650585354;
        Thu, 30 Jun 2022 21:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656650585; cv=none;
        d=google.com; s=arc-20160816;
        b=JVHt7twHxNEM/WyCYYq9yIdjK8/ZMfGz+Dh3ogg7ZPSTr/aezsoyzf9qRlfthXBIiY
         jblILPV95uU6uMBSvW5JM/xEUmFsOXAqV96De66i9NSEqbtyVmBIyWVazS3ZiSmIyZev
         0oe4VeoxVXKIidDqzLuQhjH6gOa2Vi2Vy6/2XmhkjgGUXAGGude0rXBy2mU5ILCeXRRy
         KMVocepdMsxF+kjZg2EK0RHm4Gc1qU+N25oWnMApsZZ1X3Nw+6izf399S9I0bC3k2R5T
         l6FB9rp60TH/XpTZI6b1ZK00kyMX0kUZiKZZlL1m7K/DOMJt/w/nemfnlpjy6hkG77cE
         RK0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:list-unsubscribe
         :list-unsubscribe-post:mime-version:dkim-signature;
        bh=Qp61fT0c4UUK2cFfpkEXNr7k5vGbtPqY+T0U/rJLYNA=;
        b=RR1mXw0Q69x5+x+DOt3KNRifMNj13M0ntR5VqvcDYhJtXIaxu+km81P4UqT03+ZaV7
         dbpAiX/kz4jctMb0PVPqCGTQ8xAV5MRa1zPMfbhq6zSU/6WIVymuHsQGEZZ4i4xdO2eK
         enDWGcv+kxwFYXEgu4oqCTKx+49QxEFIxkr08IC9UQcTiXuk8NDwtHkRvcbhD5pgtBQe
         J5LJVQ+efTfAsmXEr+cf+Gcg1uTnkoLBLG+uaRJX23ZUd/ALVYn7bheZtxNHTqvvnSxe
         uym2teXlx/st5AsXgejwws//sU8iGcP3mKCvMMLCG43zY4g3oVbbT1ocT07S/Ow0MtbN
         QtFQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@rtu-ac-in.20210112.gappssmtp.com header.s=20210112 header.b="ga/pBaYL";
       spf=neutral (google.com: 2a00:1450:4864:20::22a is neither permitted nor denied by best guess record for domain of conf3@rtu.ac.in) smtp.mailfrom=conf3@rtu.ac.in
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com. [2a00:1450:4864:20::22a])
        by gmr-mx.google.com with ESMTPS id k2-20020a5d6282000000b0021b88d047efsi503958wru.5.2022.06.30.21.43.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 21:43:05 -0700 (PDT)
Received-SPF: neutral (google.com: 2a00:1450:4864:20::22a is neither permitted nor denied by best guess record for domain of conf3@rtu.ac.in) client-ip=2a00:1450:4864:20::22a;
Received: by mail-lj1-x22a.google.com with SMTP id bx13so1233606ljb.1
        for <jailhouse-dev@googlegroups.com>; Thu, 30 Jun 2022 21:43:05 -0700 (PDT)
X-Received: by 2002:a2e:a484:0:b0:25a:8c94:3763 with SMTP id
 h4-20020a2ea484000000b0025a8c943763mr6918169lji.64.1656650584444; Thu, 30 Jun
 2022 21:43:04 -0700 (PDT)
Received: from 1008170693301 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jun 2022 23:43:03 -0500
MIME-Version: 1.0
List-Unsubscribe-Post: List-Unsubscribe=One-Click
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
From: General Chairs CIS 2022 <conf3@rtu.ac.in>
Date: Thu, 30 Jun 2022 23:43:03 -0500
Message-ID: <CAMbzENZ7G_fk29j1B3mrdtFitRmofPFEgTsOSrM6q+6FRd0NBA@mail.gmail.com>
Subject: CIS 2022: SCOPUS indexed LNNS series of Springer | CHRIST Bangalore, India
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="0000000000009a5efa05e2b7053a"
X-Original-Sender: conf3@rtu.ac.in
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@rtu-ac-in.20210112.gappssmtp.com header.s=20210112
 header.b="ga/pBaYL";       spf=neutral (google.com: 2a00:1450:4864:20::22a is
 neither permitted nor denied by best guess record for domain of
 conf3@rtu.ac.in) smtp.mailfrom=conf3@rtu.ac.in
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>

--0000000000009a5efa05e2b7053a
Content-Type: text/plain; charset="UTF-8"

 Dear Professor,

Greetings from CHRIST (Deemed to be University), Bangalore, India and Soft
Computing Research Society India

We are pleased to inform you that  CHRIST (Deemed to be University),
Bangalore in association with Soft Computing Research Society, New Delhi,
India is going to organize the *3rd Congress on Intelligent Systems
(CIS 2022)* in virtual format. The details of the CIS 2022 are as follows:

*Title of the conference:* 3rd Congress on Intelligent Systems (CIS 2022).

*Website: **https://www.cis2022.scrs.in/ <https://www.cis2022.scrs.in/>*

*After Conference Proceedings:* Lecture Notes in Networks and Systems.

*Indexing of the Proceedings: * SCOPUS, INSPEC, WTI Frankfurt eG, zbMATH,
SCImago. All books published in the series are submitted for consideration
in the Web of Science.

*Date of the conference:* September 05-06, 2022, *Mode of the
Conference:* In-person
and Online (Hybrid Mode)

*Venue: *Department of CSE, School of Engineering & Technology, CHRIST
(Deemed to be University), Bangalore, Kengeri Campus, India.

*T**opics to be covered (but are not limited to):*  Intelligent Systems,
Artificial Intelligence, Machine Learning, Data Science, Robotic devices
and systems, Computational intelligence

*Paper Submission Link:*  https://easychair.org/conferences/?conf=cis22
<https://conf3rtuacin-dot-mmanalytics.appspot.com/em_XVIY31rTvLq6ntIktRLS?url=https%3A%2F%2Feasychair.org%2Fconferences%2F%3Fconf%3Dcis22&key=32e20c26e14da6b4f6229ccd1acd0324dd3d15a6>

*Important Dates: *
             Last date of full paper submission: July 10, 2022
             Notification of acceptance: August 10, 2022
             Registration and final paper submission of accepted Paper:
August 20, 2022

*Contact us through email*: scrs.cis@gmail.com if you have any queries.

You are requested to share this call for paper with your esteemed research
faculty and research scholars. Thank you very much for your kind
support and understanding.

With Best Regards,
Prof. Balachandran K
Dr. Harish Sharma
Dr. Jagdish Chand Bansal
Prof. Joong Hoon Kim
Dr. Sandeep Kumar
*(General Chairs, CIS 2022)*
To stop getting email from it, please click *Here
<https://conf3rtuacin-dot-mmanalytics.appspot.com/em_XVIY31rTvLq6ntIktRLS/unsubscribe?hash=MWQ2NWIxOWFhM2FhN2I5NmM2MjlhN2E1NzI2NTRkMTk0YThiZmI4MzpqYWlsaG91c2UtZGV2QGdvb2dsZWdyb3Vwcy5jb20=&>*

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAMbzENZ7G_fk29j1B3mrdtFitRmofPFEgTsOSrM6q%2B6FRd0NBA%40mail.gmail.com.

--0000000000009a5efa05e2b7053a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


<div style=3D"color:rgb(34,34,34);background-color:rgb(255,255,255)"><font =
face=3D"arial, sans-serif">Dear Professor,</font></div><div style=3D"color:=
rgb(34,34,34);background-color:rgb(255,255,255)"><font face=3D"arial, sans-=
serif"><br></font></div><div style=3D"background-color:rgb(255,255,255)"><d=
iv style=3D"color:rgb(34,34,34)"><font face=3D"arial, sans-serif">Greetings=
 from=C2=A0</font><span style=3D"font-family:arial,sans-serif">CHRIST (Deem=
ed to be University), Bangalore, India and=C2=A0</span><span style=3D"font-=
family:arial,sans-serif">Soft Computing Research Society India</span></div>=
<div style=3D""><font face=3D"arial, sans-serif" style=3D"color:rgb(34,34,3=
4)"><br>We are pleased to inform you that=C2=A0 CHRIST (Deemed to be Univer=
sity), Bangalore=C2=A0in association with Soft Computing Research Society, =
New Delhi, India=C2=A0is going to organize the=C2=A0<b>3rd Congress on Inte=
lligent Systems (CIS=C2=A02022)</b>=C2=A0in virtual format. The details of =
the=C2=A0CIS=C2=A02022=C2=A0are as follows:<br><br><font color=3D"#0b5394">=
<b>Title of the conference:</b></font>=C2=A03rd Congress on Intelligent Sys=
tems (CIS=C2=A02022).</font><div style=3D"color:rgb(34,34,34)"><font color=
=3D"#0b5394" style=3D"font-family:arial,sans-serif"><b><br></b></font></div=
><div style=3D""><font color=3D"#0b5394" style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif"><b>Website:=C2=A0</b></font><font color=3D"#0b5394=
" face=3D"arial, sans-serif"><b><a href=3D"https://www.cis2022.scrs.in/">ht=
tps://www.cis2022.scrs.in/</a></b></font></div><div style=3D"color:rgb(34,3=
4,34)"><font face=3D"arial, sans-serif"><font color=3D"#0b5394"><b><br></b>=
</font></font></div><div style=3D"color:rgb(34,34,34)"><font face=3D"arial,=
 sans-serif"><b>After Conference Proceedings:</b><font color=3D"#222222">=
=C2=A0Lecture Notes in Networks and Systems.</font></font></div><div style=
=3D"color:rgb(34,34,34)"><div><b style=3D"font-family:arial,sans-serif"><fo=
nt color=3D"#0b5394"><br></font></b></div><div><b style=3D"font-family:aria=
l,sans-serif"><font color=3D"#0b5394">Indexing of the Proceedings:=C2=A0</f=
ont></b><font color=3D"#222222" face=3D"arial, sans-serif">=C2=A0SCOPUS, IN=
SPEC, WTI Frankfurt eG, zbMATH, SCImago.=C2=A0All books published in the se=
ries are submitted for consideration in the Web of Science.</font><br></div=
><div><div><font face=3D"arial, sans-serif"><font color=3D"#0b5394"><b><br>=
</b></font></font></div><div><font face=3D"arial, sans-serif"><b>Date of th=
e conference:</b><font color=3D"#222222">=C2=A0September 05-06,=C2=A0</font=
>2022<font color=3D"#222222">,=C2=A0</font><b>Mode of the Conference:</b><f=
ont color=3D"#222222">=C2=A0In-person and Online (Hybrid Mode)=C2=A0</font>=
</font></div></div></div></div></div><div style=3D"color:rgb(34,34,34);back=
ground-color:rgb(255,255,255)"><div><div><div><font face=3D"arial, sans-ser=
if"><b><font color=3D"#0b5394"><br></font></b></font></div><div><font face=
=3D"arial, sans-serif"><b><font color=3D"#0b5394">Venue:</font>=C2=A0</b>De=
partment of CSE, School of Engineering &amp; Technology, CHRIST (Deemed to =
be University), Bangalore, Kengeri Campus, India.</font></div><div><font co=
lor=3D"#0b5394" style=3D"font-family:arial,sans-serif"><b><br></b></font></=
div><div><font color=3D"#0b5394" style=3D"font-family:arial,sans-serif"><b>=
T</b></font><font color=3D"#0b5394" style=3D"font-family:arial,sans-serif">=
<b>opics to be covered (but are not limited to):</b></font><span style=3D"f=
ont-family:arial,sans-serif">=C2=A0 Intelligent Systems, Artificial Intelli=
gence, Machine Learning, Data Science, Robotic devices and systems, Computa=
tional intelligence</span></div><div><b style=3D"font-family:arial,sans-ser=
if"><font color=3D"#0b5394"><br></font></b></div><div><b style=3D"font-fami=
ly:arial,sans-serif"><font color=3D"#0b5394">Paper Submission Link:</font><=
/b><span style=3D"font-family:arial,sans-serif">=C2=A0=C2=A0</span><a href=
=3D"https://conf3rtuacin-dot-mmanalytics.appspot.com/em_XVIY31rTvLq6ntIktRL=
S?url=3Dhttps%3A%2F%2Feasychair.org%2Fconferences%2F%3Fconf%3Dcis22&amp;key=
=3D32e20c26e14da6b4f6229ccd1acd0324dd3d15a6" target=3D"_blank" style=3D"col=
or:rgb(17,85,204)">https://easychair.org/<wbr>conferences/?conf=3Dcis22</a>=
<br></div><div><font face=3D"arial, sans-serif"><br><b><font color=3D"#0b53=
94">Important Dates:=C2=A0</font></b></font></div><div><font face=3D"arial,=
 sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Last date of f=
ull paper submission: July 10, 2022<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Notification of acceptance: August 10, 2022<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Registration and final paper submission o=
f accepted Paper:=C2=A0 August 20, 2022<br><br><font color=3D"#0b5394"><b>C=
ontact us through email</b></font>:=C2=A0<a href=3D"mailto:scrs.cis@gmail.c=
om" rel=3D"noreferrer" target=3D"_blank" style=3D"color:rgb(17,85,204)">scr=
s.cis@gmail.com</a>=C2=A0if you have any queries.</font></div><div><font fa=
ce=3D"arial, sans-serif"><br></font></div><div><span style=3D"font-family:a=
rial,sans-serif;text-align:justify">You are requested to share this call fo=
r paper with your esteemed research faculty and research scholars. Thank yo=
u very much for your kind support=C2=A0and understanding.=C2=A0</span><font=
 face=3D"arial, sans-serif"><br></font></div><div><span style=3D"font-famil=
y:arial,sans-serif;text-align:justify"><br></span></div><div><font face=3D"=
arial, sans-serif">With Best Regards,<br>Prof. Balachandran K</font></div><=
div><font face=3D"arial, sans-serif">Dr. Harish Sharma</font></div><div><fo=
nt face=3D"arial, sans-serif">Dr. Jagdish Chand Bansal</font></div><div><fo=
nt face=3D"arial, sans-serif">Prof. Joong Hoon Kim=C2=A0</font></div><div><=
font face=3D"arial, sans-serif">Dr. Sandeep Kumar<br></font></div><div><fon=
t color=3D"#0b5394" face=3D"arial, sans-serif"><b>(General Chairs,=C2=A0CIS=
 2022)</b></font></div></div></div></div><font face=3D"arial, sans-serif" s=
tyle=3D"color:rgb(34,34,34);background-color:rgb(255,255,255);text-align:ju=
stify"><span style=3D"line-height:15.3333px;background-image:initial;backgr=
ound-position:initial;background-size:initial;background-repeat:initial;bac=
kground-origin:initial;background-clip:initial"><span style=3D"white-space:=
pre-wrap">To stop getting email from it, please click <b><a href=3D"https:/=
/conf3rtuacin-dot-mmanalytics.appspot.com/em_XVIY31rTvLq6ntIktRLS/unsubscri=
be?hash=3DMWQ2NWIxOWFhM2FhN2I5NmM2MjlhN2E1NzI2NTRkMTk0YThiZmI4MzpqYWlsaG91c=
2UtZGV2QGdvb2dsZWdyb3Vwcy5jb20=3D&amp;">Here</a></b></span></span></font><i=
mg src=3D"https://conf3rtuacin-dot-mmanalytics.appspot.com/em_XVIY31rTvLq6n=
tIktRLS/asteroid.gif" style=3D"display:none !important;">

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAMbzENZ7G_fk29j1B3mrdtFitRmofPFEgTsOSrM6q%2B6FRd0=
NBA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAMbzENZ7G_fk29j1B3mrdtFitRmofPFEgTsOSrM6=
q%2B6FRd0NBA%40mail.gmail.com</a>.<br />

--0000000000009a5efa05e2b7053a--
