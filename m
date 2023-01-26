Return-Path: <jailhouse-dev+bncBCDKHIWT5EIBB7X2Y6PAMGQEI4MOHSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A8067C3C8
	for <lists+jailhouse-dev@lfdr.de>; Thu, 26 Jan 2023 05:11:44 +0100 (CET)
Received: by mail-yb1-xb3b.google.com with SMTP id c2-20020a25a2c2000000b008016611ca77sf699433ybn.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Jan 2023 20:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n87hZevVHHSen12Xgx1k9ms6CKkooy25/BRBCdmXZBg=;
        b=kR59PysY8soYw+3++30EWOH3RPckoJ3IVjE/AP5ldsyrxuBJex9E8X3XLTrhJFHGmJ
         uGg4cxsBnXZPsjZrY89L/zomCwcFmjpRXw44mmxlDM4UGouGSc4JnbP7CiNAb1aGhJ7G
         /UEFJsJj8/cph/KEzZXZvLA47+AHbx8EEOQVJ/8uwU1pmmm6QBLr8qhDa5sOKXpf0vQi
         1wQIy/nel3H8lpEl6wdtAy2gXefuOC4qH8a4o4tuI7HTQxqofjFAZB0olOzpUV/7+c2e
         xCEqhFT+hY26kv7r1CLsVYOOInibDiv2WrK5h7WdK7+glnp5F0Pm6vxaTbaFMLMiqwu8
         OuVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n87hZevVHHSen12Xgx1k9ms6CKkooy25/BRBCdmXZBg=;
        b=TJYUF/m/3av8Y7SnHGw/wiOcxysW8wMiEev7Td3LroU3k+UrGfBfoalflX+2fXO/el
         QLwn6777is4eh9deGOuF413qGrD6iAAIViJk7r/jTITCGQr/ByrUnVDh3eis9RFqXwwR
         njqPqFcxpA0Iky7TnYrGvTQK3UXS8WsIRsesaNDfJlFtrm3H28UUAOFyIWVMAxxtnzvo
         Q65uxvYtZ3PcW7V3D9jzLgc5lOLjjiW4wRCQ2FBJm/kKPeEyhqR6hrah/o5qDZSYn6IL
         cvIevO9HvGijsNVxrfY331HyczgJaUYG/ldo84ySKMsM8k25lszgrYpy5FzRLvmBcwzG
         ptnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n87hZevVHHSen12Xgx1k9ms6CKkooy25/BRBCdmXZBg=;
        b=pp02/AGs3Y+73Tox42wx5vkUufCJ124AnQsq6tEYCV4fhAgsCxhXBmXPYweYTjmDma
         YUKzz+mz34QXktPKrDSQrEgnIyo5n+wy9yrhCiIEFkYPSD2z/HQvTF+QoOxkm1YbzOO/
         8Yw2N8u4u4cdPpvja4phsB5Lz5ViA3tg+JN0D6UVk+btPOh7KF6QExWNl0GQISId3mak
         cmSyeSD9LBBUwFzAA2ISf8DeQIphLiPzvy1/da4l4cexezqkBeJZEyOEy7UpcQlHD+u0
         l/vIKU1iYBInWoUawhLZ83XqwGrT8lLZxL8kM1LWiERRgHogS8Cnbsj0OWuGmnVzmiuD
         cYyA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kpvDUba0cWjgcva/z2/ySZRSjiSrbozqjPMO0GVgPYlTNsFFDID
	P/I7hWRBuf523H4uUWfHjsw=
X-Google-Smtp-Source: AMrXdXtMaRu/obg1N1M6O4Ng+rT8pEHXqWNEkavGZIBzmq/g034Mv717TCJm6h3a2T0CmDMCTnmVbg==
X-Received: by 2002:a05:6902:287:b0:7db:b02e:3a5b with SMTP id v7-20020a056902028700b007dbb02e3a5bmr3930712ybh.347.1674706302834;
        Wed, 25 Jan 2023 20:11:42 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:690c:f0c:b0:506:e4bd:b95b with SMTP id
 dc12-20020a05690c0f0c00b00506e4bdb95bls577620ywb.1.-pod-prod-gmail; Wed, 25
 Jan 2023 20:11:40 -0800 (PST)
X-Received: by 2002:a05:690c:886:b0:4fd:25ef:8e1f with SMTP id cd6-20020a05690c088600b004fd25ef8e1fmr3091780ywb.166.1674706300183;
        Wed, 25 Jan 2023 20:11:40 -0800 (PST)
Date: Wed, 25 Jan 2023 20:11:39 -0800 (PST)
From: =?UTF-8?B?5byg5a626ZOt?= <j.jyaming@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5380cf64-00a5-4693-9d84-1854854f7d26n@googlegroups.com>
In-Reply-To: <8a390680-d604-9768-ca66-8cbb732f6926@gmail.com>
References: <64c51a19-06d7-5333-c7cb-6581e547bf17@siemens.com>
 <8a390680-d604-9768-ca66-8cbb732f6926@gmail.com>
Subject: Re: 10 years - and still alive!
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1590_1882894942.1674706299177"
X-Original-Sender: j.jyaming@gmail.com
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

------=_Part_1590_1882894942.1674706299177
Content-Type: multipart/alternative; 
	boundary="----=_Part_1591_1018717864.1674706299177"

------=_Part_1591_1018717864.1674706299177
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8C

Happy Birthday to Jailhouse=EF=BC=81This is a meaningful project. Expect to=
 get=20
better and better.

Jiaming
=E5=9C=A82023=E5=B9=B41=E6=9C=8824=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+=
8 15:37:15<valentine...@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A

