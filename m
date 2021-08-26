Return-Path: <jailhouse-dev+bncBC653PXTYYERBI6TTWEQMGQEI6G2N4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id 117F93F852C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Aug 2021 12:15:06 +0200 (CEST)
Received: by mail-qk1-x740.google.com with SMTP id x19-20020a05620a099300b003f64d79cbbasf1527029qkx.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Aug 2021 03:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XKQATjJRwNYRfUtyGEr0mSDSDVPJKofWafCRb4xtwG8=;
        b=MOLdA+B7rBzO6C9SaPSAqCC+EQZ7R5YTBlYzMQwr/JQbJGgzM0LnjPscH79gv5rrED
         zIwI7Og0tpOrLsIri8X+7cNZUMNDH2Ojh3Xn3ohDvrPaKjrkE6XYdFwMsRUDfhetSLIp
         5pSyhDtFPyP9DRKLzIHKzifR4VlQJk4VCV8qjpP+k3nAgniPt1WehgLa2GUiUiixZO79
         FrzqGx6wgTEZKDBzADgrgpkYr1IYfSZEsMPUvT6FsgNn69+AgOJZdFkoL/3/RBZ6qla1
         XVvJW4+0vWwErY2BJVbgmHS4KTZp5/jPRlzZsVIkHDLDTWmPfjXwtuQBSSnbsjCR1JPN
         JDFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XKQATjJRwNYRfUtyGEr0mSDSDVPJKofWafCRb4xtwG8=;
        b=Tb+ldLaYuvu02Y4BN8BlDtzHTmdxZNB1AuB35WqwSKMBHwcrVH5Wrl4RTiDZLGZaeu
         W5+MGorxxO2btkck/B5QsgWGhcAhoHMLdHoLbd6f99wUd0SvVr5NKAcsF6OOH6D3ISYn
         PHv7jFUUPm+yfrBP4siCiErzcP7ZS4JcbNiM3ieQAcDwc4f2/tBXuhjNYdpyStq22S4z
         JBvnzJeS0b6XmksD5jtuc+5p6LlpSb0Sso09cWaHqek30WPmdwTy/NEPabE3DsbnScQY
         UwT5T048nrJUCsOHuXtCvIOlduwuDQz9Amz/77UcOEuLGwLqXEx33DO+t6FsyD6fS+1U
         2ouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XKQATjJRwNYRfUtyGEr0mSDSDVPJKofWafCRb4xtwG8=;
        b=T8JIJzp8NL0AhjDSHLgTo1vb+lyvpspQIybb64Pu1zks2AMjaS48NX392DIFVhB3KD
         pQ8HwtaIwZDks9Ux1f97mioNT8PppSRg0QTvIEUajObAbLsZgTxjdVOImpJljtTmR4XQ
         x5qpKY/bLD7WfMhhQ4cxnUYc+DcvNMCrS5+vv3HWPLd4HmEVBVMvdDvdY+Gr03BYWje5
         UXuC3uVZ84cCueZqKlQK1CBI7WeWO6V3hEVh8vW/RAqfTtmZilpQ5exkws1C/deGdkqM
         I38EooXlaT5mdo2X7PZFeg+DQ/Tp1azeGDubPUWtIR0tX8tK3cd+2rhZ8g6evd6fBnGr
         KpFg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5319mQZAlPpJVVxXgEnqOO6Z952IhoLKCzE1wu+l7hid3Duh45zo
	4hcqxNAWGaO6HqgNLLpfn84=
X-Google-Smtp-Source: ABdhPJzmw+N+/c6RLWFmsXeZ4QMPVDIa59ZpiL6c0zD6pz3du6SJDTfiGGU29YcAiBTwnd7DStDbIA==
X-Received: by 2002:a37:9d09:: with SMTP id g9mr2809021qke.269.1629972899661;
        Thu, 26 Aug 2021 03:14:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:f4c6:: with SMTP id o6ls1111602qvm.7.gmail; Thu, 26 Aug
 2021 03:14:59 -0700 (PDT)
X-Received: by 2002:ad4:5346:: with SMTP id v6mr2864163qvs.40.1629972898844;
        Thu, 26 Aug 2021 03:14:58 -0700 (PDT)
Date: Thu, 26 Aug 2021 03:14:58 -0700 (PDT)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b4f1c9f2-a2e9-4e6c-a8dc-1f6fd261fee3n@googlegroups.com>
Subject: FreeRTOS on Raspberry Pi 4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2264_151118056.1629972898297"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_2264_151118056.1629972898297
Content-Type: multipart/alternative; 
	boundary="----=_Part_2265_496976549.1629972898297"

------=_Part_2265_496976549.1629972898297
Content-Type: text/plain; charset="UTF-8"

Hello, 
I am trying to use FreeRTOS on Raspberry Pi 4 5.3 kernel and jailhouse 
forked from:
https://github.com/siemens/jailhouse.git

Fork Link:
https://github.com/mustafa13e09940/jailhouse.git

I edited string.h and added FreeRTOS source code to inmates/lib/include 
The problem that I have now is compiling, I got these errors

I tried previously to make my own scheduler on assembly, but I though 
FreeRTOS would be more feasible. 

I am not sure what modification, that I require to enable Free RTOS on a 
jailhouse cell.

 CC      
