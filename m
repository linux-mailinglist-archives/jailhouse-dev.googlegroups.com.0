Return-Path: <jailhouse-dev+bncBD2KJCOQRYJRBE5OTGCQMGQEEWUM5JI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73e.google.com (mail-qk1-x73e.google.com [IPv6:2607:f8b0:4864:20::73e])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C6438AE4C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 May 2021 14:33:25 +0200 (CEST)
Received: by mail-qk1-x73e.google.com with SMTP id p133-20020a37428b0000b02902de31dd8da3sf12322205qka.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 May 2021 05:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jCj2rcb9HNZnb0P/R/cND8w3L0pl2T/VW1Rg8nNdQ/s=;
        b=fIt0ihYd0Ptm9uzdb6uuDGKftCRiqbTGssxGJ91+9VEtI1jh5c3luQD8+AbYb3DFjL
         Oznvw1VZa39FIPyl1bcBeaYFEqI+OEQLzq7YH1bWIxgYbARGdKjv8KFDtWO0egWPV/qG
         t2tDASClINpPflYmsWpd1inzpEsU49CdfRpCW53lX9VAm3IYHe+Q3ddOYMLADZ4AvdYI
         cT126Bamnn4BQJLq7fFliAybRfD9nV4uCH8/aKkjL3phs/A1SLVGfxpwiIdVO07WbpKS
         Fx3x58G2X1ZFmJUxc+ApP59twuVHqlvrnncD+5nzBkufmT210HbT8IQJeAWbl9A/xe3w
         4t8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cimware-in.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jCj2rcb9HNZnb0P/R/cND8w3L0pl2T/VW1Rg8nNdQ/s=;
        b=HD5bmysI2czq3LUAdnP02RcsUA3i3OJ3db+LAgi+9mtOnZxRPDCxs0PNHYhJZklIWE
         bT8L3F9/GZDKU89zx+/yZ5kjiDMTxbeonw+erj9+mQ2JbdyediyofKqY5me6GxAnQlai
         fzMB/X/1s1li/qQAd+xSCOqKIs1+w9U0K6OfnNcDlmtCIEsA8AoHBo/T8TDidDN7af3z
         B/qe7YqoCoTX0PPKSxkCCsh1JCU7P9gqOqArE/MZoyed9gall/zBn5yE3efqrYu2WnxZ
         0AqkgVjJEPClhks18n8W37sH6TW8YzuHiIHDDv5e1p159xDRLCtklfXelpWafsuJRlUE
         YtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jCj2rcb9HNZnb0P/R/cND8w3L0pl2T/VW1Rg8nNdQ/s=;
        b=DMAboLedzW8R6r7jKMuUKZb7ijFiUc0Fat+ELvojvlo8TwqbT0fYOMwvj8ISz7Wvas
         aszd8NX3VCcUZR7R95ijVm0UYtLzuS7XjNLDzTaENlY+MORd/vlJ6XXnue9i1jfcnRsz
         RwwQcqCvode9CERmvzjs06/Q7VkI9S3qiVS0PTlKPLXAUCmzCqsUdxicqRQln8wXgeUr
         fRS+LhhQZf6Yp0OP3P2mlF7NtobbQGOsO+57fHNp6TPCS82rF4iKs1mOKpcKFpJgtSSC
         UTCo32wvKnwqcO0pQJPlHjN1v2pkdSB+73oITddzk4TBY/DjxCLGppgCxAKk8j5MsKeD
         jUcQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531skQManm8JeCm7PoKcQ2uy10OuV9PT10R9HnZlHudC60ea0AsB
	7H7C9BJE4/H+fYnMMClMio8=
X-Google-Smtp-Source: ABdhPJwlu0u11Gjtqg1mt4w+9SvwvtPOOenaWhfNEteykWyYqhtaf7UNcuQ86tHXQ6Xkvrq8phAf6Q==
X-Received: by 2002:ac8:1483:: with SMTP id l3mr4861641qtj.142.1621514004094;
        Thu, 20 May 2021 05:33:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:6bd7:: with SMTP id b23ls1344419qtt.4.gmail; Thu, 20 May
 2021 05:33:23 -0700 (PDT)