> On 24.01.2023 00:04, Jan Kiszka wrote:
> > It's been a while and I'm also getting older, so I do not recall anymor=
e
> > when exactly I wrote the first line of Jailhouse code. Maybe about a
> > week earlier. However, my non-public git records start on the 23rd of
> > January, 2013. Therefore, let's use this date to have the party!
> >=20
> > Jailhouse was born out of an intensive discussion with colleagues
> > whether creating the n-th closed-source hypervisor would be the best wa=
y
> > forward. Their idea was that it should be straightforward to create
> > mixed-critical systems once you have a simple partitioning hypervisor i=
n
> > place. That little piece of software would "just" be certified accordin=
g
> > to safety standards - done. I was already skeptical whether it is a goo=
d
> > idea to create yet another hypervisor ourselves, after having worked on
> > various corner-cases on KVM the years before. But I specifically didn't
> > believe it was worth to write that without having the chance to talk
> > about it and the hardware it needs openly with a broader expert
> > community. Still, I also felt like it would be worth exploring such a
> > safety approach (without have much clue about saftey back then).
> >=20
> > I first thought of shrinking down KVM, benefiting from its maturity and
> > "only" reducing its size. But then I realized the limits of this and
> > thought: Why not trying something new, activating the partitioning
> > during runtime? This idea was spinning in my head for some months when
> > an unfortunate change in my personal life made me look for doing
> > something creative. So the first code was written during long evenings
> > and weekends.
> >=20
> > I first worked against KVM as "hardware", so I once again ran into KVM
> > corner cases, this time around nested virtualization. Let's debug the
> > debugger, and have even more (hacker) fun!
> >=20
> > Around the 10th of February, the first vmlaunch succeeded, still in KVM=
.
> > Only if you ever have tried that yourself, you know how hard it is to
> > make vmlaunch happy and to find out why it is still not (think of
> > "docker run" would only return -EINVAL, whatever you feed in). Even wit=
h
> > KVM, this was not easy to understand although some consistency checks
> > happen in software there. On the 10th of March, the first inmate
> > launched, the famous apic-demo. Still in KVM, still as a spare-time
> > project.
> >=20
> > Then on the 20th of March, I added support for starting KVM on my work
> > notebook, a Fujitsu Celsius H700. What was missing for this jump from
> > KVM to real silicon? Actually just a minor adjustment to CR0 handling
> > where KVM was more relaxed than actual CPUs turned out to be.
> >=20
> > With this demo in hands, literally, I went to my bosses, shared my idea
> > and vision, made the point that this would only fly if it became open
> > source and asked for the OK to publish it. And to drive this further
> > towards that safety idea.
> >=20
> > Long-story short(er): The informal approval came quickly, the formal
> > process still took a bit longer. But for the presentation of Jailhouse
> > at the KVM Forum 2013 [1] the baseline finally went public on github.
> >=20
> > My real baseline did not - so far. But this little celebration story
> > already became so long - and I did not even talk about what we learned
> > about safety, software and hardware in the past 10 years -, I think 131=
0
> > lines of the real Jailhouse baseline patch do not matter. See below.
> >=20
> > Now let's celebrate. Not just those few first months. We need to
> > celebrate much more you all, dear contributors! You made out of 404
> > lines of code over 50000, added two further architectures (part of the
> > pitch to my bosses which I didn't fully believe to happen that quickly)=
,
> > with another one on the horizon, enabled Jailhouse on dozens of
> > different targets, and kept it alive. Thank you all!
>
> Hooray!
>
> It was a pleasure working with you guys during the project start.
> It's a shame (on me) that AMD AVIC support code got stuck in my private=
=20
> branch [1] around 2016, once again due to unfortunate change in a=20
> personal life, at 80% ready state.
>
> Nice to see RISC-V support is coming, and I'm pretty sure it won't be=20
> the last Jailhous feature merged.
>
> Happy next ten!
>
> Valentine
>
> [1] https://github.com/vsinitsyn/jailhouse
>
> >=20
> > Jan
> >=20
> > [1]=20
> http://www.linux-kvm.org/images/b/b1/Kvm-forum-2013-Static-Partitioning.p=
df
> >=20
> > ---
> >=20
> > From 264de60d953188695eba5d634cafcaec35b9e2e6 Mon Sep 17 00:00:00 2001
> > From: Jan Kiszka <jan.k...@siemens.com>
> > Date: Wed, 23 Jan 2013 21:33:10 +0100
> > Subject: [PATCH] Baseline
> >=20
> > Contains build system, loader module, hypervisor skeleton and user spac=
e
> > tool to send enable/disable commands.
> >=20
> > Signed-off-by: Jan Kiszka <jan.k...@siemens.com>
> > ---
> > .gitignore | 9 +
> > COPYING | 339 +++++++++++++++++++++
> > Makefile | 31 ++
> > hypervisor/Makefile | 38 +++
> > hypervisor/arch/x86/Makefile | 15 +
> > hypervisor/arch/x86/apic.c | 28 ++
> > hypervisor/arch/x86/dbg-write.c | 33 ++
> > hypervisor/arch/x86/include/asm/bitops.h | 49 +++
> > hypervisor/arch/x86/include/asm/io.h | 25 ++
> > hypervisor/arch/x86/include/asm/spinlock.h | 31 ++
> > hypervisor/arch/x86/include/asm/types.h | 23 ++
> > hypervisor/hypervisor.ld | 39 +++
> > hypervisor/include/jailhouse/header.h | 20 ++
> > hypervisor/include/jailhouse/printk.h | 15 +
> > hypervisor/include/jailhouse/processor.h | 13 +
> > hypervisor/printk.c | 92 ++++++
> > hypervisor/setup.c | 32 ++
> > jailhouse.h | 16 +
> > main.c | 192 ++++++++++++
> > tools/Makefile | 20 ++
> > tools/jailhouse.c | 67 ++++
> > 21 files changed, 1127 insertions(+)
> > create mode 100644 .gitignore
> > create mode 100644 COPYING
> > create mode 100644 Makefile
> > create mode 100644 hypervisor/Makefile
> > create mode 100644 hypervisor/arch/x86/Makefile
> > create mode 100644 hypervisor/arch/x86/apic.c
> > create mode 100644 hypervisor/arch/x86/dbg-write.c
> > create mode 100644 hypervisor/arch/x86/include/asm/bitops.h
> > create mode 100644 hypervisor/arch/x86/include/asm/io.h
> > create mode 100644 hypervisor/arch/x86/include/asm/spinlock.h
> > create mode 100644 hypervisor/arch/x86/include/asm/types.h
> > create mode 100644 hypervisor/hypervisor.ld
> > create mode 100644 hypervisor/include/jailhouse/header.h
> > create mode 100644 hypervisor/include/jailhouse/printk.h
> > create mode 100644 hypervisor/include/jailhouse/processor.h
> > create mode 100644 hypervisor/printk.c
> > create mode 100644 hypervisor/setup.c
> > create mode 100644 jailhouse.h
> > create mode 100644 main.c
> > create mode 100644 tools/Makefile
> > create mode 100644 tools/jailhouse.c
> >=20
> > diff --git a/.gitignore b/.gitignore
> > new file mode 100644
> > index 00000000..6787fb8e
> > --- /dev/null
> > +++ b/.gitignore
> > @@ -0,0 +1,9 @@
> > +*.o
> > +*.mod.[co]
> > +*.cmd
> > +.tmp_versions
> > +Module.symvers
> > +modules.order
> > +jailhouse.ko
> > +hypervisor/jailhouse.bin
> > +tools/jailhouse
> > diff --git a/COPYING b/COPYING
> > new file mode 100644
> > index 00000000..d159169d
> > --- /dev/null
> > +++ b/COPYING
> > @@ -0,0 +1,339 @@
> > + GNU GENERAL PUBLIC LICENSE
> > + Version 2, June 1991
> > +
> > + Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
> > + 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> > + Everyone is permitted to copy and distribute verbatim copies
> > + of this license document, but changing it is not allowed.
> > +
> > + Preamble
> > +
> > + The licenses for most software are designed to take away your
> > +freedom to share and change it. By contrast, the GNU General Public
> > +License is intended to guarantee your freedom to share and change free
> > +software--to make sure the software is free for all its users. This
> > +General Public License applies to most of the Free Software
> > +Foundation's software and to any other program whose authors commit to
> > +using it. (Some other Free Software Foundation software is covered by
> > +the GNU Lesser General Public License instead.) You can apply it to
> > +your programs, too.
> > +
> > + When we speak of free software, we are referring to freedom, not
> > +price. Our General Public Licenses are designed to make sure that you
> > +have the freedom to distribute copies of free software (and charge for
> > +this service if you wish), that you receive source code or can get it
> > +if you want it, that you can change the software or use pieces of it
> > +in new free programs; and that you know you can do these things.
> > +
> > + To protect your rights, we need to make restrictions that forbid
> > +anyone to deny you these rights or to ask you to surrender the rights.
> > +These restrictions translate to certain responsibilities for you if yo=
u
> > +distribute copies of the software, or if you modify it.
> > +
> > + For example, if you distribute copies of such a program, whether
> > +gratis or for a fee, you must give the recipients all the rights that
> > +you have. You must make sure that they, too, receive or can get the
> > +source code. And you must show them these terms so they know their
> > +rights.
> > +
> > + We protect your rights with two steps: (1) copyright the software, an=
d
> > +(2) offer you this license which gives you legal permission to copy,
> > +distribute and/or modify the software.
> > +
> > + Also, for each author's protection and ours, we want to make certain
> > +that everyone understands that there is no warranty for this free
> > +software. If the software is modified by someone else and passed on, w=
e
> > +want its recipients to know that what they have is not the original, s=
o
> > +that any problems introduced by others will not reflect on the origina=
l
> > +authors' reputations.
> > +
> > + Finally, any free program is threatened constantly by software
> > +patents. We wish to avoid the danger that redistributors of a free
> > +program will individually obtain patent licenses, in effect making the
> > +program proprietary. To prevent this, we have made it clear that any
> > +patent must be licensed for everyone's free use or not licensed at all=
.
> > +
> > + The precise terms and conditions for copying, distribution and
> > +modification follow.
> > +
> > + GNU GENERAL PUBLIC LICENSE
> > + TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
> > +
> > + 0. This License applies to any program or other work which contains
> > +a notice placed by the copyright holder saying it may be distributed
> > +under the terms of this General Public License. The "Program", below,
> > +refers to any such program or work, and a "work based on the Program"
> > +means either the Program or any derivative work under copyright law:
> > +that is to say, a work containing the Program or a portion of it,
> > +either verbatim or with modifications and/or translated into another
> > +language. (Hereinafter, translation is included without limitation in
> > +the term "modification".) Each licensee is addressed as "you".
> > +
> > +Activities other than copying, distribution and modification are not
> > +covered by this License; they are outside its scope. The act of
> > +running the Program is not restricted, and the output from the Program
> > +is covered only if its contents constitute a work based on the
> > +Program (independent of having been made by running the Program).
> > +Whether that is true depends on what the Program does.
> > +
> > + 1. You may copy and distribute verbatim copies of the Program's
> > +source code as you receive it, in any medium, provided that you
> > +conspicuously and appropriately publish on each copy an appropriate
> > +copyright notice and disclaimer of warranty; keep intact all the
> > +notices that refer to this License and to the absence of any warranty;
> > +and give any other recipients of the Program a copy of this License
> > +along with the Program.
> > +
> > +You may charge a fee for the physical act of transferring a copy, and
> > +you may at your option offer warranty protection in exchange for a fee=
.
> > +
> > + 2. You may modify your copy or copies of the Program or any portion
> > +of it, thus forming a work based on the Program, and copy and
> > +distribute such modifications or work under the terms of Section 1
> > +above, provided that you also meet all of these conditions:
> > +
> > + a) You must cause the modified files to carry prominent notices
> > + stating that you changed the files and the date of any change.
> > +
> > + b) You must cause any work that you distribute or publish, that in
> > + whole or in part contains or is derived from the Program or any
> > + part thereof, to be licensed as a whole at no charge to all third
> > + parties under the terms of this License.
> > +
> > + c) If the modified program normally reads commands interactively
> > + when run, you must cause it, when started running for such
> > + interactive use in the most ordinary way, to print or display an
> > + announcement including an appropriate copyright notice and a
> > + notice that there is no warranty (or else, saying that you provide
> > + a warranty) and that users may redistribute the program under
> > + these conditions, and telling the user how to view a copy of this
> > + License. (Exception: if the Program itself is interactive but
> > + does not normally print such an announcement, your work based on
> > + the Program is not required to print an announcement.)
> > +
> > +These requirements apply to the modified work as a whole. If
> > +identifiable sections of that work are not derived from the Program,
> > +and can be reasonably considered independent and separate works in
> > +themselves, then this License, and its terms, do not apply to those
> > +sections when you distribute them as separate works. But when you
> > +distribute the same sections as part of a whole which is a work based
> > +on the Program, the distribution of the whole must be on the terms of
> > +this License, whose permissions for other licensees extend to the
> > +entire whole, and thus to each and every part regardless of who wrote=
=20
> it.
> > +
> > +Thus, it is not the intent of this section to claim rights or contest
> > +your rights to work written entirely by you; rather, the intent is to
> > +exercise the right to control the distribution of derivative or
> > +collective works based on the Program.
> > +
> > +In addition, mere aggregation of another work not based on the Program
> > +with the Program (or with a work based on the Program) on a volume of
> > +a storage or distribution medium does not bring the other work under
> > +the scope of this License.
> > +
> > + 3. You may copy and distribute the Program (or a work based on it,
> > +under Section 2) in object code or executable form under the terms of
> > +Sections 1 and 2 above provided that you also do one of the following:
> > +
> > + a) Accompany it with the complete corresponding machine-readable
> > + source code, which must be distributed under the terms of Sections
> > + 1 and 2 above on a medium customarily used for software interchange;=
=20
> or,
> > +
> > + b) Accompany it with a written offer, valid for at least three
> > + years, to give any third party, for a charge no more than your
> > + cost of physically performing source distribution, a complete
> > + machine-readable copy of the corresponding source code, to be
> > + distributed under the terms of Sections 1 and 2 above on a medium
> > + customarily used for software interchange; or,
> > +
> > + c) Accompany it with the information you received as to the offer
> > + to distribute corresponding source code. (This alternative is
> > + allowed only for noncommercial distribution and only if you
> > + received the program in object code or executable form with such
> > + an offer, in accord with Subsection b above.)
> > +
> > +The source code for a work means the preferred form of the work for
> > +making modifications to it. For an executable work, complete source
> > +code means all the source code for all modules it contains, plus any
> > +associated interface definition files, plus the scripts used to
> > +control compilation and installation of the executable. However, as a
> > +special exception, the source code distributed need not include
> > +anything that is normally distributed (in either source or binary
> > +form) with the major components (compiler, kernel, and so on) of the
> > +operating system on which the executable runs, unless that component
> > +itself accompanies the executable.
> > +
> > +If distribution of executable or object code is made by offering
> > +access to copy from a designated place, then offering equivalent
> > +access to copy the source code from the same place counts as
> > +distribution of the source code, even though third parties are not
> > +compelled to copy the source along with the object code.
> > +
> > + 4. You may not copy, modify, sublicense, or distribute the Program
> > +except as expressly provided under this License. Any attempt
> > +otherwise to copy, modify, sublicense or distribute the Program is
> > +void, and will automatically terminate your rights under this License.
> > +However, parties who have received copies, or rights, from you under
> > +this License will not have their licenses terminated so long as such
> > +parties remain in full compliance.
> > +
> > + 5. You are not required to accept this License, since you have not
> > +signed it. However, nothing else grants you permission to modify or
> > +distribute the Program or its derivative works. These actions are
> > +prohibited by law if you do not accept this License. Therefore, by
> > +modifying or distributing the Program (or any work based on the
> > +Program), you indicate your acceptance of this License to do so, and
> > +all its terms and conditions for copying, distributing or modifying
> > +the Program or works based on it.
> > +
> > + 6. Each time you redistribute the Program (or any work based on the
> > +Program), the recipient automatically receives a license from the
> > +original licensor to copy, distribute or modify the Program subject to
> > +these terms and conditions. You may not impose any further
> > +restrictions on the recipients' exercise of the rights granted herein.
> > +You are not responsible for enforcing compliance by third parties to
> > +this License.
> > +
> > + 7. If, as a consequence of a court judgment or allegation of patent
> > +infringement or for any other reason (not limited to patent issues),
> > +conditions are imposed on you (whether by court order, agreement or
> > +otherwise) that contradict the conditions of this License, they do not
> > +excuse you from the conditions of this License. If you cannot
> > +distribute so as to satisfy simultaneously your obligations under this
> > +License and any other pertinent obligations, then as a consequence you
> > +may not distribute the Program at all. For example, if a patent
> > +license would not permit royalty-free redistribution of the Program by
> > +all those who receive copies directly or indirectly through you, then
> > +the only way you could satisfy both it and this License would be to
> > +refrain entirely from distribution of the Program.
> > +
> > +If any portion of this section is held invalid or unenforceable under
> > +any particular circumstance, the balance of the section is intended to
> > +apply and the section as a whole is intended to apply in other
> > +circumstances.
> > +
> > +It is not the purpose of this section to induce you to infringe any
> > +patents or other property right claims or to contest validity of any
> > +such claims; this section has the sole purpose of protecting the
> > +integrity of the free software distribution system, which is
> > +implemented by public license practices. Many people have made
> > +generous contributions to the wide range of software distributed
> > +through that system in reliance on consistent application of that
> > +system; it is up to the author/donor to decide if he or she is willing
> > +to distribute software through any other system and a licensee cannot
> > +impose that choice.
> > +
> > +This section is intended to make thoroughly clear what is believed to
> > +be a consequence of the rest of this License.
> > +
> > + 8. If the distribution and/or use of the Program is restricted in
> > +certain countries either by patents or by copyrighted interfaces, the
> > +original copyright holder who places the Program under this License
> > +may add an explicit geographical distribution limitation excluding
> > +those countries, so that distribution is permitted only in or among
> > +countries not thus excluded. In such case, this License incorporates
> > +the limitation as if written in the body of this License.
> > +
> > + 9. The Free Software Foundation may publish revised and/or new versio=
ns
> > +of the General Public License from time to time. Such new versions wil=
l
> > +be similar in spirit to the present version, but may differ in detail =
to
> > +address new problems or concerns.
> > +
> > +Each version is given a distinguishing version number. If the Program
> > +specifies a version number of this License which applies to it and "an=
y
> > +later version", you have the option of following the terms and=20
> conditions
> > +either of that version or of any later version published by the Free
> > +Software Foundation. If the Program does not specify a version number =
of
> > +this License, you may choose any version ever published by the Free=20
> Software
> > +Foundation.
> > +
> > + 10. If you wish to incorporate parts of the Program into other free
> > +programs whose distribution conditions are different, write to the=20
> author
> > +to ask for permission. For software which is copyrighted by the Free
> > +Software Foundation, write to the Free Software Foundation; we sometim=
es
> > +make exceptions for this. Our decision will be guided by the two goals
> > +of preserving the free status of all derivatives of our free software=
=20
> and
> > +of promoting the sharing and reuse of software generally.
> > +
> > + NO WARRANTY
> > +
> > + 11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO=20
> WARRANTY
> > +FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHE=
N
> > +OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
> > +PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER=20
> EXPRESSED
> > +OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> > +MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK =
AS
> > +TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE
> > +PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICIN=
G,
> > +REPAIR OR CORRECTION.
> > +
> > + 12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN=20
> WRITING
> > +WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
> > +REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR=20
> DAMAGES,
> > +INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES=20
> ARISING
> > +OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT=20
> LIMITED
> > +TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED =
BY
> > +YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY=
=20
> OTHER
> > +PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
> > +POSSIBILITY OF SUCH DAMAGES.
> > +
> > + END OF TERMS AND CONDITIONS
> > +
> > + How to Apply These Terms to Your New Programs
> > +
> > + If you develop a new program, and you want it to be of the greatest
> > +possible use to the public, the best way to achieve this is to make it
> > +free software which everyone can redistribute and change under these=
=20
> terms.
> > +
> > + To do so, attach the following notices to the program. It is safest
> > +to attach them to the start of each source file to most effectively
> > +convey the exclusion of warranty; and each file should have at least
> > +the "copyright" line and a pointer to where the full notice is found.
> > +
> > + <one line to give the program's name and a brief idea of what it does=
.>
> > + Copyright (C) <year> <name of author>
> > +
> > + This program is free software; you can redistribute it and/or modify
> > + it under the terms of the GNU General Public License as published by
> > + the Free Software Foundation; either version 2 of the License, or
> > + (at your option) any later version.
> > +
> > + This program is distributed in the hope that it will be useful,
> > + but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > + GNU General Public License for more details.
> > +
> > + You should have received a copy of the GNU General Public License alo=
ng
> > + with this program; if not, write to the Free Software Foundation, Inc=
.,
> > + 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> > +
> > +Also add information on how to contact you by electronic and paper mai=
l.
> > +
> > +If the program is interactive, make it output a short notice like this
> > +when it starts in an interactive mode:
> > +
> > + Gnomovision version 69, Copyright (C) year name of author
> > + Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show=
=20
> w'.
> > + This is free software, and you are welcome to redistribute it
> > + under certain conditions; type `show c' for details.
> > +
> > +The hypothetical commands `show w' and `show c' should show the=20
> appropriate
> > +parts of the General Public License. Of course, the commands you use m=
ay
> > +be called something other than `show w' and `show c'; they could even =
be
> > +mouse-clicks or menu items--whatever suits your program.
> > +
> > +You should also get your employer (if you work as a programmer) or you=
r
> > +school, if any, to sign a "copyright disclaimer" for the program, if
> > +necessary. Here is a sample; alter the names:
> > +
> > + Yoyodyne, Inc., hereby disclaims all copyright interest in the progra=
m
> > + `Gnomovision' (which makes passes at compilers) written by James=20
> Hacker.
> > +
> > + <signature of Ty Coon>, 1 April 1989
> > + Ty Coon, President of Vice
> > +
> > +This General Public License does not permit incorporating your program=
=20
> into
> > +proprietary programs. If your program is a subroutine library, you may
> > +consider it more useful to permit linking proprietary applications wit=
h=20
> the
> > +library. If this is what you want to do, use the GNU Lesser General
> > +Public License instead of this License.
> > diff --git a/Makefile b/Makefile
> > new file mode 100644
> > index 00000000..2c411e63
> > --- /dev/null
> > +++ b/Makefile
> > @@ -0,0 +1,31 @@
> > +#
> > +# Jailhouse, a Linux-based partioning hypervisor
> > +#
> > +# Copyright (c) Siemens AG, 2013
> > +#
> > +# Authors:
> > +# Jan Kiszka <jan.k...@siemens.com>
> > +#
> > +# This work is licensed under the terms of the GNU GPL, version 2. See
> > +# the COPYING file in the top-level directory.
> > +#
> > +
> > +subdir-y :=3D hypervisor
> > +
> > +obj-m :=3D jailhouse.o
> > +
> > +ccflags-y :=3D -I$(src)/hypervisor/include
> > +
> > +jailhouse-y :=3D main.o
> > +
> > +# out-of-tree build
> > +
> > +KERNELDIR =3D /lib/modules/`uname -r`/build
> > +
> > +modules modules_install clean:
> > + $(MAKE) -C $(KERNELDIR) SUBDIRS=3D`pwd` $@
> > +
> > +install: modules_install
> > + depmod -aq
> > +
> > +.PHONY: modules_install install clean
> > diff --git a/hypervisor/Makefile b/hypervisor/Makefile
> > new file mode 100644
> > index 00000000..a808bdc7
> > --- /dev/null
> > +++ b/hypervisor/Makefile
> > @@ -0,0 +1,38 @@
> > +#
> > +# Jailhouse, a Linux-based partioning hypervisor
> > +#
> > +# Copyright (c) Siemens AG, 2013
> > +#
> > +# Authors:
> > +# Jan Kiszka <jan.k...@siemens.com>
> > +#
> > +# This work is licensed under the terms of the GNU GPL, version 2. See
> > +# the COPYING file in the top-level directory.
> > +#
> > +
> > +LINUXINCLUDE :=3D -I$(src)/arch/$(SRCARCH)/include -I$(src)/include
> > +KBUILD_CFLAGS :=3D -g -Os -Wall -Wstrict-prototypes \
> > + -Wmissing-declarations -Wmissing-prototypes \
> > + -fno-strict-aliasing -fpic -fpie -fno-common
> > +
> > +subdir-y :=3D arch/$(SRCARCH)
> > +
> > +always :=3D jailhouse.bin
> > +
> > +hypervisor-y :=3D setup.o printk.o \
> > + arch/$(SRCARCH)/built-in.o
> > +targets +=3D $(hypervisor-y)
> > +
> > +HYPERVISOR_OBJS =3D $(addprefix $(obj)/,$(hypervisor-y))
> > +
> > +LDFLAGS_hypervisor.o :=3D -T
> > +
> > +targets +=3D hypervisor.o
> > +$(obj)/hypervisor.o: $(src)/hypervisor.ld $(HYPERVISOR_OBJS)
> > + $(call if_changed,ld)
> > +
> > +OBJCOPYFLAGS_jailhouse.bin :=3D -O binary -R .got
> > +
> > +target +=3D jailhouse.bin
> > +$(obj)/jailhouse.bin: $(obj)/hypervisor.o
> > + $(call if_changed,objcopy)
> > diff --git a/hypervisor/arch/x86/Makefile b/hypervisor/arch/x86/Makefil=
e
> > new file mode 100644
> > index 00000000..2db1bf69
> > --- /dev/null
> > +++ b/hypervisor/arch/x86/Makefile
> > @@ -0,0 +1,15 @@
> > +#
> > +# Jailhouse, a Linux-based partioning hypervisor
> > +#
> > +# Copyright (c) Siemens AG, 2013
> > +#
> > +# Authors:
> > +# Jan Kiszka <jan.k...@siemens.com>
> > +#
> > +# This work is licensed under the terms of the GNU GPL, version 2. See
> > +# the COPYING file in the top-level directory.
> > +#
> > +
> > +always :=3D built-in.o
> > +
> > +obj-y :=3D apic.o dbg-write.o
> > diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
> > new file mode 100644
> > index 00000000..c79069c0
> > --- /dev/null
> > +++ b/hypervisor/arch/x86/apic.c
> > @@ -0,0 +1,28 @@
> > +/*
> > + * Jailhouse, a Linux-based partioning hypervisor
> > + *
> > + * Copyright (c) Siemens AG, 2013
> > + *
> > + * Authors:
> > + * Jan Kiszka <jan.k...@siemens.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <jailhouse/processor.h>
> > +#include <asm/types.h>
> > +
> > +// #define APIC_BASE 0xfee00000
> > +#define APIC_BASE 0xffffffffff5f9000 /* Linux mapping */
> > +#define APIC_ID 0x0020
> > +
> > +static unsigned int read_apic(unsigned int reg)
> > +{
> > + return *(volatile u32 *)(long)(APIC_BASE + reg);
> > +}
> > +
> > +int processor_id(void)
> > +{
> > + return read_apic(APIC_ID) >> 24;
> > +}
> > diff --git a/hypervisor/arch/x86/dbg-write.c=20
> b/hypervisor/arch/x86/dbg-write.c
> > new file mode 100644
> > index 00000000..fe9003a3
> > --- /dev/null
> > +++ b/hypervisor/arch/x86/dbg-write.c
> > @@ -0,0 +1,33 @@
> > +/*
> > + * Jailhouse, a Linux-based partioning hypervisor
> > + *
> > + * Copyright (c) Siemens AG, 2013
> > + *
> > + * Authors:
> > + * Jan Kiszka <jan.k...@siemens.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <jailhouse/printk.h>
> > +#include <asm/io.h>
> > +
> > +#define UART_BASE 0x3f8
> > +#define UART_TX 0x0
> > +#define UART_LSR 0x5
> > +#define UART_LSR_THRE 0x20
> > +
> > +void arch_dbg_write(const char *msg)
> > +{
> > + char c;
> > +
> > + while (1) {
> > + c =3D *msg++;
> > + if (!c)
> > + break;
> > + while (!(inb(UART_BASE + UART_LSR) & UART_LSR_THRE))
> > + asm volatile("rep; nop");
> > + outb(c, UART_BASE + UART_TX);
> > + }
> > +}
> > diff --git a/hypervisor/arch/x86/include/asm/bitops.h=20
> b/hypervisor/arch/x86/include/asm/bitops.h
> > new file mode 100644
> > index 00000000..2d6b66ed
> > --- /dev/null
> > +++ b/hypervisor/arch/x86/include/asm/bitops.h
> > @@ -0,0 +1,49 @@
> > +/*
> > + * Jailhouse, a Linux-based partioning hypervisor
> > + *
> > + * Copyright (c) Siemens AG, 2013
> > + *
> > + * Authors:
> > + * Jan Kiszka <jan.k...@siemens.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <asm/types.h>
> > +
> > +#if __GNUC__ < 4 || (__GNUC__ =3D=3D 4 && __GNUC_MINOR__ < 1)
> > +/* Technically wrong, but this avoids compilation errors on some gcc
> > + versions. */
> > +#define BITOP_ADDR(x) "=3Dm" (*(volatile long *) (x))
> > +#else
> > +#define BITOP_ADDR(x) "+m" (*(volatile long *) (x))
> > +#endif
> > +
> > +#define CONST_MASK_ADDR(nr, addr) BITOP_ADDR((void *)(addr) + ((nr)>>3=
))
> > +#define CONST_MASK(nr) (1 << ((nr) & 7))
> > +
> > +static inline __attribute__((always_inline)) void
> > +clear_bit(int nr, volatile unsigned long *addr)
> > +{
> > + if (__builtin_constant_p(nr)) {
> > + asm volatile("lock andb %1,%0"
> > + : CONST_MASK_ADDR(nr, addr)
> > + : "iq" ((u8)~CONST_MASK(nr)));
> > + } else {
> > + asm volatile("lock btr %1,%0"
> > + : BITOP_ADDR(addr)
> > + : "Ir" (nr));
> > + }
> > +}
> > +
> > +static inline int test_and_set_bit(int nr, volatile unsigned long *add=
r)
> > +{
> > + int oldbit;
> > +
> > + asm volatile("lock bts %2,%1\n\t"
> > + "sbb %0,%0" : "=3Dr" (oldbit), BITOP_ADDR(addr)
> > + : "Ir" (nr) : "memory");
> > +
> > + return oldbit;
> > +}
> > diff --git a/hypervisor/arch/x86/include/asm/io.h=20
> b/hypervisor/arch/x86/include/asm/io.h
> > new file mode 100644
> > index 00000000..db900ac7
> > --- /dev/null
> > +++ b/hypervisor/arch/x86/include/asm/io.h
> > @@ -0,0 +1,25 @@
> > +/*
> > + * Jailhouse, a Linux-based partioning hypervisor
> > + *
> > + * Copyright (c) Siemens AG, 2013
> > + *
> > + * Authors:
> > + * Jan Kiszka <jan.k...@siemens.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <asm/types.h>
> > +
> > +static inline void outb(u8 v, u16 port)
> > +{
> > + asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
> > +}
> > +
> > +static inline u8 inb(u16 port)
> > +{
> > + u8 v;
> > + asm volatile("inb %1,%0" : "=3Da" (v) : "dN" (port));
> > + return v;
> > +}
> > diff --git a/hypervisor/arch/x86/include/asm/spinlock.h=20
> b/hypervisor/arch/x86/include/asm/spinlock.h
> > new file mode 100644
> > index 00000000..df632610
> > --- /dev/null
> > +++ b/hypervisor/arch/x86/include/asm/spinlock.h
> > @@ -0,0 +1,31 @@
> > +/*
> > + * Jailhouse, a Linux-based partioning hypervisor
> > + *
> > + * Copyright (c) Siemens AG, 2013
> > + *
> > + * Authors:
> > + * Jan Kiszka <jan.k...@siemens.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <asm/bitops.h>
> > +
> > +typedef struct {
> > + unsigned long state;
> > +} spinlock_t;
> > +
> > +#define DEFINE_SPINLOCK(name) spinlock_t (name)
> > +
> > +static inline void spin_lock(spinlock_t *lock)
> > +{
> > + while (test_and_set_bit(0, &lock->state))
> > + asm volatile("rep; nop");
> > +}
> > +
> > +static inline void spin_unlock(spinlock_t *lock)
> > +{
> > + asm volatile("": : :"memory");
> > + clear_bit(0, &lock->state);
> > +}
> > diff --git a/hypervisor/arch/x86/include/asm/types.h=20
> b/hypervisor/arch/x86/include/asm/types.h
> > new file mode 100644
> > index 00000000..fdb98995
> > --- /dev/null
> > +++ b/hypervisor/arch/x86/include/asm/types.h
> > @@ -0,0 +1,23 @@
> > +/*
> > + * Jailhouse, a Linux-based partioning hypervisor
> > + *
> > + * Copyright (c) Siemens AG, 2013
> > + *
> > + * Authors:
> > + * Jan Kiszka <jan.k...@siemens.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +typedef signed char s8;
> > +typedef unsigned char u8;
> > +
> > +typedef signed short s16;
> > +typedef unsigned short u16;
> > +
> > +typedef signed int s32;
> > +typedef unsigned int u32;
> > +
> > +typedef signed long s64;
> > +typedef unsigned long u64;
> > diff --git a/hypervisor/hypervisor.ld b/hypervisor/hypervisor.ld
> > new file mode 100644
> > index 00000000..d9dbb107
> > --- /dev/null
> > +++ b/hypervisor/hypervisor.ld
> > @@ -0,0 +1,39 @@
> > +/*
> > + * Jailhouse, a Linux-based partioning hypervisor
> > + *
> > + * Copyright (c) Siemens AG, 2013
> > + *
> > + * Authors:
> > + * Jan Kiszka <jan.k...@siemens.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +SECTIONS
> > +{
> > + . =3D 0;
> > + .header : { *(.header) }
> > +
> > + . =3D ALIGN(16);
> > + .text : { *(.text) }
> > +
> > + . =3D ALIGN(16);
> > + .rodata : { *(.rodata) }
> > +
> > + . =3D ALIGN(16);
> > + .data : { *(.data) }
> > +
> > + . =3D ALIGN(16);
> > + .bss : {
> > + __bss_start =3D .;
> > + *(.bss)
> > + __bss_end =3D .;
> > + }
> > +
> > + .got : { *(.got*) }
> > +
> > + /DISCARD/ : {
> > + *(.eh_frame*)
> > + }
> > +}
> > diff --git a/hypervisor/include/jailhouse/header.h=20
> b/hypervisor/include/jailhouse/header.h
> > new file mode 100644
> > index 00000000..f7b26a42
> > --- /dev/null
> > +++ b/hypervisor/include/jailhouse/header.h
> > @@ -0,0 +1,20 @@
> > +/*
> > + * Jailhouse, a Linux-based partioning hypervisor
> > + *
> > + * Copyright (c) Siemens AG, 2013
> > + *
> > + * Authors:
> > + * Jan Kiszka <jan.k...@siemens.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#define JAILHOUSE_SIGNATURE "JAILHOUS"
> > +
> > +struct jailhouse_header {
> > + char signature[8];
> > + unsigned long bss_start;
> > + unsigned long bss_end;
> > + unsigned long entry;
> > +};
> > diff --git a/hypervisor/include/jailhouse/printk.h=20
> b/hypervisor/include/jailhouse/printk.h
> > new file mode 100644
> > index 00000000..8c0af6a3
> > --- /dev/null
> > +++ b/hypervisor/include/jailhouse/printk.h
> > @@ -0,0 +1,15 @@
> > +/*
> > + * Jailhouse, a Linux-based partioning hypervisor
> > + *
> > + * Copyright (c) Siemens AG, 2013
> > + *
> > + * Authors:
> > + * Jan Kiszka <jan.k...@siemens.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +void printk(const char *fmt, ...);
> > +
> > +void arch_dbg_write(const char *msg);
> > diff --git a/hypervisor/include/jailhouse/processor.h=20
> b/hypervisor/include/jailhouse/processor.h
> > new file mode 100644
> > index 00000000..a6907c14
> > --- /dev/null
> > +++ b/hypervisor/include/jailhouse/processor.h
> > @@ -0,0 +1,13 @@
> > +/*
> > + * Jailhouse, a Linux-based partioning hypervisor
> > + *
> > + * Copyright (c) Siemens AG, 2013
> > + *
> > + * Authors:
> > + * Jan Kiszka <jan.k...@siemens.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +int processor_id(void);
> > diff --git a/hypervisor/printk.c b/hypervisor/printk.c
> > new file mode 100644
> > index 00000000..9169b0bd
> > --- /dev/null
> > +++ b/hypervisor/printk.c
> > @@ -0,0 +1,92 @@
> > +/*
> > + * Jailhouse, a Linux-based partioning hypervisor
> > + *
> > + * Copyright (c) Siemens AG, 2013
> > + *
> > + * Authors:
> > + * Jan Kiszka <jan.k...@siemens.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <stdarg.h>
> > +#include <jailhouse/printk.h>
> > +#include <asm/spinlock.h>
> > +
> > +static DEFINE_SPINLOCK(printk_lock);
> > +
> > +static char *int2str(long long value, char *buf)
> > +{
> > + long long digit, divider =3D 1000000000000000000LL;
> > + int first_digit =3D 1;
> > +
> > + if (value < 0) {
> > + *buf++ =3D '-';
> > + value =3D -value;
> > + }
> > +
> > + while (divider > 0) {
> > + digit =3D value / divider;
> > + value %=3D divider;
> > + if (!first_digit || digit > 0 || divider =3D=3D 1) {
> > + *buf++ =3D '0' + digit;
> > + first_digit =3D 0;
> > + }
> > + divider /=3D 10;
> > + }
> > +
> > + return buf;
> > +}
> > +
> > +void printk(const char *fmt, ...)
> > +{
> > + char buf[128];
> > + va_list ap;
> > + char *p;
> > + char c;
> > + int v;
> > +
> > + va_start(ap, fmt);
> > +
> > + p =3D buf;
> > +
> > + spin_lock(&printk_lock);
> > +
> > + while (1) {
> > + c =3D *fmt++;
> > + if (c =3D=3D 0)
> > + break;
> > + else if (c =3D=3D '%') {
> > + *p =3D 0;
> > + arch_dbg_write(buf);
> > + p =3D buf;
> > +
> > + c =3D *fmt++;
> > + switch (c) {
> > + case 'd':
> > + v =3D va_arg(ap, int);
> > + p =3D int2str(v, p);
> > + break;
> > + default:
> > + *p++ =3D '%';
> > + *p++ =3D c;
> > + break;
> > + }
> > + } else
> > + *p++ =3D c;
> > +
> > + if (p >=3D &buf[sizeof(buf) - 1]) {
> > + *p =3D 0;
> > + arch_dbg_write(buf);
> > + p =3D buf;
> > + }
> > + }
> > +
> > + *p =3D 0;
> > + arch_dbg_write(buf);
> > +
> > + spin_unlock(&printk_lock);
> > +
> > + va_end(ap);
> > +}
> > diff --git a/hypervisor/setup.c b/hypervisor/setup.c
> > new file mode 100644
> > index 00000000..37521b60
> > --- /dev/null
> > +++ b/hypervisor/setup.c
> > @@ -0,0 +1,32 @@
> > +/*
> > + * Jailhouse, a Linux-based partioning hypervisor
> > + *
> > + * Copyright (c) Siemens AG, 2013
> > + *
> > + * Authors:
> > + * Jan Kiszka <jan.k...@siemens.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <jailhouse/header.h>
> > +#include <jailhouse/processor.h>
> > +#include <jailhouse/printk.h>
> > +
> > +extern void *__bss_start, *__bss_end;
> > +
> > +static int entry(void)
> > +{
> > + printk("Running hypervisor on CPU %d\n", processor_id());
> > +
> > + return 0;
> > +}
> > +
> > +struct jailhouse_header __attribute__((section(".header")))
> > +hypervisor_header =3D {
> > + .signature =3D JAILHOUSE_SIGNATURE,
> > + .bss_start =3D (unsigned long)&__bss_start,
> > + .bss_end =3D (unsigned long)&__bss_end,
> > + .entry =3D (unsigned long)entry,
> > +};
> > diff --git a/jailhouse.h b/jailhouse.h
> > new file mode 100644
> > index 00000000..fd94a1e1
> > --- /dev/null
> > +++ b/jailhouse.h
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Jailhouse, a Linux-based partioning hypervisor
> > + *
> > + * Copyright (c) Siemens AG, 2013
> > + *
> > + * Authors:
> > + * Jan Kiszka <jan.k...@siemens.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <linux/ioctl.h>
> > +
> > +#define JAILHOUSE_ENABLE _IO(0, 0)
> > +#define JAILHOUSE_DISABLE _IO(0, 1)
> > diff --git a/main.c b/main.c
> > new file mode 100644
> > index 00000000..0e10aa5a
> > --- /dev/null
> > +++ b/main.c
> > @@ -0,0 +1,192 @@
> > +/*
> > + * Jailhouse, a Linux-based partioning hypervisor
> > + *
> > + * Copyright (c) Siemens AG, 2013
> > + *
> > + * Authors:
> > + * Jan Kiszka <jan.k...@siemens.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/device.h>
> > +#include <linux/fs.h>
> > +#include <linux/miscdevice.h>
> > +#include <linux/firmware.h>
> > +#include <linux/mm.h>
> > +#include <linux/smp.h>
> > +
> > +#include <jailhouse.h>
> > +#include <jailhouse/header.h>
> > +
> > +#define JAILHOUSE_FW_NAME "jailhouse.bin"
> > +
> > +#define GFP_JAILHOUSE (GFP_KERNEL | __GFP_NO_KSWAPD | __GFP_NOTRACK)
> > +
> > +MODULE_DESCRIPTION("Loader for Jailhouse partitioning hypervisor");
> > +MODULE_LICENSE("GPL");
> > +MODULE_FIRMWARE(JAILHOUSE_FW_NAME);
> > +
> > +static struct device *jailhouse_dev;
> > +static DEFINE_MUTEX(lock);
> > +static bool enabled;
> > +static char *hypervisor_mem;
> > +static atomic_t entry_done;
> > +static int entry_error;
> > +
> > +static void enter_hypervisor(void *info)
> > +{
> > + struct jailhouse_header *header =3D info;
> > + int err;
> > +
> > + /* either returns 0 or the same error code across all CPUs */
> > + err =3D ((int (*)(void))(hypervisor_mem + header->entry))();
> > + if (err)
> > + entry_error =3D err;
> > +
> > + atomic_inc(&entry_done);
> > +}
> > +
> > +static int jailhouse_enable(void)
> > +{
> > + const struct firmware *hypervisor;
> > + struct jailhouse_header *header;
> > + size_t hypervisor_size;
> > + int err;
> > +
> > + if (mutex_lock_interruptible(&lock) !=3D 0)
> > + return -EINTR;
> > +
> > + err =3D -EBUSY;
> > + if (enabled || !try_module_get(THIS_MODULE))
> > + goto error_unlock;
> > +
> > + err =3D request_firmware(&hypervisor, JAILHOUSE_FW_NAME, jailhouse_de=
v);
> > + if (err)
> > + goto error_put_module;
> > +
> > + header =3D (struct jailhouse_header *)hypervisor->data;
> > +
> > + err =3D -EINVAL;
> > + if (memcmp(header->signature, JAILHOUSE_SIGNATURE,
> > + sizeof(header->signature)) !=3D 0)
> > + goto error_release_fw;
> > +
> > + err =3D -ENOMEM;
> > + hypervisor_size =3D PAGE_ALIGN(hypervisor->size) +
> > + PAGE_ALIGN(header->bss_end - header->bss_start);
> > + hypervisor_mem =3D __vmalloc(hypervisor_size,
> > + GFP_JAILHOUSE, PAGE_KERNEL_EXEC);
> > + if (!hypervisor_mem)
> > + goto error_release_fw;
> > +
> > + memcpy(hypervisor_mem, hypervisor->data, hypervisor->size);
> > +
> > + preempt_disable();
> > +
> > + atomic_set(&entry_done, 0);
> > + on_each_cpu(enter_hypervisor, header, 0);
> > + while (atomic_read(&entry_done) !=3D num_online_cpus())
> > + cpu_relax();
> > +
> > + preempt_enable();
> > +
> > + if (entry_error) {
> > + err =3D entry_error;
> > + goto error_release_fw;
> > + }
> > +
> > + release_firmware(hypervisor);
> > +
> > + enabled =3D true;
> > +
> > + mutex_unlock(&lock);
> > +
> > + printk("The Jailhouse is opening.\n");
> > +
> > + return 0;
> > +
> > +error_release_fw:
> > + release_firmware(hypervisor);
> > +
> > +error_put_module:
> > + module_put(THIS_MODULE);
> > +
> > +error_unlock:
> > + mutex_unlock(&lock);
> > + return err;
> > +}
> > +
> > +static int jailhouse_disable(void)
> > +{
> > + if (mutex_lock_interruptible(&lock) !=3D 0)
> > + return -EINTR;
> > +
> > + if (!enabled) {
> > + mutex_unlock(&lock);
> > + return -EINVAL;
> > + }
> > +
> > + vfree(hypervisor_mem);
> > +
> > + enabled =3D false;
> > + module_put(THIS_MODULE);
> > +
> > + mutex_unlock(&lock);
> > +
> > + printk("The Jailhouse was closed.\n");
> > +
> > + return 0;
> > +}
> > +
> > +static long jailhouse_ioctl(struct file *file, unsigned int ioctl,
> > + unsigned long arg)
> > +{
> > + long err;
> > +
> > + switch (ioctl) {
> > + case JAILHOUSE_ENABLE:
> > + err =3D jailhouse_enable();
> > + break;
> > + case JAILHOUSE_DISABLE:
> > + err =3D jailhouse_disable();
> > + break;
> > + default:
> > + err =3D -EINVAL;
> > + break;
> > + }
> > +
> > + return err;
> > +}
> > +
> > +static struct file_operations jailhouse_fops =3D {
> > + .owner =3D THIS_MODULE,
> > + .unlocked_ioctl =3D jailhouse_ioctl,
> > + .llseek =3D noop_llseek,
> > +};
> > +
> > +static struct miscdevice jailhouse_misc_dev =3D {
> > + .minor =3D MISC_DYNAMIC_MINOR,
> > + .name =3D "jailhouse",
> > + .fops =3D &jailhouse_fops,
> > +};
> > +
> > +static int __init jailhouse_init(void)
> > +{
> > + jailhouse_dev =3D root_device_register("jailhouse");
> > + if (IS_ERR(jailhouse_dev))
> > + return PTR_ERR(jailhouse_dev);
> > + return misc_register(&jailhouse_misc_dev);
> > +}
> > +
> > +static void __exit jailhouse_exit(void)
> > +{
> > + misc_deregister(&jailhouse_misc_dev);
> > + root_device_unregister(jailhouse_dev);
> > +}
> > +
> > +module_init(jailhouse_init);
> > +module_exit(jailhouse_exit);
> > diff --git a/tools/Makefile b/tools/Makefile
> > new file mode 100644
> > index 00000000..8d065557
> > --- /dev/null
> > +++ b/tools/Makefile
> > @@ -0,0 +1,20 @@
> > +#
> > +# Jailhouse, a Linux-based partioning hypervisor
> > +#
> > +# Copyright (c) Siemens AG, 2013
> > +#
> > +# Authors:
> > +# Jan Kiszka <jan.k...@siemens.com>
> > +#
> > +# This work is licensed under the terms of the GNU GPL, version 2. See
> > +# the COPYING file in the top-level directory.
> > +#
> > +
> > +CC =3D $(CROSS_COMPILE)gcc
> > +
> > +CFLAGS =3D -g -O3 -I.. -Wall -Wmissing-declarations -Wmissing-prototyp=
es
> > +
> > +jailhouse: jailhouse.c ../jailhouse.h
> > +
> > +clean:
> > + rm -f jailhouse
> > diff --git a/tools/jailhouse.c b/tools/jailhouse.c
> > new file mode 100644
> > index 00000000..11d66e16
> > --- /dev/null
> > +++ b/tools/jailhouse.c
> > @@ -0,0 +1,67 @@
> > +/*
> > + * Jailhouse, a Linux-based partioning hypervisor
> > + *
> > + * Copyright (c) Siemens AG, 2013
> > + *
> > + * Authors:
> > + * Jan Kiszka <jan.k...@siemens.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <unistd.h>
> > +#include <fcntl.h>
> > +#include <sys/ioctl.h>
> > +
> > +#include <jailhouse.h>
> > +
> > +static void help(const char *progname)
> > +{
> > + printf("%s enable|disable\n", progname);
> > +}
> > +
> > +static int open_dev()
> > +{
> > + int fd;
> > +
> > + fd =3D open("/dev/jailhouse", O_RDWR);
> > + if (fd < 0) {
> > + perror("opening /dev/jailhouse");
> > + exit(1);
> > + }
> > + return fd;
> > +}
> > +
> > +int main(int argc, char *argv[])
> > +{
> > + int fd;
> > + int err;
> > +
> > + if (argc < 2) {
> > + help(argv[0]);
> > + exit(1);
> > + }
> > +
> > + if (strcmp(argv[1], "enable") =3D=3D 0) {
> > + fd =3D open_dev();
> > + err =3D ioctl(fd, JAILHOUSE_ENABLE);
> > + if (err)
> > + perror("JAILHOUSE_ENABLE");
> > + } else if (strcmp(argv[1], "disable") =3D=3D 0) {
> > + fd =3D open_dev();
> > + err =3D ioctl(fd, JAILHOUSE_DISABLE);
> > + if (err)
> > + perror("JAILHOUSE_DISABLE");
> > + } else {
> > + help(argv[0]);
> > + exit(1);
> > + }
> > +
> > + close(fd);
> > +
> > + return 0;
> > +}
> >=20
>
> --=20
> =D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,
> =D0=A1=D0=B8=D0=BD=D0=B8=D1=86=D1=8B=D0=BD =D0=92=D0=B0=D0=BB=D0=B5=D0=BD=
=D1=82=D0=B8=D0=BD
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5380cf64-00a5-4693-9d84-1854854f7d26n%40googlegroups.com.

------=_Part_1591_1018717864.1674706299177
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi=EF=BC=8C</div><br />Happy Birthday to Jailhouse=EF=BC=81This is a m=
eaningful project. Expect to get better and better.<div><br /></div><div>Ji=
aming</div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr=
">=E5=9C=A82023=E5=B9=B41=E6=9C=8824=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UT=
C+8 15:37:15&lt;valentine...@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A<br/></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-l=
eft: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On 24.01.2023 00:04,=
 Jan Kiszka wrote:
<br>&gt; It&#39;s been a while and I&#39;m also getting older, so I do not =
recall anymore
<br>&gt; when exactly I wrote the first line of Jailhouse code. Maybe about=
 a
<br>&gt; week earlier. However, my non-public git records start on the 23rd=
 of
<br>&gt; January, 2013. Therefore, let&#39;s use this date to have the part=
y!
<br>&gt;=20
<br>&gt; Jailhouse was born out of an intensive discussion with colleagues
<br>&gt; whether creating the n-th closed-source hypervisor would be the be=
st way
<br>&gt; forward. Their idea was that it should be straightforward to creat=
e
<br>&gt; mixed-critical systems once you have a simple partitioning hypervi=
sor in
<br>&gt; place. That little piece of software would &quot;just&quot; be cer=
tified according
<br>&gt; to safety standards - done. I was already skeptical whether it is =
a good
<br>&gt; idea to create yet another hypervisor ourselves, after having work=
ed on
<br>&gt; various corner-cases on KVM the years before. But I specifically d=
idn&#39;t
<br>&gt; believe it was worth to write that without having the chance to ta=
lk
<br>&gt; about it and the hardware it needs openly with a broader expert
<br>&gt; community. Still, I also felt like it would be worth exploring suc=
h a
<br>&gt; safety approach (without have much clue about saftey back then).
<br>&gt;=20
<br>&gt; I first thought of shrinking down KVM, benefiting from its maturit=
y and
<br>&gt; &quot;only&quot; reducing its size. But then I realized the limits=
 of this and
<br>&gt; thought: Why not trying something new, activating the partitioning
<br>&gt; during runtime? This idea was spinning in my head for some months =
when
<br>&gt; an unfortunate change in my personal life made me look for doing
<br>&gt; something creative. So the first code was written during long even=
ings
<br>&gt; and weekends.
<br>&gt;=20
<br>&gt; I first worked against KVM as &quot;hardware&quot;, so I once agai=
n ran into KVM
<br>&gt; corner cases, this time around nested virtualization. Let&#39;s de=
bug the
<br>&gt; debugger, and have even more (hacker) fun!
<br>&gt;=20
<br>&gt; Around the 10th of February, the first vmlaunch succeeded, still i=
n KVM.
<br>&gt; Only if you ever have tried that yourself, you know how hard it is=
 to
<br>&gt; make vmlaunch happy and to find out why it is still not (think of
<br>&gt; &quot;docker run&quot; would only return -EINVAL, whatever you fee=
d in). Even with
<br>&gt; KVM, this was not easy to understand although some consistency che=
cks
<br>&gt; happen in software there. On the 10th of March, the first inmate
<br>&gt; launched, the famous apic-demo. Still in KVM, still as a spare-tim=
e
<br>&gt; project.
<br>&gt;=20
<br>&gt; Then on the 20th of March, I added support for starting KVM on my =
work
<br>&gt; notebook, a Fujitsu Celsius H700. What was missing for this jump f=
rom
<br>&gt; KVM to real silicon? Actually just a minor adjustment to CR0 handl=
ing
<br>&gt; where KVM was more relaxed than actual CPUs turned out to be.
<br>&gt;=20
<br>&gt; With this demo in hands, literally, I went to my bosses, shared my=
 idea
<br>&gt; and vision, made the point that this would only fly if it became o=
pen
<br>&gt; source and asked for the OK to publish it. And to drive this furth=
er
<br>&gt; towards that safety idea.
<br>&gt;=20
<br>&gt; Long-story short(er): The informal approval came quickly, the form=
al
<br>&gt; process still took a bit longer. But for the presentation of Jailh=
ouse
<br>&gt; at the KVM Forum 2013 [1] the baseline finally went public on gith=
ub.
<br>&gt;=20
<br>&gt; My real baseline did not - so far. But this little celebration sto=
ry
<br>&gt; already became so long - and I did not even talk about what we lea=
rned
<br>&gt; about safety, software and hardware in the past 10 years -, I thin=
k 1310
<br>&gt; lines of the real Jailhouse baseline patch do not matter. See belo=
w.
<br>&gt;=20
<br>&gt; Now let&#39;s celebrate. Not just those few first months. We need =
to
<br>&gt; celebrate much more you all, dear contributors! You made out of 40=
4
<br>&gt; lines of code over 50000, added two further architectures (part of=
 the
<br>&gt; pitch to my bosses which I didn&#39;t fully believe to happen that=
 quickly),
<br>&gt; with another one on the horizon, enabled Jailhouse on dozens of
<br>&gt; different targets, and kept it alive. Thank you all!
<br>
<br>Hooray!
<br>
<br>It was a pleasure working with you guys during the project start.
<br>It&#39;s a shame (on me) that AMD AVIC support code got stuck in my pri=
vate=20
<br>branch [1] around 2016, once again due to unfortunate change in a=20
<br>personal life, at 80% ready state.
<br>
<br>Nice to see RISC-V support is coming, and I&#39;m pretty sure it won&#3=
9;t be=20
<br>the last Jailhous feature merged.
<br>
<br>Happy next ten!
<br>
<br>Valentine
<br>
<br>[1] <a href=3D"https://github.com/vsinitsyn/jailhouse" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
zh-CN&amp;q=3Dhttps://github.com/vsinitsyn/jailhouse&amp;source=3Dgmail&amp=
;ust=3D1674792200691000&amp;usg=3DAOvVaw2CFCIj6fcvO4bYS49m7Qgc">https://git=
hub.com/vsinitsyn/jailhouse</a>
<br>
<br>&gt;=20
<br>&gt; Jan
<br>&gt;=20
<br>&gt; [1] <a href=3D"http://www.linux-kvm.org/images/b/b1/Kvm-forum-2013=
-Static-Partitioning.pdf" target=3D"_blank" rel=3D"nofollow" data-saferedir=
ecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttp://www.linux-kv=
m.org/images/b/b1/Kvm-forum-2013-Static-Partitioning.pdf&amp;source=3Dgmail=
&amp;ust=3D1674792200691000&amp;usg=3DAOvVaw3dyz82LsaA6oL55ZTWLIDr">http://=
www.linux-kvm.org/images/b/b1/Kvm-forum-2013-Static-Partitioning.pdf</a>
<br>&gt;=20
<br>&gt; ---
<br>&gt;=20
<br>&gt;  From 264de60d953188695eba5d634cafcaec35b9e2e6 Mon Sep 17 00:00:00=
 2001
<br>&gt; From: Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">ja=
n.k...@siemens.com</a>&gt;
<br>&gt; Date: Wed, 23 Jan 2013 21:33:10 +0100
<br>&gt; Subject: [PATCH] Baseline
<br>&gt;=20
<br>&gt; Contains build system, loader module, hypervisor skeleton and user=
 space
<br>&gt; tool to send enable/disable commands.
<br>&gt;=20
<br>&gt; Signed-off-by: Jan Kiszka &lt;<a href data-email-masked rel=3D"nof=
ollow">jan.k...@siemens.com</a>&gt;
<br>&gt; ---
<br>&gt;   .gitignore                                 |   9 +
<br>&gt;   COPYING                                    | 339 +++++++++++++++=
++++++
<br>&gt;   Makefile                                   |  31 ++
<br>&gt;   hypervisor/Makefile                        |  38 +++
<br>&gt;   hypervisor/arch/x86/Makefile               |  15 +
<br>&gt;   hypervisor/arch/x86/apic.c                 |  28 ++
<br>&gt;   hypervisor/arch/x86/dbg-write.c            |  33 ++
<br>&gt;   hypervisor/arch/x86/include/asm/bitops.h   |  49 +++
<br>&gt;   hypervisor/arch/x86/include/asm/io.h       |  25 ++
<br>&gt;   hypervisor/arch/x86/include/asm/spinlock.h |  31 ++
<br>&gt;   hypervisor/arch/x86/include/asm/types.h    |  23 ++
<br>&gt;   hypervisor/hypervisor.ld                   |  39 +++
<br>&gt;   hypervisor/include/jailhouse/header.h      |  20 ++
<br>&gt;   hypervisor/include/jailhouse/printk.h      |  15 +
<br>&gt;   hypervisor/include/jailhouse/processor.h   |  13 +
<br>&gt;   hypervisor/printk.c                        |  92 ++++++
<br>&gt;   hypervisor/setup.c                         |  32 ++
<br>&gt;   jailhouse.h                                |  16 +
<br>&gt;   main.c                                     | 192 ++++++++++++
<br>&gt;   tools/Makefile                             |  20 ++
<br>&gt;   tools/jailhouse.c                          |  67 ++++
<br>&gt;   21 files changed, 1127 insertions(+)
<br>&gt;   create mode 100644 .gitignore
<br>&gt;   create mode 100644 COPYING
<br>&gt;   create mode 100644 Makefile
<br>&gt;   create mode 100644 hypervisor/Makefile
<br>&gt;   create mode 100644 hypervisor/arch/x86/Makefile
<br>&gt;   create mode 100644 hypervisor/arch/x86/apic.c
<br>&gt;   create mode 100644 hypervisor/arch/x86/dbg-write.c
<br>&gt;   create mode 100644 hypervisor/arch/x86/include/asm/bitops.h
<br>&gt;   create mode 100644 hypervisor/arch/x86/include/asm/io.h
<br>&gt;   create mode 100644 hypervisor/arch/x86/include/asm/spinlock.h
<br>&gt;   create mode 100644 hypervisor/arch/x86/include/asm/types.h
<br>&gt;   create mode 100644 hypervisor/hypervisor.ld
<br>&gt;   create mode 100644 hypervisor/include/jailhouse/header.h
<br>&gt;   create mode 100644 hypervisor/include/jailhouse/printk.h
<br>&gt;   create mode 100644 hypervisor/include/jailhouse/processor.h
<br>&gt;   create mode 100644 hypervisor/printk.c
<br>&gt;   create mode 100644 hypervisor/setup.c
<br>&gt;   create mode 100644 jailhouse.h
<br>&gt;   create mode 100644 main.c
<br>&gt;   create mode 100644 tools/Makefile
<br>&gt;   create mode 100644 tools/jailhouse.c
<br>&gt;=20
<br>&gt; diff --git a/.gitignore b/.gitignore
<br>&gt; new file mode 100644
<br>&gt; index 00000000..6787fb8e
<br>&gt; --- /dev/null
<br>&gt; +++ b/.gitignore
<br>&gt; @@ -0,0 +1,9 @@
<br>&gt; +*.o
<br>&gt; +*.mod.[co]
<br>&gt; +*.cmd
<br>&gt; +.tmp_versions
<br>&gt; +Module.symvers
<br>&gt; +modules.order
<br>&gt; +jailhouse.ko
<br>&gt; +hypervisor/jailhouse.bin
<br>&gt; +tools/jailhouse
<br>&gt; diff --git a/COPYING b/COPYING
<br>&gt; new file mode 100644
<br>&gt; index 00000000..d159169d
<br>&gt; --- /dev/null
<br>&gt; +++ b/COPYING
<br>&gt; @@ -0,0 +1,339 @@
<br>&gt; +                    GNU GENERAL PUBLIC LICENSE
<br>&gt; +                       Version 2, June 1991
<br>&gt; +
<br>&gt; + Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
<br>&gt; + 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
<br>&gt; + Everyone is permitted to copy and distribute verbatim copies
<br>&gt; + of this license document, but changing it is not allowed.
<br>&gt; +
<br>&gt; +                            Preamble
<br>&gt; +
<br>&gt; +  The licenses for most software are designed to take away your
<br>&gt; +freedom to share and change it.  By contrast, the GNU General Pub=
lic
<br>&gt; +License is intended to guarantee your freedom to share and change=
 free
<br>&gt; +software--to make sure the software is free for all its users.  T=
his
<br>&gt; +General Public License applies to most of the Free Software
<br>&gt; +Foundation&#39;s software and to any other program whose authors =
commit to
<br>&gt; +using it.  (Some other Free Software Foundation software is cover=
ed by
<br>&gt; +the GNU Lesser General Public License instead.)  You can apply it=
 to
<br>&gt; +your programs, too.
<br>&gt; +
<br>&gt; +  When we speak of free software, we are referring to freedom, no=
t
<br>&gt; +price.  Our General Public Licenses are designed to make sure tha=
t you
<br>&gt; +have the freedom to distribute copies of free software (and charg=
e for
<br>&gt; +this service if you wish), that you receive source code or can ge=
t it
<br>&gt; +if you want it, that you can change the software or use pieces of=
 it
<br>&gt; +in new free programs; and that you know you can do these things.
<br>&gt; +
<br>&gt; +  To protect your rights, we need to make restrictions that forbi=
d
<br>&gt; +anyone to deny you these rights or to ask you to surrender the ri=
ghts.
<br>&gt; +These restrictions translate to certain responsibilities for you =
if you
<br>&gt; +distribute copies of the software, or if you modify it.
<br>&gt; +
<br>&gt; +  For example, if you distribute copies of such a program, whethe=
r
<br>&gt; +gratis or for a fee, you must give the recipients all the rights =
that
<br>&gt; +you have.  You must make sure that they, too, receive or can get =
the
<br>&gt; +source code.  And you must show them these terms so they know the=
ir
<br>&gt; +rights.
<br>&gt; +
<br>&gt; +  We protect your rights with two steps: (1) copyright the softwa=
re, and
<br>&gt; +(2) offer you this license which gives you legal permission to co=
py,
<br>&gt; +distribute and/or modify the software.
<br>&gt; +
<br>&gt; +  Also, for each author&#39;s protection and ours, we want to mak=
e certain
<br>&gt; +that everyone understands that there is no warranty for this free
<br>&gt; +software.  If the software is modified by someone else and passed=
 on, we
<br>&gt; +want its recipients to know that what they have is not the origin=
al, so
<br>&gt; +that any problems introduced by others will not reflect on the or=
iginal
<br>&gt; +authors&#39; reputations.
<br>&gt; +
<br>&gt; +  Finally, any free program is threatened constantly by software
<br>&gt; +patents.  We wish to avoid the danger that redistributors of a fr=
ee
<br>&gt; +program will individually obtain patent licenses, in effect makin=
g the
<br>&gt; +program proprietary.  To prevent this, we have made it clear that=
 any
<br>&gt; +patent must be licensed for everyone&#39;s free use or not licens=
ed at all.
<br>&gt; +
<br>&gt; +  The precise terms and conditions for copying, distribution and
<br>&gt; +modification follow.
<br>&gt; +
<br>&gt; +                    GNU GENERAL PUBLIC LICENSE
<br>&gt; +   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATIO=
N
<br>&gt; +
<br>&gt; +  0. This License applies to any program or other work which cont=
ains
<br>&gt; +a notice placed by the copyright holder saying it may be distribu=
ted
<br>&gt; +under the terms of this General Public License.  The &quot;Progra=
m&quot;, below,
<br>&gt; +refers to any such program or work, and a &quot;work based on the=
 Program&quot;
<br>&gt; +means either the Program or any derivative work under copyright l=
aw:
<br>&gt; +that is to say, a work containing the Program or a portion of it,
<br>&gt; +either verbatim or with modifications and/or translated into anot=
her
<br>&gt; +language.  (Hereinafter, translation is included without limitati=
on in
<br>&gt; +the term &quot;modification&quot;.)  Each licensee is addressed a=
s &quot;you&quot;.
<br>&gt; +
<br>&gt; +Activities other than copying, distribution and modification are =
not
<br>&gt; +covered by this License; they are outside its scope.  The act of
<br>&gt; +running the Program is not restricted, and the output from the Pr=
ogram
<br>&gt; +is covered only if its contents constitute a work based on the
<br>&gt; +Program (independent of having been made by running the Program).
<br>&gt; +Whether that is true depends on what the Program does.
<br>&gt; +
<br>&gt; +  1. You may copy and distribute verbatim copies of the Program&#=
39;s
<br>&gt; +source code as you receive it, in any medium, provided that you
<br>&gt; +conspicuously and appropriately publish on each copy an appropria=
te
<br>&gt; +copyright notice and disclaimer of warranty; keep intact all the
<br>&gt; +notices that refer to this License and to the absence of any warr=
anty;
<br>&gt; +and give any other recipients of the Program a copy of this Licen=
se
<br>&gt; +along with the Program.
<br>&gt; +
<br>&gt; +You may charge a fee for the physical act of transferring a copy,=
 and
<br>&gt; +you may at your option offer warranty protection in exchange for =
a fee.
<br>&gt; +
<br>&gt; +  2. You may modify your copy or copies of the Program or any por=
tion
<br>&gt; +of it, thus forming a work based on the Program, and copy and
<br>&gt; +distribute such modifications or work under the terms of Section =
1
<br>&gt; +above, provided that you also meet all of these conditions:
<br>&gt; +
<br>&gt; +    a) You must cause the modified files to carry prominent notic=
es
<br>&gt; +    stating that you changed the files and the date of any change=
.
<br>&gt; +
<br>&gt; +    b) You must cause any work that you distribute or publish, th=
at in
<br>&gt; +    whole or in part contains or is derived from the Program or a=
ny
<br>&gt; +    part thereof, to be licensed as a whole at no charge to all t=
hird
<br>&gt; +    parties under the terms of this License.
<br>&gt; +
<br>&gt; +    c) If the modified program normally reads commands interactiv=
ely
<br>&gt; +    when run, you must cause it, when started running for such
<br>&gt; +    interactive use in the most ordinary way, to print or display=
 an
<br>&gt; +    announcement including an appropriate copyright notice and a
<br>&gt; +    notice that there is no warranty (or else, saying that you pr=
ovide
<br>&gt; +    a warranty) and that users may redistribute the program under
<br>&gt; +    these conditions, and telling the user how to view a copy of =
this
<br>&gt; +    License.  (Exception: if the Program itself is interactive bu=
t
<br>&gt; +    does not normally print such an announcement, your work based=
 on
<br>&gt; +    the Program is not required to print an announcement.)
<br>&gt; +
<br>&gt; +These requirements apply to the modified work as a whole.  If
<br>&gt; +identifiable sections of that work are not derived from the Progr=
am,
<br>&gt; +and can be reasonably considered independent and separate works i=
n
<br>&gt; +themselves, then this License, and its terms, do not apply to tho=
se
<br>&gt; +sections when you distribute them as separate works.  But when yo=
u
<br>&gt; +distribute the same sections as part of a whole which is a work b=
ased
<br>&gt; +on the Program, the distribution of the whole must be on the term=
s of
<br>&gt; +this License, whose permissions for other licensees extend to the
<br>&gt; +entire whole, and thus to each and every part regardless of who w=
rote it.
<br>&gt; +
<br>&gt; +Thus, it is not the intent of this section to claim rights or con=
test
<br>&gt; +your rights to work written entirely by you; rather, the intent i=
s to
<br>&gt; +exercise the right to control the distribution of derivative or
<br>&gt; +collective works based on the Program.
<br>&gt; +
<br>&gt; +In addition, mere aggregation of another work not based on the Pr=
ogram
<br>&gt; +with the Program (or with a work based on the Program) on a volum=
e of
<br>&gt; +a storage or distribution medium does not bring the other work un=
der
<br>&gt; +the scope of this License.
<br>&gt; +
<br>&gt; +  3. You may copy and distribute the Program (or a work based on =
it,
<br>&gt; +under Section 2) in object code or executable form under the term=
s of
<br>&gt; +Sections 1 and 2 above provided that you also do one of the follo=
wing:
<br>&gt; +
<br>&gt; +    a) Accompany it with the complete corresponding machine-reada=
ble
<br>&gt; +    source code, which must be distributed under the terms of Sec=
tions
<br>&gt; +    1 and 2 above on a medium customarily used for software inter=
change; or,
<br>&gt; +
<br>&gt; +    b) Accompany it with a written offer, valid for at least thre=
e
<br>&gt; +    years, to give any third party, for a charge no more than you=
r
<br>&gt; +    cost of physically performing source distribution, a complete
<br>&gt; +    machine-readable copy of the corresponding source code, to be
<br>&gt; +    distributed under the terms of Sections 1 and 2 above on a me=
dium
<br>&gt; +    customarily used for software interchange; or,
<br>&gt; +
<br>&gt; +    c) Accompany it with the information you received as to the o=
ffer
<br>&gt; +    to distribute corresponding source code.  (This alternative i=
s
<br>&gt; +    allowed only for noncommercial distribution and only if you
<br>&gt; +    received the program in object code or executable form with s=
uch
<br>&gt; +    an offer, in accord with Subsection b above.)
<br>&gt; +
<br>&gt; +The source code for a work means the preferred form of the work f=
or
<br>&gt; +making modifications to it.  For an executable work, complete sou=
rce
<br>&gt; +code means all the source code for all modules it contains, plus =
any
<br>&gt; +associated interface definition files, plus the scripts used to
<br>&gt; +control compilation and installation of the executable.  However,=
 as a
<br>&gt; +special exception, the source code distributed need not include
<br>&gt; +anything that is normally distributed (in either source or binary
<br>&gt; +form) with the major components (compiler, kernel, and so on) of =
the
<br>&gt; +operating system on which the executable runs, unless that compon=
ent
<br>&gt; +itself accompanies the executable.
<br>&gt; +
<br>&gt; +If distribution of executable or object code is made by offering
<br>&gt; +access to copy from a designated place, then offering equivalent
<br>&gt; +access to copy the source code from the same place counts as
<br>&gt; +distribution of the source code, even though third parties are no=
t
<br>&gt; +compelled to copy the source along with the object code.
<br>&gt; +
<br>&gt; +  4. You may not copy, modify, sublicense, or distribute the Prog=
ram
<br>&gt; +except as expressly provided under this License.  Any attempt
<br>&gt; +otherwise to copy, modify, sublicense or distribute the Program i=
s
<br>&gt; +void, and will automatically terminate your rights under this Lic=
ense.
<br>&gt; +However, parties who have received copies, or rights, from you un=
der
<br>&gt; +this License will not have their licenses terminated so long as s=
uch
<br>&gt; +parties remain in full compliance.
<br>&gt; +
<br>&gt; +  5. You are not required to accept this License, since you have =
not
<br>&gt; +signed it.  However, nothing else grants you permission to modify=
 or
<br>&gt; +distribute the Program or its derivative works.  These actions ar=
e
<br>&gt; +prohibited by law if you do not accept this License.  Therefore, =
by
<br>&gt; +modifying or distributing the Program (or any work based on the
<br>&gt; +Program), you indicate your acceptance of this License to do so, =
and
<br>&gt; +all its terms and conditions for copying, distributing or modifyi=
ng
<br>&gt; +the Program or works based on it.
<br>&gt; +
<br>&gt; +  6. Each time you redistribute the Program (or any work based on=
 the
<br>&gt; +Program), the recipient automatically receives a license from the
<br>&gt; +original licensor to copy, distribute or modify the Program subje=
ct to
<br>&gt; +these terms and conditions.  You may not impose any further
<br>&gt; +restrictions on the recipients&#39; exercise of the rights grante=
d herein.
<br>&gt; +You are not responsible for enforcing compliance by third parties=
 to
<br>&gt; +this License.
<br>&gt; +
<br>&gt; +  7. If, as a consequence of a court judgment or allegation of pa=
tent
<br>&gt; +infringement or for any other reason (not limited to patent issue=
s),
<br>&gt; +conditions are imposed on you (whether by court order, agreement =
or
<br>&gt; +otherwise) that contradict the conditions of this License, they d=
o not
<br>&gt; +excuse you from the conditions of this License.  If you cannot
<br>&gt; +distribute so as to satisfy simultaneously your obligations under=
 this
<br>&gt; +License and any other pertinent obligations, then as a consequenc=
e you
<br>&gt; +may not distribute the Program at all.  For example, if a patent
<br>&gt; +license would not permit royalty-free redistribution of the Progr=
am by
<br>&gt; +all those who receive copies directly or indirectly through you, =
then
<br>&gt; +the only way you could satisfy both it and this License would be =
to
<br>&gt; +refrain entirely from distribution of the Program.
<br>&gt; +
<br>&gt; +If any portion of this section is held invalid or unenforceable u=
nder
<br>&gt; +any particular circumstance, the balance of the section is intend=
ed to
<br>&gt; +apply and the section as a whole is intended to apply in other
<br>&gt; +circumstances.
<br>&gt; +
<br>&gt; +It is not the purpose of this section to induce you to infringe a=
ny
<br>&gt; +patents or other property right claims or to contest validity of =
any
<br>&gt; +such claims; this section has the sole purpose of protecting the
<br>&gt; +integrity of the free software distribution system, which is
<br>&gt; +implemented by public license practices.  Many people have made
<br>&gt; +generous contributions to the wide range of software distributed
<br>&gt; +through that system in reliance on consistent application of that
<br>&gt; +system; it is up to the author/donor to decide if he or she is wi=
lling
<br>&gt; +to distribute software through any other system and a licensee ca=
nnot
<br>&gt; +impose that choice.
<br>&gt; +
<br>&gt; +This section is intended to make thoroughly clear what is believe=
d to
<br>&gt; +be a consequence of the rest of this License.
<br>&gt; +
<br>&gt; +  8. If the distribution and/or use of the Program is restricted =
in
<br>&gt; +certain countries either by patents or by copyrighted interfaces,=
 the
<br>&gt; +original copyright holder who places the Program under this Licen=
se
<br>&gt; +may add an explicit geographical distribution limitation excludin=
g
<br>&gt; +those countries, so that distribution is permitted only in or amo=
ng
<br>&gt; +countries not thus excluded.  In such case, this License incorpor=
ates
<br>&gt; +the limitation as if written in the body of this License.
<br>&gt; +
<br>&gt; +  9. The Free Software Foundation may publish revised and/or new =
versions
<br>&gt; +of the General Public License from time to time.  Such new versio=
ns will
<br>&gt; +be similar in spirit to the present version, but may differ in de=
tail to
<br>&gt; +address new problems or concerns.
<br>&gt; +
<br>&gt; +Each version is given a distinguishing version number.  If the Pr=
ogram
<br>&gt; +specifies a version number of this License which applies to it an=
d &quot;any
<br>&gt; +later version&quot;, you have the option of following the terms a=
nd conditions
<br>&gt; +either of that version or of any later version published by the F=
ree
<br>&gt; +Software Foundation.  If the Program does not specify a version n=
umber of
<br>&gt; +this License, you may choose any version ever published by the Fr=
ee Software
<br>&gt; +Foundation.
<br>&gt; +
<br>&gt; +  10. If you wish to incorporate parts of the Program into other =
free
<br>&gt; +programs whose distribution conditions are different, write to th=
e author
<br>&gt; +to ask for permission.  For software which is copyrighted by the =
Free
<br>&gt; +Software Foundation, write to the Free Software Foundation; we so=
metimes
<br>&gt; +make exceptions for this.  Our decision will be guided by the two=
 goals
<br>&gt; +of preserving the free status of all derivatives of our free soft=
ware and
<br>&gt; +of promoting the sharing and reuse of software generally.
<br>&gt; +
<br>&gt; +                            NO WARRANTY
<br>&gt; +
<br>&gt; +  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO=
 WARRANTY
<br>&gt; +FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCE=
PT WHEN
<br>&gt; +OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PA=
RTIES
<br>&gt; +PROVIDE THE PROGRAM &quot;AS IS&quot; WITHOUT WARRANTY OF ANY KIN=
D, EITHER EXPRESSED
<br>&gt; +OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES=
 OF
<br>&gt; +MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE=
 RISK AS
<br>&gt; +TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOUL=
D THE
<br>&gt; +PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SER=
VICING,
<br>&gt; +REPAIR OR CORRECTION.
<br>&gt; +
<br>&gt; +  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO =
IN WRITING
<br>&gt; +WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/=
OR
<br>&gt; +REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR=
 DAMAGES,
<br>&gt; +INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAG=
ES ARISING
<br>&gt; +OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT=
 LIMITED
<br>&gt; +TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTA=
INED BY
<br>&gt; +YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH =
ANY OTHER
<br>&gt; +PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF=
 THE
<br>&gt; +POSSIBILITY OF SUCH DAMAGES.
<br>&gt; +
<br>&gt; +                     END OF TERMS AND CONDITIONS
<br>&gt; +
<br>&gt; +            How to Apply These Terms to Your New Programs
<br>&gt; +
<br>&gt; +  If you develop a new program, and you want it to be of the grea=
test
<br>&gt; +possible use to the public, the best way to achieve this is to ma=
ke it
<br>&gt; +free software which everyone can redistribute and change under th=
ese terms.
<br>&gt; +
<br>&gt; +  To do so, attach the following notices to the program.  It is s=
afest
<br>&gt; +to attach them to the start of each source file to most effective=
ly
<br>&gt; +convey the exclusion of warranty; and each file should have at le=
ast
<br>&gt; +the &quot;copyright&quot; line and a pointer to where the full no=
tice is found.
<br>&gt; +
<br>&gt; +    &lt;one line to give the program&#39;s name and a brief idea =
of what it does.&gt;
<br>&gt; +    Copyright (C) &lt;year&gt;  &lt;name of author&gt;
<br>&gt; +
<br>&gt; +    This program is free software; you can redistribute it and/or=
 modify
<br>&gt; +    it under the terms of the GNU General Public License as publi=
shed by
<br>&gt; +    the Free Software Foundation; either version 2 of the License=
, or
<br>&gt; +    (at your option) any later version.
<br>&gt; +
<br>&gt; +    This program is distributed in the hope that it will be usefu=
l,
<br>&gt; +    but WITHOUT ANY WARRANTY; without even the implied warranty o=
f
<br>&gt; +    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
<br>&gt; +    GNU General Public License for more details.
<br>&gt; +
<br>&gt; +    You should have received a copy of the GNU General Public Lic=
ense along
<br>&gt; +    with this program; if not, write to the Free Software Foundat=
ion, Inc.,
<br>&gt; +    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
<br>&gt; +
<br>&gt; +Also add information on how to contact you by electronic and pape=
r mail.
<br>&gt; +
<br>&gt; +If the program is interactive, make it output a short notice like=
 this
<br>&gt; +when it starts in an interactive mode:
<br>&gt; +
<br>&gt; +    Gnomovision version 69, Copyright (C) year name of author
<br>&gt; +    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details ty=
pe `show w&#39;.
<br>&gt; +    This is free software, and you are welcome to redistribute it
<br>&gt; +    under certain conditions; type `show c&#39; for details.
<br>&gt; +
<br>&gt; +The hypothetical commands `show w&#39; and `show c&#39; should sh=
ow the appropriate
<br>&gt; +parts of the General Public License.  Of course, the commands you=
 use may
