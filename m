Return-Path: <jailhouse-dev+bncBC653PXTYYERBH7WT6EQMGQEDIIMRLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3d.google.com (mail-qv1-xf3d.google.com [IPv6:2607:f8b0:4864:20::f3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 5404B3F8FB3
	for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Aug 2021 22:35:44 +0200 (CEST)
Received: by mail-qv1-xf3d.google.com with SMTP id w6-20020a0cfc46000000b00370b0997afesf906920qvp.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Aug 2021 13:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=I0Vng7gNjuxecMNJVxPL0aVHJq1weP04tACdFlYtryk=;
        b=PALx7J62p67nCQmojIsL+u1liXUtmbCR494B4c7eMR1bze2mmPwI0EAp3zY0ZPzRF4
         BJ+8cisFHlzC5gYZ451Lp1SZKXn4YqvJuTOx/9G9uITGfzypechXLO+RfRfg1aargGwj
         1X8TUqmiQJVZHVfSsKajJiK2Y1aO/eFnra6qvp8qnAoSAoDLNYS8TK27iZCDTEkXLch8
         tydCKemhXknx8Wq0+tDlce/ydLn7JhEGkDDkQFDH6U1QLK0e2lAn37Su1Sy+e7ivxLg3
         53olNZ17jmXAF0Be/ZZgntXLsxLBENKPaxa8rxADM3PCvtR5EVFiwxLBTYO3P25MaluO
         JOWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=I0Vng7gNjuxecMNJVxPL0aVHJq1weP04tACdFlYtryk=;
        b=oOznt0/Dos5T8ti9lgRBiz4CM9qDTOuYVdKg+648OgeKY+68T77vPltPBC7ASmO1xP
         yU+xE/9D+ZSQl6NnExu0/M0uPiXv1B4sl1w8MUXgAS4/105VJYxGQftT4sarPntwMaNO
         PU6kPg+hAqzI+dUyHKGwqWLml+ZpXfvEupNZfTfGlO10Y4RyVkjlT/N1g/VZq7dJfqDi
         kMFJIKXHY1696MLsGeTbvCG0TgFSFhSOQ3WGCrftJhkWpZY/2DihfOqHn/um4Qhpi0SU
         a+aNXPVCRK07Lr4LFDRxYMpJq+NJfoRba6Z7RIF5Nnl2L7174ccYdcWlNGTy0eyHXOo9
         sQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=I0Vng7gNjuxecMNJVxPL0aVHJq1weP04tACdFlYtryk=;
        b=snI5XAX8dO8rNIfWepX7B3mr7GaTPDkuRyb8/AE5Rw9Sx4beVLDSJDDy2kuktKLDkv
         Hm/+tr60lgye8ZmT13vkhcHv2vfzbrhBLCkkvFZnhJuflk4+pQm2pvEctvEfQ3iWml2z
         INKKT3C/RR0UBv7IXEanlV4rtjhP9ZND5QL/NdP3iazQwFhJxSBu/9+hCpSsn7NURFpZ
         TPWhGA5NqLDyvK3WpaL50stfXYEeyX5COuV3SA6fkGzjdB+5cOXSZuGlBBiKM7d+hmc0
         lB5pUOIqh5/VGUEgYVUIrs2/V3Z0UcSMDTgc8DP10wYFvOmh/0UcUHLmU1Bn7wF9sD7X
         S1RQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533sjcJRZg5n+DQu6KgAP1hSj2HsDhb1jHkQUyOwJF1KniXm7xFt
	a/7tm05C70jFh60EwV76S8c=
X-Google-Smtp-Source: ABdhPJxtA5Nd3o/A7D0Q4Bb5Fy/uRU0mEgU3LhQum68BPK9v35zUR6K2RHQnLWWeX89j9FgF1qhwXw==
X-Received: by 2002:a0c:ab08:: with SMTP id h8mr6223375qvb.41.1630010143260;
        Thu, 26 Aug 2021 13:35:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:4d53:: with SMTP id m19ls2173142qvm.0.gmail; Thu, 26 Aug
 2021 13:35:42 -0700 (PDT)
X-Received: by 2002:ad4:5247:: with SMTP id s7mr5947061qvq.58.1630010142339;
        Thu, 26 Aug 2021 13:35:42 -0700 (PDT)
Date: Thu, 26 Aug 2021 13:35:41 -0700 (PDT)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <69e5e06f-3483-45b8-819b-3e7f54653138n@googlegroups.com>
In-Reply-To: <6c30c54f-7dff-b8f0-f4fe-6da67ab97fc9@siemens.com>
References: <b4f1c9f2-a2e9-4e6c-a8dc-1f6fd261fee3n@googlegroups.com>
 <f8fd58f2-57bf-b2cd-25c1-6a5b01b6fcfc@oth-regensburg.de>
 <6c30c54f-7dff-b8f0-f4fe-6da67ab97fc9@siemens.com>
Subject: Re: FreeRTOS on Raspberry Pi 4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_634_1564521077.1630010141778"
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

------=_Part_634_1564521077.1630010141778
Content-Type: multipart/alternative; 
	boundary="----=_Part_635_185029985.1630010141778"

------=_Part_635_185029985.1630010141778
Content-Type: text/plain; charset="UTF-8"

>>Yes, set JAILHOUSE_CELL_AARCH32 in the cell configs' flags field.  
I added this flag to rpi4.c
.header = {
.signature = JAILHOUSE_SYSTEM_SIGNATURE,
.revision = JAILHOUSE_CONFIG_REVISION,
.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE | JAILHOUSE_CELL_AARCH32,

I am just wondering, if it possible to do a bare metal context switching in 
assembly?

On Thursday, 26 August 2021 at 22:10:22 UTC+2 j.kiszka...@gmail.com wrote:

> On 26.08.21 21:38, Ralf Ramsauer wrote:
> > Moustafa,
> > 
> > On 26/08/2021 12:14, Moustafa Nofal wrote:
> >> Hello, 
> >> I am trying to use FreeRTOS on Raspberry Pi 4 5.3 kernel and jailhouse
> >> forked from:
> >> https://github.com/siemens/jailhouse.git
> >>
> >> Fork Link:
> >> https://github.com/mustafa13e09940/jailhouse.git
> >>
> >> I edited string.h and added FreeRTOS source code to inmates/lib/include 
> >> The problem that I have now is compiling, I got these errors
> >>
> >> I tried previously to make my own scheduler on assembly, but I though
> >> FreeRTOS would be more feasible. 
> >>
> >> I am not sure what modification, that I require to enable Free RTOS on a
> >> jailhouse cell.
> >>
> >>  CC     
> >> /home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64/../arm/gic-demo.o
> >> /tmp/ccm8j1fg.s: Assembler messages:
> >> /tmp/ccm8j1fg.s:987: Error: unknown mnemonic `swi' -- `swi 0'
> >> /tmp/ccm8j1fg.s:1112: Error: unknown mnemonic `swi' -- `swi 0'
> >> /tmp/ccm8j1fg.s:1315: Error: unknown mnemonic `swi' -- `swi 0'
> >> /tmp/ccm8j1fg.s:1486: Error: unknown mnemonic `swi' -- `swi 0'
> >> /tmp/ccm8j1fg.s:1663: Error: unknown mnemonic `stmdb' -- `stmdb 
> SP!,{R0}'
> >> /tmp/ccm8j1fg.s:1664: Error: operand 1 must be an integer register --
> >> `mrs R0,CPSR'
> >> /tmp/ccm8j1fg.s:1665: Error: operand 1 must be a SIMD vector register --
> >> `orr R0,R0,#0xC0'
> >> /tmp/ccm8j1fg.s:1666: Error: unknown or missing system register name at
> >> operand 1 -- `msr CPSR,R0'
> >> /tmp/ccm8j1fg.s:1667: Error: unknown mnemonic `ldmia' -- `ldmia 
> SP!,{R0}'
> >> /tmp/ccm8j1fg.s:2161: Error: unknown mnemonic `swi' -- `swi 0'
> >> /tmp/ccm8j1fg.s:2241: Error: unknown mnemonic `swi' -- `swi 0'
> >> /tmp/ccm8j1fg.s:2308: Error: unknown mnemonic `swi' -- `swi 0'
> >> /tmp/ccm8j1fg.s:2352: Error: unknown mnemonic `swi' -- `swi 0'
> >> /tmp/ccm8j1fg.s:2693: Error: unknown mnemonic `swi' -- `swi 0'
> >> make[4]: *** [scripts/Makefile.build:281:
> >> /home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64/../arm/gic-demo.o]
> >> Error 1
> >> make[3]: *** [scripts/Makefile.build:497:
> >> /home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64] Error 2
> >> make[2]: *** [scripts/Makefile.build:497:
> >> /home/pi/repo_jailhouse/jailhouse/inmates] Error 2
> >> make[1]: *** [Makefile:1629: _module_/home/pi/repo_jailhouse/jailhouse]
> >> Error 2
> >> make: *** [Makefile:40: modules] Error 2
> > 
> > This is where you took the source from, right?
> > https://github.com/jameswalmsley/RaspberryPi-FreeRTOS
> > 
> > This is a 32-bit port of FreeRTOS, but Jailhouse uses the 64-bit ARMv8
> > on the RPi4.
> > 
> > I don't know if it's possible to switch back to 32-bit mode is possible,
> > I guess Jan knows.
> > 
>
> Yes, set JAILHOUSE_CELL_AARCH32 in the cell configs' flags field.
>
> Jan
>
> -- 
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/69e5e06f-3483-45b8-819b-3e7f54653138n%40googlegroups.com.

------=_Part_635_185029985.1630010141778
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

&gt;&gt;Yes, set JAILHOUSE_CELL_AARCH32 in the cell configs' flags field.&n=
bsp;&nbsp;<br>I added this flag to rpi4.c<br><div><span style=3D"white-spac=
e:pre">	</span>.header =3D {</div><div><span style=3D"white-space:pre">		</=
span>.signature =3D JAILHOUSE_SYSTEM_SIGNATURE,</div><div><span style=3D"wh=
ite-space:pre">		</span>.revision =3D JAILHOUSE_CONFIG_REVISION,</div><div>=
<span style=3D"white-space:pre">		</span>.flags =3D JAILHOUSE_SYS_VIRTUAL_D=
EBUG_CONSOLE | JAILHOUSE_CELL_AARCH32,<br><br>I am just wondering, if it po=
ssible to do a bare metal context switching in assembly?</div><br><div clas=
s=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Thursday, 26 Au=
gust 2021 at 22:10:22 UTC+2 j.kiszka...@gmail.com wrote:<br/></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px so=
lid rgb(204, 204, 204); padding-left: 1ex;">On 26.08.21 21:38, Ralf Ramsaue=
r wrote:
<br>&gt; Moustafa,
<br>&gt;=20
<br>&gt; On 26/08/2021 12:14, Moustafa Nofal wrote:
<br>&gt;&gt; Hello,=C2=A0
<br>&gt;&gt; I am trying to use FreeRTOS on Raspberry Pi 4 5.3 kernel and j=
ailhouse
<br>&gt;&gt; forked from:
<br>&gt;&gt; <a href=3D"https://github.com/siemens/jailhouse.git" target=3D=
"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/ur=
l?hl=3Den-GB&amp;q=3Dhttps://github.com/siemens/jailhouse.git&amp;source=3D=
gmail&amp;ust=3D1630095317943000&amp;usg=3DAFQjCNFEcCWfGlRiNOt2OkFzDHo40yzm=
Xg">https://github.com/siemens/jailhouse.git</a>
<br>&gt;&gt;
<br>&gt;&gt; Fork Link:
<br>&gt;&gt; <a href=3D"https://github.com/mustafa13e09940/jailhouse.git" t=
arget=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.googl=
e.com/url?hl=3Den-GB&amp;q=3Dhttps://github.com/mustafa13e09940/jailhouse.g=
it&amp;source=3Dgmail&amp;ust=3D1630095317943000&amp;usg=3DAFQjCNEJzu7jsFO0=
zDEfFMugtMmKLhPw5A">https://github.com/mustafa13e09940/jailhouse.git</a>
<br>&gt;&gt;
<br>&gt;&gt; I edited string.h and added FreeRTOS source code to inmates/li=
b/include=C2=A0
<br>&gt;&gt; The problem that I have now is compiling, I got these errors
<br>&gt;&gt;
<br>&gt;&gt; I tried previously to make my own scheduler on assembly, but I=
 though
<br>&gt;&gt; FreeRTOS would be more feasible.=C2=A0
<br>&gt;&gt;
<br>&gt;&gt; I am not sure what modification, that I require to enable Free=
 RTOS on a
<br>&gt;&gt; jailhouse cell.
<br>&gt;&gt;
<br>&gt;&gt; =C2=A0CC=C2=A0 =C2=A0 =C2=A0
<br>&gt;&gt; /home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64/../arm/g=
ic-demo.o
<br>&gt;&gt; /tmp/ccm8j1fg.s: Assembler messages:
<br>&gt;&gt; /tmp/ccm8j1fg.s:987: Error: unknown mnemonic `swi&#39; -- `swi=
 0&#39;
<br>&gt;&gt; /tmp/ccm8j1fg.s:1112: Error: unknown mnemonic `swi&#39; -- `sw=
i 0&#39;
<br>&gt;&gt; /tmp/ccm8j1fg.s:1315: Error: unknown mnemonic `swi&#39; -- `sw=
i 0&#39;
<br>&gt;&gt; /tmp/ccm8j1fg.s:1486: Error: unknown mnemonic `swi&#39; -- `sw=
i 0&#39;
<br>&gt;&gt; /tmp/ccm8j1fg.s:1663: Error: unknown mnemonic `stmdb&#39; -- `=
stmdb SP!,{R0}&#39;
<br>&gt;&gt; /tmp/ccm8j1fg.s:1664: Error: operand 1 must be an integer regi=
ster --
<br>&gt;&gt; `mrs R0,CPSR&#39;
<br>&gt;&gt; /tmp/ccm8j1fg.s:1665: Error: operand 1 must be a SIMD vector r=
egister --
<br>&gt;&gt; `orr R0,R0,#0xC0&#39;
<br>&gt;&gt; /tmp/ccm8j1fg.s:1666: Error: unknown or missing system registe=
r name at
<br>&gt;&gt; operand 1 -- `msr CPSR,R0&#39;
<br>&gt;&gt; /tmp/ccm8j1fg.s:1667: Error: unknown mnemonic `ldmia&#39; -- `=
ldmia SP!,{R0}&#39;
<br>&gt;&gt; /tmp/ccm8j1fg.s:2161: Error: unknown mnemonic `swi&#39; -- `sw=
i 0&#39;
<br>&gt;&gt; /tmp/ccm8j1fg.s:2241: Error: unknown mnemonic `swi&#39; -- `sw=
i 0&#39;
<br>&gt;&gt; /tmp/ccm8j1fg.s:2308: Error: unknown mnemonic `swi&#39; -- `sw=
i 0&#39;
<br>&gt;&gt; /tmp/ccm8j1fg.s:2352: Error: unknown mnemonic `swi&#39; -- `sw=
i 0&#39;
<br>&gt;&gt; /tmp/ccm8j1fg.s:2693: Error: unknown mnemonic `swi&#39; -- `sw=
i 0&#39;
<br>&gt;&gt; make[4]: *** [scripts/Makefile.build:281:
<br>&gt;&gt; /home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64/../arm/g=
ic-demo.o]
<br>&gt;&gt; Error 1
<br>&gt;&gt; make[3]: *** [scripts/Makefile.build:497:
<br>&gt;&gt; /home/pi/repo_jailhouse/jailhouse/inmates/demos/arm64] Error 2
<br>&gt;&gt; make[2]: *** [scripts/Makefile.build:497:
<br>&gt;&gt; /home/pi/repo_jailhouse/jailhouse/inmates] Error 2
<br>&gt;&gt; make[1]: *** [Makefile:1629: _module_/home/pi/repo_jailhouse/j=
ailhouse]
<br>&gt;&gt; Error 2
<br>&gt;&gt; make: *** [Makefile:40: modules] Error 2
<br>&gt;=20
<br>&gt; This is where you took the source from, right?
<br>&gt; <a href=3D"https://github.com/jameswalmsley/RaspberryPi-FreeRTOS" =
target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.goog=
le.com/url?hl=3Den-GB&amp;q=3Dhttps://github.com/jameswalmsley/RaspberryPi-=
FreeRTOS&amp;source=3Dgmail&amp;ust=3D1630095317943000&amp;usg=3DAFQjCNHsvP=
Ii9cqa8YyGDudZEteKQXmRqA">https://github.com/jameswalmsley/RaspberryPi-Free=
RTOS</a>
<br>&gt;=20
<br>&gt; This is a 32-bit port of FreeRTOS, but Jailhouse uses the 64-bit A=
RMv8
<br>&gt; on the RPi4.
<br>&gt;=20
<br>&gt; I don&#39;t know if it&#39;s possible to switch back to 32-bit mod=
e is possible,
<br>&gt; I guess Jan knows.
<br>&gt;=20
<br>
<br>Yes, set JAILHOUSE_CELL_AARCH32 in the cell configs&#39; flags field.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/69e5e06f-3483-45b8-819b-3e7f54653138n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/69e5e06f-3483-45b8-819b-3e7f54653138n%40googlegroups.co=
m</a>.<br />

------=_Part_635_185029985.1630010141778--

------=_Part_634_1564521077.1630010141778--