X-Received: by 2002:ac8:7d15:: with SMTP id g21mr4676815qtb.351.1621514003048;
        Thu, 20 May 2021 05:33:23 -0700 (PDT)
Date: Thu, 20 May 2021 05:33:22 -0700 (PDT)
From: Kannan Sivaraman <kannan@cimware.in>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <da8d930c-4b0e-4970-a239-737db3f8af72n@googlegroups.com>
Subject: COMPILER ERROR WITH CENTOS 8 KERNEL VERSION 4.18
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2372_1420902991.1621514002297"
X-Original-Sender: kannan@cimware.in
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

------=_Part_2372_1420902991.1621514002297
Content-Type: multipart/alternative; 
	boundary="----=_Part_2373_1096388306.1621514002297"

------=_Part_2373_1096388306.1621514002297
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
   I tried to make "jailhouse" on Centos 8 kernel version - =20
4.18.0-240.22.1.el8_3.x86_64.

i get the following errors. Can someone help please.

thanks,

CC [M] /home/kannans/jh/jailhouse/driver/main.o=20
/home/kannans/jh/jailhouse/driver/main.c:63: warning: "MSR_IA32_FEAT_CTL"=
=20
redefined #define MSR_IA32_FEAT_CTL MSR_IA32_FEATURE_CONTROL In file=20
included from ./arch/x86/include/asm/nospec-branch.h:11, from=20
./arch/x86/include/asm/paravirt_types.h:48, from=20
./arch/x86/include/asm/ptrace.h:92, from=20
./arch/x86/include/asm/math_emu.h:5, from=20
./arch/x86/include/asm/processor.h:12, from=20
./arch/x86/include/asm/cpufeature.h:5, from=20
./arch/x86/include/asm/thread_info.h:53, from=20
./include/linux/thread_info.h:38, from ./arch/x86/include/asm/preempt.h:7,=
=20
from ./include/linux/preempt.h:78, from ./include/linux/spinlock.h:51, from=
=20
./include/linux/seqlock.h:36, from ./include/linux/time.h:6, from=20
./include/linux/stat.h:19, from ./include/linux/module.h:10, from=20
/home/kannans/jh/jailhouse/driver/main.c:19:=20
./arch/x86/include/asm/msr-index.h:571: note: this is the location of the=
=20
previous definition #define MSR_IA32_FEAT_CTL 0x0000003a=20
/home/kannans/jh/jailhouse/driver/main.c:64: warning:=20
"FEAT_CTL_VMX_ENABLED_OUTSIDE_SMX" redefined #define=20
FEAT_CTL_VMX_ENABLED_OUTSIDE_SMX \ In file included from=20
./arch/x86/include/asm/nospec-branch.h:11, from=20
./arch/x86/include/asm/paravirt_types.h:48, from=20
./arch/x86/include/asm/ptrace.h:92, from=20
./arch/x86/include/asm/math_emu.h:5, from=20
./arch/x86/include/asm/processor.h:12, from=20
./arch/x86/include/asm/cpufeature.h:5, from=20
./arch/x86/include/asm/thread_info.h:53, from=20
./include/linux/thread_info.h:38, from ./arch/x86/include/asm/preempt.h:7,=
=20
from ./include/linux/preempt.h:78, from ./include/linux/spinlock.h:51, from=
=20
./include/linux/seqlock.h:36, from ./include/linux/time.h:6, from=20
./include/linux/stat.h:19, from ./include/linux/module.h:10, from=20
/home/kannans/jh/jailhouse/driver/main.c:19:=20
./arch/x86/include/asm/msr-index.h:574: note: this is the location of the=
=20
previous definition #define FEAT_CTL_VMX_ENABLED_OUTSIDE_SMX BIT(2)=20
/home/kannans/jh/jailhouse/driver/main.c:111:28: error:=20
=E2=80=98lapic_timer_frequency=E2=80=99 undeclared here (not in a function)=
; did you mean=20
=E2=80=98lapic_timer_period=E2=80=99? #define lapic_timer_period lapic_time=
r_frequency=20
^~~~~~~~~~~~~~~~~~~~~ /home/kannans/jh/jailhouse/driver/main.c:114:15:=20
note: in expansion of macro =E2=80=98lapic_timer_period=E2=80=99 static=20
typeof(lapic_timer_period) *lapic_timer_period_sym; ^~~~~~~~~~~~~~~~~~ In=
=20
file included from ./arch/x86/include/asm/msr.h:246, from=20
./arch/x86/include/asm/processor.h:21, from=20
./arch/x86/include/asm/cpufeature.h:5, from=20
./arch/x86/include/asm/thread_info.h:53, from=20
./include/linux/thread_info.h:38, from ./arch/x86/include/asm/preempt.h:7,=
=20
from ./include/linux/preempt.h:78, from ./include/linux/spinlock.h:51, from=
=20
./include/linux/seqlock.h:36, from ./include/linux/time.h:6, from=20
./include/linux/stat.h:19, from ./include/linux/module.h:10, from=20
/home/kannans/jh/jailhouse/driver/main.c:19:=20
/home/kannans/jh/jailhouse/driver/main.c: In function=20
=E2=80=98jailhouse_cmd_enable=E2=80=99: /home/kannans/jh/jailhouse/driver/m=
ain.c:63:29:=20
error: =E2=80=98MSR_IA32_FEATURE_CONTROL=E2=80=99 undeclared (first use in =
this function);=20
did you mean =E2=80=98MSR_MISC_FEATURE_CONTROL=E2=80=99? #define MSR_IA32_F=
EAT_CTL=20
MSR_IA32_FEATURE_CONTROL ^~~~~~~~~~~~~~~~~~~~~~~~=20
./arch/x86/include/asm/paravirt.h:145:26: note: in definition of macro=20
=E2=80=98rdmsrl=E2=80=99 val =3D paravirt_read_msr(msr); \ ^~~=20
/home/kannans/jh/jailhouse/driver/main.c:428:10: note: in expansion of=20
macro =E2=80=98MSR_IA32_FEAT_CTL=E2=80=99 rdmsrl(MSR_IA32_FEAT_CTL, feature=
s);=20
^~~~~~~~~~~~~~~~~ /home/kannans/jh/jailhouse/driver/main.c:63:29: note:=20
each undeclared identifier is reported only once for each function it=20
appears in #define MSR_IA32_FEAT_CTL MSR_IA32_FEATURE_CONTROL=20
^~~~~~~~~~~~~~~~~~~~~~~~ ./arch/x86/include/asm/paravirt.h:145:26: note: in=
=20
definition of macro =E2=80=98rdmsrl=E2=80=99 val =3D paravirt_read_msr(msr)=
; \ ^~~=20
/home/kannans/jh/jailhouse/driver/main.c:428:10: note: in expansion of=20
macro =E2=80=98MSR_IA32_FEAT_CTL=E2=80=99 rdmsrl(MSR_IA32_FEAT_CTL, feature=
s);=20
^~~~~~~~~~~~~~~~~ /home/kannans/jh/jailhouse/driver/main.c:65:2: error:=20
=E2=80=98FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_SMX=E2=80=99 undeclared (fir=
st use in this=20
function); did you mean =E2=80=98FEAT_CTL_VMX_ENABLED_OUTSIDE_SMX=E2=80=99?=
=20
FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_SMX=20
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=20
/home/kannans/jh/jailhouse/driver/main.c:65:2: note: in definition of macro=
=20
=E2=80=98FEAT_CTL_VMX_ENABLED_OUTSIDE_SMX=E2=80=99=20
FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_SMX=20
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ make[3]: ***=20
[scripts/Makefile.build:316: /home/kannans/jh/jailhouse/driver/main.o]=20
Error 1 make[2]: *** [scripts/Makefile.build:556:=20
/home/kannans/jh/jailhouse/driver] Error 2 make[1]: *** [Makefile:1544:=20
_module_/home/kannans/jh/jailhouse] Error 2 make: *** [Makefile:40:=20
modules] Error 2

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/da8d930c-4b0e-4970-a239-737db3f8af72n%40googlegroups.com.