<br>&gt; +be called something other than `show w&#39; and `show c&#39;; the=
y could even be
<br>&gt; +mouse-clicks or menu items--whatever suits your program.
<br>&gt; +
<br>&gt; +You should also get your employer (if you work as a programmer) o=
r your
<br>&gt; +school, if any, to sign a &quot;copyright disclaimer&quot; for th=
e program, if
<br>&gt; +necessary.  Here is a sample; alter the names:
<br>&gt; +
<br>&gt; +  Yoyodyne, Inc., hereby disclaims all copyright interest in the =
program
<br>&gt; +  `Gnomovision&#39; (which makes passes at compilers) written by =
James Hacker.
<br>&gt; +
<br>&gt; +  &lt;signature of Ty Coon&gt;, 1 April 1989
<br>&gt; +  Ty Coon, President of Vice
<br>&gt; +
<br>&gt; +This General Public License does not permit incorporating your pr=
ogram into
<br>&gt; +proprietary programs.  If your program is a subroutine library, y=
ou may
<br>&gt; +consider it more useful to permit linking proprietary application=
s with the
<br>&gt; +library.  If this is what you want to do, use the GNU Lesser Gene=
ral
<br>&gt; +Public License instead of this License.
<br>&gt; diff --git a/Makefile b/Makefile
<br>&gt; new file mode 100644
<br>&gt; index 00000000..2c411e63
<br>&gt; --- /dev/null
<br>&gt; +++ b/Makefile
<br>&gt; @@ -0,0 +1,31 @@
<br>&gt; +#
<br>&gt; +# Jailhouse, a Linux-based partioning hypervisor
<br>&gt; +#
<br>&gt; +# Copyright (c) Siemens AG, 2013
<br>&gt; +#
<br>&gt; +# Authors:
<br>&gt; +#  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan.=
k...@siemens.com</a>&gt;
<br>&gt; +#
<br>&gt; +# This work is licensed under the terms of the GNU GPL, version 2=
.  See
<br>&gt; +# the COPYING file in the top-level directory.
<br>&gt; +#
<br>&gt; +
<br>&gt; +subdir-y :=3D hypervisor
<br>&gt; +
<br>&gt; +obj-m :=3D jailhouse.o
<br>&gt; +
<br>&gt; +ccflags-y :=3D -I$(src)/hypervisor/include
<br>&gt; +
<br>&gt; +jailhouse-y :=3D main.o
<br>&gt; +
<br>&gt; +# out-of-tree build
<br>&gt; +
<br>&gt; +KERNELDIR =3D /lib/modules/`uname -r`/build
<br>&gt; +
<br>&gt; +modules modules_install clean:
<br>&gt; +	$(MAKE) -C $(KERNELDIR) SUBDIRS=3D`pwd` $@
<br>&gt; +
<br>&gt; +install: modules_install
<br>&gt; +	depmod -aq
<br>&gt; +
<br>&gt; +.PHONY: modules_install install clean
<br>&gt; diff --git a/hypervisor/Makefile b/hypervisor/Makefile
<br>&gt; new file mode 100644
<br>&gt; index 00000000..a808bdc7
<br>&gt; --- /dev/null
<br>&gt; +++ b/hypervisor/Makefile
<br>&gt; @@ -0,0 +1,38 @@
<br>&gt; +#
<br>&gt; +# Jailhouse, a Linux-based partioning hypervisor
<br>&gt; +#
<br>&gt; +# Copyright (c) Siemens AG, 2013
<br>&gt; +#
<br>&gt; +# Authors:
<br>&gt; +#  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan.=
k...@siemens.com</a>&gt;
<br>&gt; +#
<br>&gt; +# This work is licensed under the terms of the GNU GPL, version 2=
.  See
<br>&gt; +# the COPYING file in the top-level directory.
<br>&gt; +#
<br>&gt; +
<br>&gt; +LINUXINCLUDE :=3D -I$(src)/arch/$(SRCARCH)/include -I$(src)/inclu=
de
<br>&gt; +KBUILD_CFLAGS :=3D -g -Os -Wall -Wstrict-prototypes \
<br>&gt; +		 -Wmissing-declarations -Wmissing-prototypes \
<br>&gt; +		 -fno-strict-aliasing -fpic -fpie -fno-common
<br>&gt; +
<br>&gt; +subdir-y :=3D arch/$(SRCARCH)
<br>&gt; +
<br>&gt; +always :=3D jailhouse.bin
<br>&gt; +
<br>&gt; +hypervisor-y :=3D setup.o printk.o \
<br>&gt; +	arch/$(SRCARCH)/built-in.o
<br>&gt; +targets +=3D $(hypervisor-y)
<br>&gt; +
<br>&gt; +HYPERVISOR_OBJS =3D $(addprefix $(obj)/,$(hypervisor-y))
<br>&gt; +
<br>&gt; +LDFLAGS_hypervisor.o :=3D -T
<br>&gt; +
<br>&gt; +targets +=3D hypervisor.o
<br>&gt; +$(obj)/hypervisor.o: $(src)/hypervisor.ld $(HYPERVISOR_OBJS)
<br>&gt; +	$(call if_changed,ld)
<br>&gt; +
<br>&gt; +OBJCOPYFLAGS_jailhouse.bin :=3D -O binary -R .got
<br>&gt; +
<br>&gt; +target +=3D jailhouse.bin
<br>&gt; +$(obj)/jailhouse.bin: $(obj)/hypervisor.o
<br>&gt; +	$(call if_changed,objcopy)
<br>&gt; diff --git a/hypervisor/arch/x86/Makefile b/hypervisor/arch/x86/Ma=
kefile
<br>&gt; new file mode 100644
<br>&gt; index 00000000..2db1bf69
<br>&gt; --- /dev/null
<br>&gt; +++ b/hypervisor/arch/x86/Makefile
<br>&gt; @@ -0,0 +1,15 @@
<br>&gt; +#
<br>&gt; +# Jailhouse, a Linux-based partioning hypervisor
<br>&gt; +#
<br>&gt; +# Copyright (c) Siemens AG, 2013
<br>&gt; +#
<br>&gt; +# Authors:
<br>&gt; +#  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan.=
k...@siemens.com</a>&gt;
<br>&gt; +#
<br>&gt; +# This work is licensed under the terms of the GNU GPL, version 2=
.  See
<br>&gt; +# the COPYING file in the top-level directory.
<br>&gt; +#
<br>&gt; +
<br>&gt; +always :=3D built-in.o
<br>&gt; +
<br>&gt; +obj-y :=3D apic.o dbg-write.o
<br>&gt; diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic=
.c
<br>&gt; new file mode 100644
<br>&gt; index 00000000..c79069c0
<br>&gt; --- /dev/null
<br>&gt; +++ b/hypervisor/arch/x86/apic.c
<br>&gt; @@ -0,0 +1,28 @@
<br>&gt; +/*
<br>&gt; + * Jailhouse, a Linux-based partioning hypervisor
<br>&gt; + *
<br>&gt; + * Copyright (c) Siemens AG, 2013
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan=
.k...@siemens.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +#include &lt;jailhouse/processor.h&gt;
<br>&gt; +#include &lt;asm/types.h&gt;
<br>&gt; +
<br>&gt; +// #define APIC_BASE	0xfee00000
<br>&gt; +#define APIC_BASE	0xffffffffff5f9000 /* Linux mapping */
<br>&gt; +#define  APIC_ID	0x0020
<br>&gt; +
<br>&gt; +static unsigned int read_apic(unsigned int reg)
<br>&gt; +{
<br>&gt; +	return *(volatile u32 *)(long)(APIC_BASE + reg);
<br>&gt; +}
<br>&gt; +
<br>&gt; +int processor_id(void)
<br>&gt; +{
<br>&gt; +	return read_apic(APIC_ID) &gt;&gt; 24;
<br>&gt; +}
<br>&gt; diff --git a/hypervisor/arch/x86/dbg-write.c b/hypervisor/arch/x86=
/dbg-write.c
<br>&gt; new file mode 100644
<br>&gt; index 00000000..fe9003a3
<br>&gt; --- /dev/null
<br>&gt; +++ b/hypervisor/arch/x86/dbg-write.c
<br>&gt; @@ -0,0 +1,33 @@
<br>&gt; +/*
<br>&gt; + * Jailhouse, a Linux-based partioning hypervisor
<br>&gt; + *
<br>&gt; + * Copyright (c) Siemens AG, 2013
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan=
.k...@siemens.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +#include &lt;jailhouse/printk.h&gt;
<br>&gt; +#include &lt;asm/io.h&gt;
<br>&gt; +
<br>&gt; +#define UART_BASE		0x3f8
<br>&gt; +#define  UART_TX		0x0
<br>&gt; +#define  UART_LSR		0x5
<br>&gt; +#define  UART_LSR_THRE		0x20
<br>&gt; +
<br>&gt; +void arch_dbg_write(const char *msg)
<br>&gt; +{
<br>&gt; +	char c;
<br>&gt; +
<br>&gt; +	while (1) {
<br>&gt; +		c =3D *msg++;
<br>&gt; +		if (!c)
<br>&gt; +			break;
<br>&gt; +		while (!(inb(UART_BASE + UART_LSR) &amp; UART_LSR_THRE))
<br>&gt; +			asm volatile(&quot;rep; nop&quot;);
<br>&gt; +		outb(c, UART_BASE + UART_TX);
<br>&gt; +	}
<br>&gt; +}
<br>&gt; diff --git a/hypervisor/arch/x86/include/asm/bitops.h b/hypervisor=
/arch/x86/include/asm/bitops.h
<br>&gt; new file mode 100644
<br>&gt; index 00000000..2d6b66ed
<br>&gt; --- /dev/null
<br>&gt; +++ b/hypervisor/arch/x86/include/asm/bitops.h
<br>&gt; @@ -0,0 +1,49 @@
<br>&gt; +/*
<br>&gt; + * Jailhouse, a Linux-based partioning hypervisor
<br>&gt; + *
<br>&gt; + * Copyright (c) Siemens AG, 2013
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan=
.k...@siemens.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +#include &lt;asm/types.h&gt;
<br>&gt; +
<br>&gt; +#if __GNUC__ &lt; 4 || (__GNUC__ =3D=3D 4 &amp;&amp; __GNUC_MINOR=
__ &lt; 1)
<br>&gt; +/* Technically wrong, but this avoids compilation errors on some =
gcc
<br>&gt; +   versions. */
<br>&gt; +#define BITOP_ADDR(x) &quot;=3Dm&quot; (*(volatile long *) (x))
<br>&gt; +#else
<br>&gt; +#define BITOP_ADDR(x) &quot;+m&quot; (*(volatile long *) (x))
<br>&gt; +#endif
<br>&gt; +
<br>&gt; +#define CONST_MASK_ADDR(nr, addr)	BITOP_ADDR((void *)(addr) + ((n=
r)&gt;&gt;3))
<br>&gt; +#define CONST_MASK(nr)			(1 &lt;&lt; ((nr) &amp; 7))
<br>&gt; +
<br>&gt; +static inline __attribute__((always_inline)) void
<br>&gt; +clear_bit(int nr, volatile unsigned long *addr)
<br>&gt; +{
<br>&gt; +	if (__builtin_constant_p(nr)) {
<br>&gt; +		asm volatile(&quot;lock andb %1,%0&quot;
<br>&gt; +			: CONST_MASK_ADDR(nr, addr)
<br>&gt; +			: &quot;iq&quot; ((u8)~CONST_MASK(nr)));
<br>&gt; +	} else {
<br>&gt; +		asm volatile(&quot;lock btr %1,%0&quot;
<br>&gt; +			: BITOP_ADDR(addr)
<br>&gt; +			: &quot;Ir&quot; (nr));
<br>&gt; +	}
<br>&gt; +}
<br>&gt; +
<br>&gt; +static inline int test_and_set_bit(int nr, volatile unsigned long=
 *addr)
<br>&gt; +{
<br>&gt; +	int oldbit;
<br>&gt; +
<br>&gt; +	asm volatile(&quot;lock bts %2,%1\n\t&quot;
<br>&gt; +		     &quot;sbb %0,%0&quot; : &quot;=3Dr&quot; (oldbit), BITOP_A=
DDR(addr)
<br>&gt; +		     : &quot;Ir&quot; (nr) : &quot;memory&quot;);
<br>&gt; +
<br>&gt; +	return oldbit;
<br>&gt; +}
<br>&gt; diff --git a/hypervisor/arch/x86/include/asm/io.h b/hypervisor/arc=
h/x86/include/asm/io.h
<br>&gt; new file mode 100644
<br>&gt; index 00000000..db900ac7
<br>&gt; --- /dev/null
<br>&gt; +++ b/hypervisor/arch/x86/include/asm/io.h
<br>&gt; @@ -0,0 +1,25 @@
<br>&gt; +/*
<br>&gt; + * Jailhouse, a Linux-based partioning hypervisor
<br>&gt; + *
<br>&gt; + * Copyright (c) Siemens AG, 2013
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan=
.k...@siemens.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +#include &lt;asm/types.h&gt;
<br>&gt; +
<br>&gt; +static inline void outb(u8 v, u16 port)
<br>&gt; +{
<br>&gt; +	asm volatile(&quot;outb %0,%1&quot; : : &quot;a&quot; (v), &quot=
;dN&quot; (port));
<br>&gt; +}
<br>&gt; +
<br>&gt; +static inline u8 inb(u16 port)
<br>&gt; +{
<br>&gt; +	u8 v;
<br>&gt; +	asm volatile(&quot;inb %1,%0&quot; : &quot;=3Da&quot; (v) : &quo=
t;dN&quot; (port));
<br>&gt; +	return v;
<br>&gt; +}
<br>&gt; diff --git a/hypervisor/arch/x86/include/asm/spinlock.h b/hypervis=
or/arch/x86/include/asm/spinlock.h
<br>&gt; new file mode 100644
<br>&gt; index 00000000..df632610
<br>&gt; --- /dev/null
<br>&gt; +++ b/hypervisor/arch/x86/include/asm/spinlock.h
<br>&gt; @@ -0,0 +1,31 @@
<br>&gt; +/*
<br>&gt; + * Jailhouse, a Linux-based partioning hypervisor
<br>&gt; + *
<br>&gt; + * Copyright (c) Siemens AG, 2013
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan=
.k...@siemens.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +#include &lt;asm/bitops.h&gt;
<br>&gt; +
<br>&gt; +typedef struct {
<br>&gt; +	unsigned long state;
<br>&gt; +} spinlock_t;
<br>&gt; +
<br>&gt; +#define DEFINE_SPINLOCK(name)	spinlock_t (name)
<br>&gt; +
<br>&gt; +static inline void spin_lock(spinlock_t *lock)
<br>&gt; +{
<br>&gt; +	while (test_and_set_bit(0, &amp;lock-&gt;state))
<br>&gt; +		asm volatile(&quot;rep; nop&quot;);
<br>&gt; +}
<br>&gt; +
<br>&gt; +static inline void spin_unlock(spinlock_t *lock)
<br>&gt; +{
<br>&gt; +	asm volatile(&quot;&quot;: : :&quot;memory&quot;);
<br>&gt; +	clear_bit(0, &amp;lock-&gt;state);
<br>&gt; +}
<br>&gt; diff --git a/hypervisor/arch/x86/include/asm/types.h b/hypervisor/=
arch/x86/include/asm/types.h
<br>&gt; new file mode 100644
<br>&gt; index 00000000..fdb98995
<br>&gt; --- /dev/null
<br>&gt; +++ b/hypervisor/arch/x86/include/asm/types.h
<br>&gt; @@ -0,0 +1,23 @@
<br>&gt; +/*
<br>&gt; + * Jailhouse, a Linux-based partioning hypervisor
<br>&gt; + *
<br>&gt; + * Copyright (c) Siemens AG, 2013
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan=
.k...@siemens.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +typedef signed char s8;
<br>&gt; +typedef unsigned char u8;
<br>&gt; +
<br>&gt; +typedef signed short s16;
<br>&gt; +typedef unsigned short u16;
<br>&gt; +
<br>&gt; +typedef signed int s32;
<br>&gt; +typedef unsigned int u32;
<br>&gt; +
<br>&gt; +typedef signed long s64;
<br>&gt; +typedef unsigned long u64;
<br>&gt; diff --git a/hypervisor/hypervisor.ld b/hypervisor/hypervisor.ld
<br>&gt; new file mode 100644
<br>&gt; index 00000000..d9dbb107
<br>&gt; --- /dev/null
<br>&gt; +++ b/hypervisor/hypervisor.ld
<br>&gt; @@ -0,0 +1,39 @@
<br>&gt; +/*
<br>&gt; + * Jailhouse, a Linux-based partioning hypervisor
<br>&gt; + *
<br>&gt; + * Copyright (c) Siemens AG, 2013
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan=
.k...@siemens.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +SECTIONS
<br>&gt; +{
<br>&gt; +	. =3D 0;
<br>&gt; +	.header		: { *(.header) }
<br>&gt; +
<br>&gt; +	. =3D ALIGN(16);
<br>&gt; +	.text		: { *(.text) }
<br>&gt; +
<br>&gt; +	. =3D ALIGN(16);
<br>&gt; +	.rodata		: { *(.rodata) }
<br>&gt; +
<br>&gt; +	. =3D ALIGN(16);
<br>&gt; +	.data		: { *(.data) }
<br>&gt; +
<br>&gt; +	. =3D ALIGN(16);
<br>&gt; +	.bss		: {
<br>&gt; +		__bss_start =3D .;
<br>&gt; +		*(.bss)
<br>&gt; +		__bss_end =3D .;
<br>&gt; +	}
<br>&gt; +
<br>&gt; +	.got		: { *(.got*) }
<br>&gt; +
<br>&gt; +	/DISCARD/ : {
<br>&gt; +		*(.eh_frame*)
<br>&gt; +	}
<br>&gt; +}
<br>&gt; diff --git a/hypervisor/include/jailhouse/header.h b/hypervisor/in=
clude/jailhouse/header.h
<br>&gt; new file mode 100644
<br>&gt; index 00000000..f7b26a42
<br>&gt; --- /dev/null
<br>&gt; +++ b/hypervisor/include/jailhouse/header.h
<br>&gt; @@ -0,0 +1,20 @@
<br>&gt; +/*
<br>&gt; + * Jailhouse, a Linux-based partioning hypervisor
<br>&gt; + *
<br>&gt; + * Copyright (c) Siemens AG, 2013
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan=
.k...@siemens.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +#define JAILHOUSE_SIGNATURE	&quot;JAILHOUS&quot;
<br>&gt; +
<br>&gt; +struct jailhouse_header {
<br>&gt; +	char signature[8];
<br>&gt; +	unsigned long bss_start;
<br>&gt; +	unsigned long bss_end;
<br>&gt; +	unsigned long entry;
<br>&gt; +};
<br>&gt; diff --git a/hypervisor/include/jailhouse/printk.h b/hypervisor/in=
clude/jailhouse/printk.h
<br>&gt; new file mode 100644
<br>&gt; index 00000000..8c0af6a3
<br>&gt; --- /dev/null
<br>&gt; +++ b/hypervisor/include/jailhouse/printk.h
<br>&gt; @@ -0,0 +1,15 @@
<br>&gt; +/*
<br>&gt; + * Jailhouse, a Linux-based partioning hypervisor
<br>&gt; + *
<br>&gt; + * Copyright (c) Siemens AG, 2013
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan=
.k...@siemens.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +void printk(const char *fmt, ...);
<br>&gt; +
<br>&gt; +void arch_dbg_write(const char *msg);
<br>&gt; diff --git a/hypervisor/include/jailhouse/processor.h b/hypervisor=
/include/jailhouse/processor.h
<br>&gt; new file mode 100644
<br>&gt; index 00000000..a6907c14
<br>&gt; --- /dev/null
<br>&gt; +++ b/hypervisor/include/jailhouse/processor.h
<br>&gt; @@ -0,0 +1,13 @@
<br>&gt; +/*
<br>&gt; + * Jailhouse, a Linux-based partioning hypervisor
<br>&gt; + *
<br>&gt; + * Copyright (c) Siemens AG, 2013
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan=
.k...@siemens.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +int processor_id(void);
<br>&gt; diff --git a/hypervisor/printk.c b/hypervisor/printk.c
<br>&gt; new file mode 100644
<br>&gt; index 00000000..9169b0bd
<br>&gt; --- /dev/null
<br>&gt; +++ b/hypervisor/printk.c
<br>&gt; @@ -0,0 +1,92 @@
<br>&gt; +/*
<br>&gt; + * Jailhouse, a Linux-based partioning hypervisor
<br>&gt; + *
<br>&gt; + * Copyright (c) Siemens AG, 2013
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan=
.k...@siemens.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +#include &lt;stdarg.h&gt;
<br>&gt; +#include &lt;jailhouse/printk.h&gt;
<br>&gt; +#include &lt;asm/spinlock.h&gt;
<br>&gt; +
<br>&gt; +static DEFINE_SPINLOCK(printk_lock);
<br>&gt; +
<br>&gt; +static char *int2str(long long value, char *buf)
<br>&gt; +{
<br>&gt; +	long long digit, divider =3D 1000000000000000000LL;
<br>&gt; +	int first_digit =3D 1;
<br>&gt; +
<br>&gt; +	if (value &lt; 0) {
<br>&gt; +		*buf++ =3D &#39;-&#39;;
<br>&gt; +		value =3D -value;
<br>&gt; +	}
<br>&gt; +
<br>&gt; +	while (divider &gt; 0) {
<br>&gt; +		digit =3D value / divider;
<br>&gt; +		value %=3D divider;
<br>&gt; +		if (!first_digit || digit &gt; 0 || divider =3D=3D 1) {
<br>&gt; +			*buf++ =3D &#39;0&#39; + digit;
<br>&gt; +			first_digit =3D 0;
<br>&gt; +		}
<br>&gt; +		divider /=3D 10;
<br>&gt; +	}
<br>&gt; +
<br>&gt; +	return buf;
<br>&gt; +}
<br>&gt; +
<br>&gt; +void printk(const char *fmt, ...)
<br>&gt; +{
<br>&gt; +	char buf[128];
<br>&gt; +	va_list ap;
<br>&gt; +	char *p;
<br>&gt; +	char c;
<br>&gt; +	int v;
<br>&gt; +
<br>&gt; +	va_start(ap, fmt);
<br>&gt; +
<br>&gt; +	p =3D buf;
<br>&gt; +
<br>&gt; +	spin_lock(&amp;printk_lock);
<br>&gt; +
<br>&gt; +	while (1) {
<br>&gt; +		c =3D *fmt++;
<br>&gt; +		if (c =3D=3D 0)
<br>&gt; +			break;
<br>&gt; +		else if (c =3D=3D &#39;%&#39;) {
<br>&gt; +			*p =3D 0;
<br>&gt; +			arch_dbg_write(buf);
<br>&gt; +			p =3D buf;
<br>&gt; +
<br>&gt; +			c =3D *fmt++;
<br>&gt; +			switch (c) {
<br>&gt; +			case &#39;d&#39;:
<br>&gt; +				v =3D va_arg(ap, int);
<br>&gt; +				p =3D int2str(v, p);
<br>&gt; +				break;
<br>&gt; +			default:
<br>&gt; +				*p++ =3D &#39;%&#39;;
<br>&gt; +				*p++ =3D c;
<br>&gt; +				break;
<br>&gt; +			}
<br>&gt; +		} else
<br>&gt; +			*p++ =3D c;
<br>&gt; +
<br>&gt; +		if (p &gt;=3D &amp;buf[sizeof(buf) - 1]) {
<br>&gt; +			*p =3D 0;
<br>&gt; +			arch_dbg_write(buf);
<br>&gt; +			p =3D buf;
<br>&gt; +		}
<br>&gt; +	}
<br>&gt; +
<br>&gt; +	*p =3D 0;
<br>&gt; +	arch_dbg_write(buf);
<br>&gt; +
<br>&gt; +	spin_unlock(&amp;printk_lock);
<br>&gt; +
<br>&gt; +	va_end(ap);
<br>&gt; +}
<br>&gt; diff --git a/hypervisor/setup.c b/hypervisor/setup.c
<br>&gt; new file mode 100644
<br>&gt; index 00000000..37521b60
<br>&gt; --- /dev/null
<br>&gt; +++ b/hypervisor/setup.c
<br>&gt; @@ -0,0 +1,32 @@
<br>&gt; +/*
<br>&gt; + * Jailhouse, a Linux-based partioning hypervisor
<br>&gt; + *
<br>&gt; + * Copyright (c) Siemens AG, 2013
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan=
.k...@siemens.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +#include &lt;jailhouse/header.h&gt;
<br>&gt; +#include &lt;jailhouse/processor.h&gt;
<br>&gt; +#include &lt;jailhouse/printk.h&gt;
<br>&gt; +
<br>&gt; +extern void *__bss_start, *__bss_end;
<br>&gt; +
<br>&gt; +static int entry(void)
<br>&gt; +{
<br>&gt; +	printk(&quot;Running hypervisor on CPU %d\n&quot;, processor_id(=
));
<br>&gt; +
<br>&gt; +	return 0;
<br>&gt; +}
<br>&gt; +
<br>&gt; +struct jailhouse_header __attribute__((section(&quot;.header&quot=
;)))
<br>&gt; +hypervisor_header =3D {
<br>&gt; +	.signature =3D JAILHOUSE_SIGNATURE,
<br>&gt; +	.bss_start =3D (unsigned long)&amp;__bss_start,
<br>&gt; +	.bss_end =3D (unsigned long)&amp;__bss_end,
<br>&gt; +	.entry =3D (unsigned long)entry,
<br>&gt; +};
<br>&gt; diff --git a/jailhouse.h b/jailhouse.h
<br>&gt; new file mode 100644
<br>&gt; index 00000000..fd94a1e1
<br>&gt; --- /dev/null
<br>&gt; +++ b/jailhouse.h
<br>&gt; @@ -0,0 +1,16 @@
<br>&gt; +/*
<br>&gt; + * Jailhouse, a Linux-based partioning hypervisor
<br>&gt; + *
<br>&gt; + * Copyright (c) Siemens AG, 2013
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan=
.k...@siemens.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +#include &lt;linux/ioctl.h&gt;
<br>&gt; +
<br>&gt; +#define JAILHOUSE_ENABLE		_IO(0, 0)
<br>&gt; +#define JAILHOUSE_DISABLE		_IO(0, 1)
<br>&gt; diff --git a/main.c b/main.c
<br>&gt; new file mode 100644
<br>&gt; index 00000000..0e10aa5a
<br>&gt; --- /dev/null
<br>&gt; +++ b/main.c
<br>&gt; @@ -0,0 +1,192 @@
<br>&gt; +/*
<br>&gt; + * Jailhouse, a Linux-based partioning hypervisor
<br>&gt; + *
<br>&gt; + * Copyright (c) Siemens AG, 2013
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan=
.k...@siemens.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +#include &lt;linux/kernel.h&gt;
<br>&gt; +#include &lt;linux/module.h&gt;
<br>&gt; +#include &lt;linux/device.h&gt;
<br>&gt; +#include &lt;linux/fs.h&gt;
<br>&gt; +#include &lt;linux/miscdevice.h&gt;
<br>&gt; +#include &lt;linux/firmware.h&gt;
<br>&gt; +#include &lt;linux/mm.h&gt;
<br>&gt; +#include &lt;linux/smp.h&gt;
<br>&gt; +
<br>&gt; +#include &lt;jailhouse.h&gt;
<br>&gt; +#include &lt;jailhouse/header.h&gt;
<br>&gt; +
<br>&gt; +#define JAILHOUSE_FW_NAME	&quot;jailhouse.bin&quot;
<br>&gt; +
<br>&gt; +#define GFP_JAILHOUSE		(GFP_KERNEL | __GFP_NO_KSWAPD | __GFP_NOTR=
ACK)
<br>&gt; +
<br>&gt; +MODULE_DESCRIPTION(&quot;Loader for Jailhouse partitioning hyperv=
isor&quot;);
<br>&gt; +MODULE_LICENSE(&quot;GPL&quot;);
<br>&gt; +MODULE_FIRMWARE(JAILHOUSE_FW_NAME);
<br>&gt; +
<br>&gt; +static struct device *jailhouse_dev;
<br>&gt; +static DEFINE_MUTEX(lock);
<br>&gt; +static bool enabled;
<br>&gt; +static char *hypervisor_mem;
<br>&gt; +static atomic_t entry_done;
<br>&gt; +static int entry_error;
<br>&gt; +
<br>&gt; +static void enter_hypervisor(void *info)
<br>&gt; +{
<br>&gt; +	struct jailhouse_header *header =3D info;
<br>&gt; +	int err;
<br>&gt; +
<br>&gt; +	/* either returns 0 or the same error code across all CPUs */
<br>&gt; +	err =3D ((int (*)(void))(hypervisor_mem + header-&gt;entry))();
<br>&gt; +	if (err)
<br>&gt; +		entry_error =3D err;
<br>&gt; +
<br>&gt; +	atomic_inc(&amp;entry_done);
<br>&gt; +}
<br>&gt; +
<br>&gt; +static int jailhouse_enable(void)
<br>&gt; +{
<br>&gt; +	const struct firmware *hypervisor;
<br>&gt; +	struct jailhouse_header *header;
<br>&gt; +	size_t hypervisor_size;
<br>&gt; +	int err;
<br>&gt; +
<br>&gt; +	if (mutex_lock_interruptible(&amp;lock) !=3D 0)
<br>&gt; +		return -EINTR;
<br>&gt; +
<br>&gt; +	err =3D -EBUSY;
<br>&gt; +	if (enabled || !try_module_get(THIS_MODULE))
<br>&gt; +		goto error_unlock;
<br>&gt; +
<br>&gt; +	err =3D request_firmware(&amp;hypervisor, JAILHOUSE_FW_NAME, jai=
lhouse_dev);
<br>&gt; +	if (err)
<br>&gt; +		goto error_put_module;
<br>&gt; +
<br>&gt; +	header =3D (struct jailhouse_header *)hypervisor-&gt;data;
<br>&gt; +
<br>&gt; +	err =3D -EINVAL;
<br>&gt; +	if (memcmp(header-&gt;signature, JAILHOUSE_SIGNATURE,
<br>&gt; +		   sizeof(header-&gt;signature)) !=3D 0)
<br>&gt; +		goto error_release_fw;
<br>&gt; +
<br>&gt; +	err =3D -ENOMEM;
<br>&gt; +	hypervisor_size =3D PAGE_ALIGN(hypervisor-&gt;size) +
<br>&gt; +		PAGE_ALIGN(header-&gt;bss_end - header-&gt;bss_start);
<br>&gt; +	hypervisor_mem =3D __vmalloc(hypervisor_size,
<br>&gt; +				   GFP_JAILHOUSE, PAGE_KERNEL_EXEC);
<br>&gt; +	if (!hypervisor_mem)
<br>&gt; +		goto error_release_fw;
<br>&gt; +
<br>&gt; +	memcpy(hypervisor_mem, hypervisor-&gt;data, hypervisor-&gt;size)=
;
<br>&gt; +
<br>&gt; +	preempt_disable();
<br>&gt; +
<br>&gt; +	atomic_set(&amp;entry_done, 0);
<br>&gt; +	on_each_cpu(enter_hypervisor, header, 0);
<br>&gt; +	while (atomic_read(&amp;entry_done) !=3D num_online_cpus())
<br>&gt; +		cpu_relax();
<br>&gt; +
<br>&gt; +	preempt_enable();
<br>&gt; +
<br>&gt; +	if (entry_error) {
<br>&gt; +		err =3D entry_error;
<br>&gt; +		goto error_release_fw;
<br>&gt; +	}
<br>&gt; +
<br>&gt; +	release_firmware(hypervisor);
<br>&gt; +
<br>&gt; +	enabled =3D true;
<br>&gt; +
<br>&gt; +	mutex_unlock(&amp;lock);
<br>&gt; +
<br>&gt; +	printk(&quot;The Jailhouse is opening.\n&quot;);
<br>&gt; +
<br>&gt; +	return 0;
<br>&gt; +
<br>&gt; +error_release_fw:
<br>&gt; +	release_firmware(hypervisor);
<br>&gt; +
<br>&gt; +error_put_module:
<br>&gt; +	module_put(THIS_MODULE);
<br>&gt; +
<br>&gt; +error_unlock:
<br>&gt; +	mutex_unlock(&amp;lock);
<br>&gt; +	return err;
<br>&gt; +}
<br>&gt; +
<br>&gt; +static int jailhouse_disable(void)
<br>&gt; +{
<br>&gt; +	if (mutex_lock_interruptible(&amp;lock) !=3D 0)
<br>&gt; +		return -EINTR;
<br>&gt; +
<br>&gt; +	if (!enabled) {
<br>&gt; +		mutex_unlock(&amp;lock);
<br>&gt; +		return -EINVAL;
<br>&gt; +	}
<br>&gt; +
<br>&gt; +	vfree(hypervisor_mem);
<br>&gt; +
<br>&gt; +	enabled =3D false;
<br>&gt; +	module_put(THIS_MODULE);
<br>&gt; +
<br>&gt; +	mutex_unlock(&amp;lock);
<br>&gt; +
<br>&gt; +	printk(&quot;The Jailhouse was closed.\n&quot;);
<br>&gt; +
<br>&gt; +	return 0;
<br>&gt; +}
<br>&gt; +
<br>&gt; +static long jailhouse_ioctl(struct file *file, unsigned int ioctl=
,
<br>&gt; +			    unsigned long arg)
<br>&gt; +{
<br>&gt; +	long err;
<br>&gt; +
<br>&gt; +	switch (ioctl) {
<br>&gt; +	case JAILHOUSE_ENABLE:
<br>&gt; +		err =3D jailhouse_enable();
<br>&gt; +		break;
<br>&gt; +	case JAILHOUSE_DISABLE:
<br>&gt; +		err =3D jailhouse_disable();
<br>&gt; +		break;
<br>&gt; +	default:
<br>&gt; +		err =3D -EINVAL;
<br>&gt; +		break;
<br>&gt; +	}
<br>&gt; +
<br>&gt; +	return err;
<br>&gt; +}
<br>&gt; +
<br>&gt; +static struct file_operations jailhouse_fops =3D {
<br>&gt; +	.owner =3D THIS_MODULE,
<br>&gt; +	.unlocked_ioctl =3D jailhouse_ioctl,
<br>&gt; +	.llseek =3D noop_llseek,
<br>&gt; +};
<br>&gt; +
<br>&gt; +static struct miscdevice jailhouse_misc_dev =3D {
<br>&gt; +	.minor =3D MISC_DYNAMIC_MINOR,
<br>&gt; +	.name =3D &quot;jailhouse&quot;,
<br>&gt; +	.fops =3D &amp;jailhouse_fops,
<br>&gt; +};
<br>&gt; +
<br>&gt; +static int __init jailhouse_init(void)
<br>&gt; +{
<br>&gt; +	jailhouse_dev =3D root_device_register(&quot;jailhouse&quot;);
<br>&gt; +	if (IS_ERR(jailhouse_dev))
<br>&gt; +		return PTR_ERR(jailhouse_dev);
<br>&gt; +	return misc_register(&amp;jailhouse_misc_dev);
<br>&gt; +}
<br>&gt; +
<br>&gt; +static void __exit jailhouse_exit(void)
<br>&gt; +{
<br>&gt; +	misc_deregister(&amp;jailhouse_misc_dev);
<br>&gt; +	root_device_unregister(jailhouse_dev);
<br>&gt; +}
<br>&gt; +
<br>&gt; +module_init(jailhouse_init);
<br>&gt; +module_exit(jailhouse_exit);
<br>&gt; diff --git a/tools/Makefile b/tools/Makefile
<br>&gt; new file mode 100644
<br>&gt; index 00000000..8d065557
<br>&gt; --- /dev/null
<br>&gt; +++ b/tools/Makefile
<br>&gt; @@ -0,0 +1,20 @@
<br>&gt; +#
<br>&gt; +# Jailhouse, a Linux-based partioning hypervisor
<br>&gt; +#
<br>&gt; +# Copyright (c) Siemens AG, 2013
<br>&gt; +#
<br>&gt; +# Authors:
<br>&gt; +#  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan.=
k...@siemens.com</a>&gt;
<br>&gt; +#
<br>&gt; +# This work is licensed under the terms of the GNU GPL, version 2=
.  See
<br>&gt; +# the COPYING file in the top-level directory.
<br>&gt; +#
<br>&gt; +
<br>&gt; +CC =3D $(CROSS_COMPILE)gcc
<br>&gt; +
<br>&gt; +CFLAGS =3D -g -O3 -I.. -Wall -Wmissing-declarations -Wmissing-pro=
totypes
<br>&gt; +
<br>&gt; +jailhouse: jailhouse.c ../jailhouse.h
<br>&gt; +
<br>&gt; +clean:
<br>&gt; +	rm -f jailhouse
<br>&gt; diff --git a/tools/jailhouse.c b/tools/jailhouse.c
<br>&gt; new file mode 100644
<br>&gt; index 00000000..11d66e16
<br>&gt; --- /dev/null
<br>&gt; +++ b/tools/jailhouse.c
<br>&gt; @@ -0,0 +1,67 @@
<br>&gt; +/*
<br>&gt; + * Jailhouse, a Linux-based partioning hypervisor
<br>&gt; + *
<br>&gt; + * Copyright (c) Siemens AG, 2013
<br>&gt; + *
<br>&gt; + * Authors:
<br>&gt; + *  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan=
.k...@siemens.com</a>&gt;
<br>&gt; + *
<br>&gt; + * This work is licensed under the terms of the GNU GPL, version =
2.  See
<br>&gt; + * the COPYING file in the top-level directory.
<br>&gt; + */
<br>&gt; +
<br>&gt; +#include &lt;stdio.h&gt;
<br>&gt; +#include &lt;stdlib.h&gt;
<br>&gt; +#include &lt;string.h&gt;
<br>&gt; +#include &lt;unistd.h&gt;
<br>&gt; +#include &lt;fcntl.h&gt;
<br>&gt; +#include &lt;sys/ioctl.h&gt;
<br>&gt; +
<br>&gt; +#include &lt;jailhouse.h&gt;
<br>&gt; +
<br>&gt; +static void help(const char *progname)
<br>&gt; +{
<br>&gt; +	printf(&quot;%s enable|disable\n&quot;, progname);
<br>&gt; +}
<br>&gt; +
<br>&gt; +static int open_dev()
<br>&gt; +{
<br>&gt; +	int fd;
<br>&gt; +
<br>&gt; +	fd =3D open(&quot;/dev/jailhouse&quot;, O_RDWR);
<br>&gt; +	if (fd &lt; 0) {
<br>&gt; +		perror(&quot;opening /dev/jailhouse&quot;);
<br>&gt; +		exit(1);
<br>&gt; +	}
<br>&gt; +	return fd;
<br>&gt; +}
<br>&gt; +
<br>&gt; +int main(int argc, char *argv[])
<br>&gt; +{
<br>&gt; +	int fd;
<br>&gt; +	int err;
<br>&gt; +
<br>&gt; +	if (argc &lt; 2) {
<br>&gt; +		help(argv[0]);
<br>&gt; +		exit(1);
<br>&gt; +	}
<br>&gt; +
<br>&gt; +	if (strcmp(argv[1], &quot;enable&quot;) =3D=3D 0) {
<br>&gt; +		fd =3D open_dev();
<br>&gt; +		err =3D ioctl(fd, JAILHOUSE_ENABLE);
<br>&gt; +		if (err)
<br>&gt; +			perror(&quot;JAILHOUSE_ENABLE&quot;);
<br>&gt; +	} else if (strcmp(argv[1], &quot;disable&quot;) =3D=3D 0) {
<br>&gt; +		fd =3D open_dev();
<br>&gt; +		err =3D ioctl(fd, JAILHOUSE_DISABLE);
<br>&gt; +		if (err)
<br>&gt; +			perror(&quot;JAILHOUSE_DISABLE&quot;);
<br>&gt; +	} else {
<br>&gt; +		help(argv[0]);
<br>&gt; +		exit(1);
<br>&gt; +	}
<br>&gt; +
<br>&gt; +	close(fd);
<br>&gt; +
<br>&gt; +	return 0;
<br>&gt; +}
<br>&gt;=20
<br>
<br>--=20
<br>=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,
<br>=D0=A1=D0=B8=D0=BD=D0=B8=D1=86=D1=8B=D0=BD =D0=92=D0=B0=D0=BB=D0=B5=D0=
=BD=D1=82=D0=B8=D0=BD
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5380cf64-00a5-4693-9d84-1854854f7d26n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/5380cf64-00a5-4693-9d84-1854854f7d26n%40googlegroups.co=
m</a>.<br />

------=_Part_1591_1018717864.1674706299177--

------=_Part_1590_1882894942.1674706299177--
