Return-Path: <jailhouse-dev+bncBCMZLOEWZYNBBH6VQGZQMGQEC6YSIRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A2E8FCF98
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Jun 2024 15:39:45 +0200 (CEST)
Received: by mail-yb1-xb3d.google.com with SMTP id 3f1490d57ef6-dc691f1f83asf602980276.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Jun 2024 06:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717594784; x=1718199584; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znZrwMME0JYL3WGJLvk8hwV+Ge4V92afTqrVEEv/pQ4=;
        b=C74VvbQzcHrjosikNEKRZs+sj2AyZ8bDW+euBEibEXzpCTqSZaIUnSAkZXdYeCCB4I
         hhzcqQ0BBPD+1Ri3X2GeMxdJV9bmayA0+imsmygFnWnMUEyUOElvHyR2Mjg/z/c+LSud
         DUNLBrLtqhZtAIZShIQFf7utoaKScyJlZPUe1ckHj4UgBSu7eriRZIoB+Rck6MZOvek5
         J97HKs80YWA+YMsg4TrZ5m5UTI6LOKudDkW10pKkGU4e7Ga3m/G48X7N+QTmM8C1GdzD
         6/zDqiee7kClHVkE61eQ1sXLphOeK6N/tKRouRhPapJJa+oaR6JbRNF6bD9pNZa2bIea
         5Qaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717594784; x=1718199584; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znZrwMME0JYL3WGJLvk8hwV+Ge4V92afTqrVEEv/pQ4=;
        b=dmDX9c1bu5JVkA7tV4cNOvbRlREPXK9zRfGtwbCu4TMuaLT+Im1Tl1V4492ID+66Vv
         N4G+9fbS9H4FKRcXlegBehoqYzjKbVccxCfR77zdFEuj7iA/srba1idw+OYW2z02bZ4l
         cO5Fi9SmXF88QgoEmTbtaA7aizLqyJ1ZK9h5QNU89p0+8phP+rJNxEjSPhzD6kvieMQW
         oO7WiObLc3xsEdmF3/LWaphi6U7a6UuRCTzgkMbSplGziVlSE2YLWJLWmr1LVNZMPl0e
         BD5i/NqRFteFQq5/vaAORCFWdxcax8F/l85nGOQs6p8DzyuYHnJfTu+5Cl+k5ORDc+Gt
         AMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717594784; x=1718199584;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znZrwMME0JYL3WGJLvk8hwV+Ge4V92afTqrVEEv/pQ4=;
        b=fmcA3PRCLNoay6oPFPEPxClXQCS1OVmCwy5liyaBO/0OQBdkwRkVLBHORKteRqirqi
         3XBZ+eyVU6yZMMeehwJBiwV+VuccvSOs+KUem3zhtkQG+mpRZkt+JNCc8n6vCpgV762O
         gcBCHzRmorwD/5KeKsRRwNTZrux3bHHwTi7vY0+i1Pjm2Su4UoYS5/U4EXEpyUnlW3vZ
         zv/mlW1qZSxOnzeSI76EhR6URLyv7NuihUvJpr6N8D0Zf8J+8UEIeEGkD2eHrnHzlgd6
         R96PwWSyCFDW2LCr0dMQ7RHCDFdESx+0TVmyVur8YgcGWqwEkezgw5CS1rcoEJtGDElq
         MBKw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVuJAw/4V1i5O14/ue0t5vZG2w8YsY4MkqbsugLaZfN8lgy9T5Fhu8GJ3sHG618uOYhJeY7YoydwULF1dkFzK2tzGS/TrAjDNd4PIE=
X-Gm-Message-State: AOJu0YwRTK9/iR4Sm5QOrTy4HcjKb3Wj1naj6lxYEM1KcictY/fj2ViB
	e7/mfWcLheeMJbHNUlOmKiadqFgsHytGWMlmxGVLtAj79pQq7G9/
X-Google-Smtp-Source: AGHT+IEjdA2vX1GiQOfc2jRPic2LGZlDCLBeE3PKH+JEyw+x1WD03PNUmLceeJHtmECHur0Wt7o/+g==
X-Received: by 2002:a25:d0c1:0:b0:dee:9e57:3e26 with SMTP id 3f1490d57ef6-dfab85239cbmr4606772276.4.1717594784401;
        Wed, 05 Jun 2024 06:39:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:b324:0:b0:df4:e1a7:3170 with SMTP id 3f1490d57ef6-dfa59b002a5ls1414529276.2.-pod-prod-03-us;
 Wed, 05 Jun 2024 06:39:42 -0700 (PDT)
X-Received: by 2002:a05:690c:660c:b0:627:a97a:3bcc with SMTP id 00721157ae682-62cbb5dd177mr7047347b3.9.1717594781065;
        Wed, 05 Jun 2024 06:39:41 -0700 (PDT)
Date: Wed, 5 Jun 2024 06:39:40 -0700 (PDT)
From: Syed Aftab Rashid <saftab.rashid@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <24e28829-f60b-41b9-9c33-0b23156cc81en@googlegroups.com>
Subject: Setting up Jailhouse on an Intel Xeon Machine
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_88993_2113463324.1717594780239"
X-Original-Sender: saftab.rashid@gmail.com
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