------=_Part_2373_1096388306.1621514002297
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div>&nbsp; &nbsp;I tried to make "jailhouse" on Centos 8 kernel version=
 -&nbsp; 4.18.0-240.22.1.el8_3.x86_64.</div><div><br></div><div>i get the f=
ollowing errors. Can someone help please.</div><div><br></div><div>thanks,<=
br><div><br></div><div>CC [M]  /home/kannans/jh/jailhouse/driver/main.o
/home/kannans/jh/jailhouse/driver/main.c:63: warning: "MSR_IA32_FEAT_CTL" r=
edefined
 #define MSR_IA32_FEAT_CTL   MSR_IA32_FEATURE_CONTROL
=20
In file included from ./arch/x86/include/asm/nospec-branch.h:11,
                 from ./arch/x86/include/asm/paravirt_types.h:48,
                 from ./arch/x86/include/asm/ptrace.h:92,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:12,
                 from ./arch/x86/include/asm/cpufeature.h:5,
                 from ./arch/x86/include/asm/thread_info.h:53,
                 from ./include/linux/thread_info.h:38,
                 from ./arch/x86/include/asm/preempt.h:7,
                 from ./include/linux/preempt.h:78,
                 from ./include/linux/spinlock.h:51,
                 from ./include/linux/seqlock.h:36,
                 from ./include/linux/time.h:6,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:10,
                 from /home/kannans/jh/jailhouse/driver/main.c:19:
./arch/x86/include/asm/msr-index.h:571: note: this is the location of the p=
revious definition
 #define MSR_IA32_FEAT_CTL  0x0000003a
=20
/home/kannans/jh/jailhouse/driver/main.c:64: warning: "FEAT_CTL_VMX_ENABLED=
_OUTSIDE_SMX" redefined
 #define FEAT_CTL_VMX_ENABLED_OUTSIDE_SMX \
=20
In file included from ./arch/x86/include/asm/nospec-branch.h:11,
                 from ./arch/x86/include/asm/paravirt_types.h:48,
                 from ./arch/x86/include/asm/ptrace.h:92,
                 from ./arch/x86/include/asm/math_emu.h:5,
                 from ./arch/x86/include/asm/processor.h:12,
                 from ./arch/x86/include/asm/cpufeature.h:5,
                 from ./arch/x86/include/asm/thread_info.h:53,
                 from ./include/linux/thread_info.h:38,
                 from ./arch/x86/include/asm/preempt.h:7,
                 from ./include/linux/preempt.h:78,
                 from ./include/linux/spinlock.h:51,
                 from ./include/linux/seqlock.h:36,
                 from ./include/linux/time.h:6,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:10,
                 from /home/kannans/jh/jailhouse/driver/main.c:19:
./arch/x86/include/asm/msr-index.h:574: note: this is the location of the p=
revious definition
 #define FEAT_CTL_VMX_ENABLED_OUTSIDE_SMX BIT(2)
=20
/home/kannans/jh/jailhouse/driver/main.c:111:28: error: =E2=80=98lapic_time=
r_frequency=E2=80=99 undeclared here (not in a function); did you mean =E2=
=80=98lapic_timer_period=E2=80=99?
 #define lapic_timer_period lapic_timer_frequency
                            ^~~~~~~~~~~~~~~~~~~~~
/home/kannans/jh/jailhouse/driver/main.c:114:15: note: in expansion of macr=
o =E2=80=98lapic_timer_period=E2=80=99
 static typeof(lapic_timer_period) *lapic_timer_period_sym;
               ^~~~~~~~~~~~~~~~~~