/home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64/../arm/gic-demo.o
/tmp/ccm8j1fg.s: Assembler messages:
/tmp/ccm8j1fg.s:987: Error: unknown mnemonic `swi' -- `swi 0'
/tmp/ccm8j1fg.s:1112: Error: unknown mnemonic `swi' -- `swi 0'
/tmp/ccm8j1fg.s:1315: Error: unknown mnemonic `swi' -- `swi 0'
/tmp/ccm8j1fg.s:1486: Error: unknown mnemonic `swi' -- `swi 0'
/tmp/ccm8j1fg.s:1663: Error: unknown mnemonic `stmdb' -- `stmdb SP!,{R0}'
/tmp/ccm8j1fg.s:1664: Error: operand 1 must be an integer register -- `mrs 
R0,CPSR'
/tmp/ccm8j1fg.s:1665: Error: operand 1 must be a SIMD vector register -- 
`orr R0,R0,#0xC0'
/tmp/ccm8j1fg.s:1666: Error: unknown or missing system register name at 
operand 1 -- `msr CPSR,R0'
/tmp/ccm8j1fg.s:1667: Error: unknown mnemonic `ldmia' -- `ldmia SP!,{R0}'
/tmp/ccm8j1fg.s:2161: Error: unknown mnemonic `swi' -- `swi 0'
/tmp/ccm8j1fg.s:2241: Error: unknown mnemonic `swi' -- `swi 0'
/tmp/ccm8j1fg.s:2308: Error: unknown mnemonic `swi' -- `swi 0'
/tmp/ccm8j1fg.s:2352: Error: unknown mnemonic `swi' -- `swi 0'
/tmp/ccm8j1fg.s:2693: Error: unknown mnemonic `swi' -- `swi 0'
make[4]: *** [scripts/Makefile.build:281: 
/home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64/../arm/gic-demo.o] 
Error 1
make[3]: *** [scripts/Makefile.build:497: 
/home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64] Error 2
make[2]: *** [scripts/Makefile.build:497: 
/home/pi/repo_jailhouse/jailhouse/inmates] Error 2
make[1]: *** [Makefile:1629: _module_/home/pi/repo_jailhouse/jailhouse] 
Error 2
make: *** [Makefile:40: modules] Error 2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b4f1c9f2-a2e9-4e6c-a8dc-1f6fd261fee3n%40googlegroups.com.

------=_Part_2265_496976549.1629972898297
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,&nbsp;<br>I am trying to use FreeRTOS on Raspberry Pi 4 5.3 kernel an=
d jailhouse forked from:<br>https://github.com/siemens/jailhouse.git<br><br=
>Fork Link:<br>https://github.com/mustafa13e09940/jailhouse.git<br><div><br=
></div><div>I edited string.h and added FreeRTOS source code to inmates/lib=
/include&nbsp;<br>The problem that I have now is compiling, I got these err=
ors<br><br>I tried previously to make my own scheduler on assembly, but I t=
hough FreeRTOS would be more feasible.&nbsp;<br><br>I am not sure what modi=
fication, that I require to enable Free RTOS on a jailhouse cell.<br><br><d=
iv>&nbsp;CC&nbsp; &nbsp; &nbsp; /home/pi/repo_jailhouse/jailhouse/inmates/d=
emos/arm64/../arm/gic-demo.o</div><div>/tmp/ccm8j1fg.s: Assembler messages:=
</div><div>/tmp/ccm8j1fg.s:987: Error: unknown mnemonic `swi' -- `swi 0'</d=
iv><div>/tmp/ccm8j1fg.s:1112: Error: unknown mnemonic `swi' -- `swi 0'</div=
><div>/tmp/ccm8j1fg.s:1315: Error: unknown mnemonic `swi' -- `swi 0'</div><=
div>/tmp/ccm8j1fg.s:1486: Error: unknown mnemonic `swi' -- `swi 0'</div><di=
v>/tmp/ccm8j1fg.s:1663: Error: unknown mnemonic `stmdb' -- `stmdb SP!,{R0}'=
</div><div>/tmp/ccm8j1fg.s:1664: Error: operand 1 must be an integer regist=
er -- `mrs R0,CPSR'</div><div>/tmp/ccm8j1fg.s:1665: Error: operand 1 must b=
e a SIMD vector register -- `orr R0,R0,#0xC0'</div><div>/tmp/ccm8j1fg.s:166=
6: Error: unknown or missing system register name at operand 1 -- `msr CPSR=
,R0'</div><div>/tmp/ccm8j1fg.s:1667: Error: unknown mnemonic `ldmia' -- `ld=
mia SP!,{R0}'</div><div>/tmp/ccm8j1fg.s:2161: Error: unknown mnemonic `swi'=
 -- `swi 0'</div><div>/tmp/ccm8j1fg.s:2241: Error: unknown mnemonic `swi' -=
- `swi 0'</div><div>/tmp/ccm8j1fg.s:2308: Error: unknown mnemonic `swi' -- =
`swi 0'</div><div>/tmp/ccm8j1fg.s:2352: Error: unknown mnemonic `swi' -- `s=
wi 0'</div><div>/tmp/ccm8j1fg.s:2693: Error: unknown mnemonic `swi' -- `swi=
 0'</div><div>make[4]: *** [scripts/Makefile.build:281: /home/pi/repo_jailh=
ouse/jailhouse/inmates/demos/arm64/../arm/gic-demo.o] Error 1</div><div>mak=
e[3]: *** [scripts/Makefile.build:497: /home/pi/repo_jailhouse/jailhouse/in=
mates/demos/arm64] Error 2</div><div>make[2]: *** [scripts/Makefile.build:4=
97: /home/pi/repo_jailhouse/jailhouse/inmates] Error 2</div><div>make[1]: *=
** [Makefile:1629: _module_/home/pi/repo_jailhouse/jailhouse] Error 2</div>=
<div>make: *** [Makefile:40: modules] Error 2</div></div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b4f1c9f2-a2e9-4e6c-a8dc-1f6fd261fee3n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/b4f1c9f2-a2e9-4e6c-a8dc-1f6fd261fee3n%40googlegroups.co=
m</a>.<br />

------=_Part_2265_496976549.1629972898297--

------=_Part_2264_151118056.1629972898297--