------=_Part_88993_2113463324.1717594780239
Content-Type: multipart/alternative; 
	boundary="----=_Part_88994_953586320.1717594780239"

------=_Part_88994_953586320.1717594780239
Content-Type: text/plain; charset="UTF-8"

Hi all,


I have managed to successfully install and use Jailhouse on an old x86 
machine. However, I have recently got a relatively new intel Xeon machine 
that supports CAT etc so I want to test Jailhouse on that machine. The 
machine specs are given here HP Z4 G5 PTC certified, Intel Xeon W3-2435 SSD 
PCIe , NVIDIA RTX A4000 , Win10 Pro/Win (Xeon W, 64 GB, 1000 GB, SSD, 
GeForce RTX 4000 Ada) - digitec 
<https://www.digitec.ch/en/s1/product/hp-z4-g5-ptc-certified-intel-xeon-w3-2435-ssd-pcie-nvidia-rtx-a4000-win10-prowin-xeon-w-64-gb-1000-g-39689571>

I have jailhouse installed on the system, however when I try to enable the 
root cell the system hangs. I have a serial console and the output on the 
serial console is as follows

Initializing Jailhouse hypervisor v0.12 (342-gd6e64f90) on CPU 5
Code location: 0xfffffffff0000050
Using x2APIC
Page pool usage after early setup: mem 135/32207, remap 0/131072
Initializing processors:
CPU 5...

the system hangs afterward and there is no more output on the serial port.


I have traced the problem and it seems to be at this function call in 
jailhouse/hypervisor/arch/x86/setup.c 


write_msr(MSR_IA32_PAT, PAT_HOST_VALUE);

the code never returns from this function when initializing the first 
processor and hangs. What might be the problem? The function is as follows


static inline void write_msr(unsigned int msr, unsigned long val)
{
asm volatile("wrmsr"
: /* no output */
: "c" (msr), "a" (val), "d" (val >> 32)
: "memory");
}

The problem seems to be in writing the MSR_IA32_PAT register. I have tried 
to write the same value I read from the register as well, e.g., 

cpu_data->pat = read_msr(MSR_IA32_PAT);
write_msr(MSR_IA32_PAT,  cpu_data->pat ); 

but the behavior is the same. Any insights on what can the problem be?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/24e28829-f60b-41b9-9c33-0b23156cc81en%40googlegroups.com.

------=_Part_88994_953586320.1717594780239
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,<br /><br /><br />I have managed to successfully install and use Jai=
lhouse on an old x86 machine. However, I have recently got a relatively new=
 intel Xeon machine that supports CAT etc so I want to test Jailhouse on th=
at machine. The machine specs are given here <a href=3D"https://www.digitec=
.ch/en/s1/product/hp-z4-g5-ptc-certified-intel-xeon-w3-2435-ssd-pcie-nvidia=
-rtx-a4000-win10-prowin-xeon-w-64-gb-1000-g-39689571">HP Z4 G5 PTC certifie=
d, Intel Xeon W3-2435 SSD PCIe , NVIDIA RTX A4000 , Win10 Pro/Win (Xeon W, =
64 GB, 1000 GB, SSD, GeForce RTX 4000 Ada) - digitec</a><br /><br />I have =
jailhouse installed on the system, however when I try to enable the root ce=
ll the system hangs. I have a serial console and the output on the serial c=
onsole is as follows<br /><br />Initializing Jailhouse hypervisor v0.12 (34=
2-gd6e64f90) on CPU 5<br />Code location: 0xfffffffff0000050<br />Using x2A=
PIC<br />Page pool usage after early setup: mem 135/32207, remap 0/131072<b=
r />Initializing processors:<br /> CPU 5...<br /><br />the system hangs aft=
erward and there is no more output on the serial port.<br /><br /><br />I h=
ave traced the problem and it seems to be at this function call in jailhous=
e/hypervisor/arch/x86/setup.c <br /><br /><br />write_msr(MSR_IA32_PAT, PAT=
_HOST_VALUE);<br /><br />the code never returns from this function when ini=
tializing the first processor and hangs. What might be the problem? The fun=
ction is as follows<br /><br /><br />static inline void write_msr(unsigned =
int msr, unsigned long val)<br />{<br />asm volatile("wrmsr"<br />: /* no o=
utput */<br />: "c" (msr), "a" (val), "d" (val &gt;&gt; 32)<br />: "memory"=
);<br />}<br /><div><br /></div><div>The problem seems to be in writing the=
 MSR_IA32_PAT register. I have tried to write the same value I read from th=
e register as well, e.g.,=C2=A0</div><div><br /></div>cpu_data-&gt;pat =3D =
read_msr(MSR_IA32_PAT);<br /><div>write_msr(MSR_IA32_PAT,=C2=A0

cpu_data-&gt;pat=C2=A0);=C2=A0</div><div><br /></div><div>but the behavior =
is the same. Any insights on what can the problem be?</div><div><br /></div=
>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/24e28829-f60b-41b9-9c33-0b23156cc81en%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/24e28829-f60b-41b9-9c33-0b23156cc81en%40googlegroups.co=
m</a>.<br />

------=_Part_88994_953586320.1717594780239--

------=_Part_88993_2113463324.1717594780239--