In file included from ./arch/x86/include/asm/msr.h:246,
                 from ./arch/x86/include/asm/processor.h:21,
                 from ./arch/x86/include/asm/cpufeature.h:5,
                 from ./arch/x86/include/asm/thread_info.h:53,
                 from ./include/linux/thread_info.h:38,
                 from ./arch/x86/include/asm/preempt.h:7,
                 from ./include/linux/preempt.h:78,
                 from ./include/linux/spinlock.h:51,
                 from ./include/linux/seqlock.h:36,
                 from ./include/linux/time.h:6,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:10,
                 from /home/kannans/jh/jailhouse/driver/main.c:19:
/home/kannans/jh/jailhouse/driver/main.c: In function =E2=80=98jailhouse_cm=
d_enable=E2=80=99:
/home/kannans/jh/jailhouse/driver/main.c:63:29: error: =E2=80=98MSR_IA32_FE=
ATURE_CONTROL=E2=80=99 undeclared (first use in this function); did you mea=
n =E2=80=98MSR_MISC_FEATURE_CONTROL=E2=80=99?
 #define MSR_IA32_FEAT_CTL   MSR_IA32_FEATURE_CONTROL
                             ^~~~~~~~~~~~~~~~~~~~~~~~
./arch/x86/include/asm/paravirt.h:145:26: note: in definition of macro =E2=
=80=98rdmsrl=E2=80=99
  val =3D paravirt_read_msr(msr);  \
                          ^~~
/home/kannans/jh/jailhouse/driver/main.c:428:10: note: in expansion of macr=
o =E2=80=98MSR_IA32_FEAT_CTL=E2=80=99
   rdmsrl(MSR_IA32_FEAT_CTL, features);
          ^~~~~~~~~~~~~~~~~
/home/kannans/jh/jailhouse/driver/main.c:63:29: note: each undeclared ident=
ifier is reported only once for each function it appears in
 #define MSR_IA32_FEAT_CTL   MSR_IA32_FEATURE_CONTROL
                             ^~~~~~~~~~~~~~~~~~~~~~~~
./arch/x86/include/asm/paravirt.h:145:26: note: in definition of macro =E2=
=80=98rdmsrl=E2=80=99
  val =3D paravirt_read_msr(msr);  \
                          ^~~
/home/kannans/jh/jailhouse/driver/main.c:428:10: note: in expansion of macr=
o =E2=80=98MSR_IA32_FEAT_CTL=E2=80=99
   rdmsrl(MSR_IA32_FEAT_CTL, features);
          ^~~~~~~~~~~~~~~~~
/home/kannans/jh/jailhouse/driver/main.c:65:2: error: =E2=80=98FEATURE_CONT=
ROL_VMXON_ENABLED_OUTSIDE_SMX=E2=80=99 undeclared (first use in this functi=
on); did you mean =E2=80=98FEAT_CTL_VMX_ENABLED_OUTSIDE_SMX=E2=80=99?
  FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_SMX
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/kannans/jh/jailhouse/driver/main.c:65:2: note: in definition of macro=
 =E2=80=98FEAT_CTL_VMX_ENABLED_OUTSIDE_SMX=E2=80=99
  FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_SMX
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [scripts/Makefile.build:316: /home/kannans/jh/jailhouse/driver=
/main.o] Error 1
make[2]: *** [scripts/Makefile.build:556: /home/kannans/jh/jailhouse/driver=
] Error 2
make[1]: *** [Makefile:1544: _module_/home/kannans/jh/jailhouse] Error 2
make: *** [Makefile:40: modules] Error 2<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/da8d930c-4b0e-4970-a239-737db3f8af72n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/da8d930c-4b0e-4970-a239-737db3f8af72n%40googlegroups.co=
m</a>.<br />

------=_Part_2373_1096388306.1621514002297--

------=_Part_2372_1420902991.1621514002297--
