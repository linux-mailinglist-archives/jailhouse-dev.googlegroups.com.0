Return-Path: <jailhouse-dev+bncBD4MLPEEWIHBBBPT72QQMGQEE3FXJOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC556E76C1
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Apr 2023 11:51:02 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id 188-20020a250ac5000000b00b9265c9a5e9sf5414763ybk.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Apr 2023 02:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1681897862; x=1684489862;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuzrAea8KlmfuzGNCzW/Mq3HaIB3ZlIUjK9uHy9GU64=;
        b=HRiXenjKce3Aj3JeE7dQyhaoYM+hMT6hurvlplYJuM4mgSTloloSUNti9xEcr4yw0p
         xudU6fmVwLv5BXL5uJQlBUQeLt7p4W1snUghO9rPtCgrM4/Pyk34BZpEiXTEZTBCgi9n
         /g3mhXtok4B9NMmbpcEnaJWmqiCg2ryEBa3tCkySquJyKRp5dQnXXAlN8y9s+RIFSENW
         cWK8PTLE0jTQ34jl2ThDdIRdhnwzE66FPpUWbCeMuoxfYd2/Ei3UMwjKqOzOefFwcW3q
         l+p2o51LNYwyOdwRN8eN0A7OESoWHYggLnSxxhnRh+LP/aLXs2iEqwdzWaKL/+KxGpTu
         ur7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681897862; x=1684489862;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuzrAea8KlmfuzGNCzW/Mq3HaIB3ZlIUjK9uHy9GU64=;
        b=TpP6xQSd6y3LLIC2S4vMzcI+NYMcl58ckR9anIabLSrSfR5hIq/lAuJs+DMSqyji0/
         Opa0qF+3PbBbgim0zxYTBWAn7xo6gfefVq5BKJPJeZeq8TQGAruSHF1jJbOrc9x1kp31
         aHt+2CHhe15knJAgBkia31HUOiYGdKKh2QVm2T2PZA7ft+BIwXaTmrQ3TqbEJZ5WzyNe
         +39Hv5sljJd66JCDAut6mRx3eLxKizVD9uTMNLfDwjMqWE0BOLey4+2PUQSO4ZUDXUMr
         z9iNSYcLTH2EOZJ7VqvbGTDa81E0HRmp8NU5nblp3nFfTAbbwZByGtne4+WULEqojZwR
         vLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681897862; x=1684489862;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuzrAea8KlmfuzGNCzW/Mq3HaIB3ZlIUjK9uHy9GU64=;
        b=joCKRWotYMUnL/EbnfbwxTyXTw5npW9Ybh1CWlbnX8tmPUW4V2dRVYFcWPEQ321Fhg
         R3e56bYQLFR0o3wI8hr33T2YiLBUPIwmWWU3K/0iGAFehr2fL1PQE8dprfZdWi4oZUYc
         Il5Pv6JJvPQ1SmAI7909h0DXjut/lebiJmw07qmkG0GQ+raJtxPYecm5NQflTjnakMma
         pnNMI954EWdlp0JPrbqFzOnfnCojtBS1iljYrpEnxuiP0xSlLnAhZ6zxW8Rq2ogf/hHB
         EFtin01WlMq6GnvkhWaJQceLgwyI4IGFbnUYLRWZcdEtBGKbFFdGuXpUqTLhwH41XdMV
         DXZA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AAQBX9cDv1PMJ/A6k1TzGRfsqPgOq2L5X4uHIQ25ugR0xun9Zh+7cTQH
	mh5kiAE9eArnrz/GTIDub24=
X-Google-Smtp-Source: AKy350YtPz40iif3/2bAVWlD2N7m9tQPjIwYC0kvLBSrr/dhsLDn7bbEmauMgv9rD0gPMJcmCPmgFA==
X-Received: by 2002:a25:748e:0:b0:b6c:2d28:b3e7 with SMTP id p136-20020a25748e000000b00b6c2d28b3e7mr14139296ybc.9.1681897861841;
        Wed, 19 Apr 2023 02:51:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1401:b0:b8b:d606:e78d with SMTP id
 z1-20020a056902140100b00b8bd606e78dls12050478ybu.11.-pod-prod-gmail; Wed, 19
 Apr 2023 02:51:00 -0700 (PDT)
X-Received: by 2002:a25:d44a:0:b0:b77:676c:773c with SMTP id m71-20020a25d44a000000b00b77676c773cmr14081006ybf.2.1681897860441;
        Wed, 19 Apr 2023 02:51:00 -0700 (PDT)
Date: Wed, 19 Apr 2023 02:50:59 -0700 (PDT)
From: Paresh Bhagat <pareshbhagat29@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a89ac0da-35eb-420a-bb5a-0d4edd0ce2ebn@googlegroups.com>
Subject: Kernel panic while enabling jailhouse using 6.1 kernel
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2116_1442206217.1681897859861"
X-Original-Sender: pareshbhagat29@gmail.com
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

------=_Part_2116_1442206217.1681897859861
Content-Type: multipart/alternative; 
	boundary="----=_Part_2117_122312652.1681897859861"

------=_Part_2117_122312652.1681897859861
Content-Type: text/plain; charset="UTF-8"

I am getting kernel panic when trying to enable jailhouse on TI AM62x with 
6.1 kernel. Jailhouse was working fine on 5.10 kernel using the same 
jailhouse config files.  

[  136.823346] Unable to handle kernel execute from non-executable memory 
at virtual address ffff80000b404000

[  136.823346] Unable to handle kernel execute from non-executable memory 
at virtual address ffff80000b404000

[  136.823347] Unable to handle kernel execute from non-executable memory 
at virtual address ffff80000b404000

[  136.823346] Unable to handle kernel execute from non-executable memory 
at virtual address ffff80000b404000

[  136.823366] Mem abort info:

[  136.823367] Mem abort info:

[  136.823367] Mem abort info:

[  136.823369]   ESR = 0x000000008600000e

[  136.823369]   ESR = 0x000000008600000e

[  136.823370]   ESR = 0x000000008600000e

[  136.823372]   EC = 0x21: IABT (current EL), IL = 32 bits

[  136.823372]   EC = 0x21: IABT (current EL), IL = 32 bits

[  136.823374]   EC = 0x21: IABT (current EL), IL = 32 bits

[  136.823378]   SET = 0, FnV = 0

[  136.823379]   SET = 0, FnV = 0

[  136.823381]   EA = 0, S1PTW = 0

[  136.823382]   EA = 0, S1PTW = 0

[  136.823385]   FSC = 0x0e: level 2 permission fault

[  136.823385]   FSC = 0x0e: level 2 permission fault

[  136.823390] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000082f89000

[  136.823390] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000082f89000

[  136.823396] [ffff80000b404000] pgd=10000000df9ff003

[  136.823396] [ffff80000b404000] pgd=10000000df9ff003

[  136.823401] , p4d=10000000df9ff003

[  136.823401] , p4d=10000000df9ff003

[  136.823404] , pud=10000000df9fe003

[  136.823406] , pud=10000000df9fe003

[  136.823407] , pmd=00680000dfc00701

[  136.823409] , pmd=00680000dfc00701

[  136.823410]

[  136.823412]

[  136.823415] Internal error: Oops: 000000008600000e [#1] PREEMPT SMP

[  136.823421] Modules linked in: jailhouse(O) xhci_plat_hcd 
snd_soc_hdmi_codec dwc3 snd_soc_simple_card snd_soc_simple_card_utils crct

10dif_ce display_connector sii902x dwc3_am62 drm_kms_helper cfbfillrect 
syscopyarea cfbimgblt sysfillrect sysimgblt fb_sys_fops cfbcopy

area sa2ul sha256_generic libsha256 authenc drm tps6598x 
drm_panel_orientation_quirks typec ipv6

[  136.823511] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G           O       
6.1.12-00113-g78816b00ff46-dirty #10

[  136.823521] Hardware name: Texas Instruments AM625 SK (DT)

[  136.823526] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)

[  136.823535] pc : 0xffff80000b404000

[  136.823548] lr : enter_hypervisor+0x44/0xa8 [jailhouse]

[  136.823573] sp : ffff80000800bf10

[  136.823576] x29: ffff80000800bf10 x28: ffff00000018c600 x27: 
0000000000000000

[  136.823587] x26: ffff00000018c600 x25: 0000000000000000 x24: 
0000000000000000

[  136.823598] x23: 0000000000000000 x22: 0000000000000000 x21: 
0000000000000000

[  136.823609] x20: 0000000000000000 x19: ffff800000d76000 x18: 
0000000000000002

[  136.823619] x17: ffff80005664e000 x16: ffff80000800c000 x15: 
0000000000004000

[  136.823630] x14: 000000000000001d x13: 0000000000000000 x12: 
0000000000000001

[  136.823641] x11: 0000000000000040 x10: ffff000000006170 x9 : 
ffff000000006168

[  136.823651] x8 : ffff0000004004b8 x7 : 0000000000000000 x6 : 
0000000000000000

[  136.823661] x5 : ffff80005664e000 x4 : 0000000000000000 x3 : 
0000000000000001

[  136.823672] x2 : ffff80000b400000 x1 : ffff80000b404000 x0 : 
0000000000000001

[  136.823683] Call trace:

[  136.823687]  0xffff80000b404000

[  136.823693]  __flush_smp_call_function_queue+0xd4/0x260

[  136.823710]  generic_smp_call_function_single_interrupt+0x14/0x20

[  136.823719]  ipi_handler+0xac/0x150

[  136.823730]  handle_percpu_devid_irq+0x84/0x138

[  136.823742]  generic_handle_domain_irq+0x2c/0x48

[  136.823750]  gic_handle_irq+0x50/0x130

[  136.823761]  call_on_irq_stack+0x2c/0x54

[  136.823771]  do_interrupt_handler+0x80/0x88

[  136.823780]  el1_interrupt+0x38/0x70

[  136.823789]  el1h_64_irq_handler+0x18/0x28

[  136.823796]  el1h_64_irq+0x64/0x68

[  136.823802]  arch_cpu_idle+0x18/0x28

[  136.823810]  default_idle_call+0x24/0x6c

[  136.823819]  do_idle+0x200/0x248

[  136.823826]  cpu_startup_entry+0x24/0x30

[  136.823832]  secondary_start_kernel+0x124/0x148

[  136.823841]  __secondary_switched+0xb0/0xb4

[  136.823856] Code: 00000000 00000000 00000000 00000000 (aa0003f0)

[  136.823863] ---[ end trace 0000000000000000 ]---

[  136.823868] Kernel panic - not syncing: Oops: Fatal exception in 
interrupt

[  136.823873] SMP: stopping secondary CPUs

[  136.833005] Mem abort info:

[  136.833007]   ESR = 0x000000008600000e

[  136.833011]   EC = 0x21: IABT (current EL), IL = 32 bits

[  136.833015]   SET = 0, FnV = 0

[  136.833018]   EA = 0, S1PTW = 0

[  136.833020]   FSC = 0x0e: level 2 permission fault

[  136.833024] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000082f89000

[  136.833028] [ffff80000b404000] pgd=10000000df9ff003, 
p4d=10000000df9ff003, pud=10000000df9fe003, pmd=00680000dfc00701

[  136.842633]   SET = 0, FnV = 0

[  136.852263]   EA = 0, S1PTW = 0

[  136.861893]   FSC = 0x0e: level 2 permission fault

[  136.864676] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000082f89000

[  136.867461] [ffff80000b404000] pgd=10000000df9ff003, 
p4d=10000000df9ff003, pud=10000000df9fe003, pmd=00680000dfc00701

[  137.899406] SMP: failed to stop secondary CPUs 0-3

[  138.291494] Kernel Offset: disabled

[  138.294970] CPU features: 0x00000,00800084,0000420b

[  138.299835] Memory Limit: none

 

[  138.302882] ---[ end Kernel panic - not syncing: Oops: Fatal exception 
in interrupt ]---


Thanks

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a89ac0da-35eb-420a-bb5a-0d4edd0ce2ebn%40googlegroups.com.

------=_Part_2117_122312652.1681897859861
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am getting kernel panic when trying to enable jailhouse on TI AM62x with =
6.1 kernel. Jailhouse was working fine on 5.10 kernel using the same jailho=
use config files.=C2=A0=C2=A0<div><br /></div><div><p style=3D"margin: 0in;=
 font-family: Calibri; font-size: 11pt;">[=C2=A0 136.823346] Unable to hand=
le kernel execute
from non-executable memory at virtual address ffff80000b404000</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823346] Unable to handle kernel execute
from non-executable memory at virtual address ffff80000b404000</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823347] Unable to handle kernel execute
from non-executable memory at virtual address ffff80000b404000</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823346] Unable to handle kernel execute
from non-executable memory at virtual address ffff80000b404000</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823366] Mem abort info:</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823367] Mem abort info:</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823367] Mem abort info:</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823369]=C2=A0=C2=A0
ESR =3D 0x000000008600000e</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823369]=C2=A0=C2=A0
ESR =3D 0x000000008600000e</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823370]=C2=A0=C2=A0
ESR =3D 0x000000008600000e</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823372]=C2=A0=C2=A0
EC =3D 0x21: IABT (current EL), IL =3D 32 bits</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823372]=C2=A0=C2=A0
EC =3D 0x21: IABT (current EL), IL =3D 32 bits</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823374]=C2=A0=C2=A0
EC =3D 0x21: IABT (current EL), IL =3D 32 bits</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823378]=C2=A0=C2=A0
SET =3D 0, FnV =3D 0</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823379]=C2=A0=C2=A0
SET =3D 0, FnV =3D 0</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823381]=C2=A0=C2=A0
EA =3D 0, S1PTW =3D 0</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823382]=C2=A0=C2=A0
EA =3D 0, S1PTW =3D 0</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823385]=C2=A0=C2=A0
FSC =3D 0x0e: level 2 permission fault</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823385]=C2=A0=C2=A0
FSC =3D 0x0e: level 2 permission fault</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823390] swapper pgtable: 4k pages, 48-bit
VAs, pgdp=3D0000000082f89000</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823390] swapper pgtable: 4k pages, 48-bit
VAs, pgdp=3D0000000082f89000</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823396] [ffff80000b404000]
pgd=3D10000000df9ff003</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823396] [ffff80000b404000]
pgd=3D10000000df9ff003</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823401] , p4d=3D10000000df9ff003</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823401] , p4d=3D10000000df9ff003</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823404] , pud=3D10000000df9fe003</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823406] , pud=3D10000000df9fe003</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823407] , pmd=3D00680000dfc00701</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823409] , pmd=3D00680000dfc00701</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823410]</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823412]</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823415] Internal error: Oops:
000000008600000e [#1] PREEMPT SMP</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823421] Modules linked in: jailhouse(O)
xhci_plat_hcd snd_soc_hdmi_codec dwc3 snd_soc_simple_card
snd_soc_simple_card_utils crct</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">10dif_ce
display_connector sii902x dwc3_am62 drm_kms_helper cfbfillrect syscopyarea
cfbimgblt sysfillrect sysimgblt fb_sys_fops cfbcopy</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">area sa2ul
sha256_generic libsha256 authenc drm tps6598x drm_panel_orientation_quirks
typec ipv6</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823511] CPU: 1 PID: 0 Comm: swapper/1
Tainted: G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.1.12-00113-g78816b00ff46-dirty #10</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823521] Hardware name: Texas Instruments
AM625 SK (DT)</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823526] pstate: 200000c5 (nzCv daIF -PAN
-UAO -TCO -DIT -SSBS BTYPE=3D--)</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823535] pc : 0xffff80000b404000</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823548] lr : enter_hypervisor+0x44/0xa8
[jailhouse]</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823573] sp : ffff80000800bf10</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823576] x29: ffff80000800bf10 x28:
ffff00000018c600 x27: 0000000000000000</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823587] x26: ffff00000018c600 x25:
0000000000000000 x24: 0000000000000000</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823598] x23: 0000000000000000 x22:
0000000000000000 x21: 0000000000000000</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823609] x20: 0000000000000000 x19:
ffff800000d76000 x18: 0000000000000002</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823619] x17: ffff80005664e000 x16:
ffff80000800c000 x15: 0000000000004000</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823630] x14: 000000000000001d x13:
0000000000000000 x12: 0000000000000001</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823641] x11: 0000000000000040 x10:
ffff000000006170 x9 : ffff000000006168</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823651] x8 : ffff0000004004b8 x7 :
0000000000000000 x6 : 0000000000000000</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823661] x5 : ffff80005664e000 x4 :
0000000000000000 x3 : 0000000000000001</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823672] x2 : ffff80000b400000 x1 :
ffff80000b404000 x0 : 0000000000000001</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823683] Call trace:</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823687]=C2=A0
0xffff80000b404000</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823693]=C2=A0
__flush_smp_call_function_queue+0xd4/0x260</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823710]=C2=A0
generic_smp_call_function_single_interrupt+0x14/0x20</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823719]=C2=A0
ipi_handler+0xac/0x150</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823730]=C2=A0
handle_percpu_devid_irq+0x84/0x138</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823742]=C2=A0
generic_handle_domain_irq+0x2c/0x48</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823750]=C2=A0
gic_handle_irq+0x50/0x130</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823761]=C2=A0
call_on_irq_stack+0x2c/0x54</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823771]=C2=A0
do_interrupt_handler+0x80/0x88</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823780]=C2=A0
el1_interrupt+0x38/0x70</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823789]=C2=A0
el1h_64_irq_handler+0x18/0x28</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823796]=C2=A0
el1h_64_irq+0x64/0x68</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823802]=C2=A0
arch_cpu_idle+0x18/0x28</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823810]=C2=A0
default_idle_call+0x24/0x6c</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823819]=C2=A0
do_idle+0x200/0x248</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823826]=C2=A0
cpu_startup_entry+0x24/0x30</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823832]=C2=A0
secondary_start_kernel+0x124/0x148</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823841]=C2=A0
__secondary_switched+0xb0/0xb4</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823856] Code: 00000000 00000000 00000000
00000000 (aa0003f0)</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823863] ---[ end trace 0000000000000000
]---</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823868] Kernel panic - not syncing: Oops:
Fatal exception in interrupt</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.823873] SMP: stopping secondary CPUs</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.833005] Mem abort info:</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.833007]=C2=A0=C2=A0
ESR =3D 0x000000008600000e</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.833011]=C2=A0=C2=A0
EC =3D 0x21: IABT (current EL), IL =3D 32 bits</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.833015]=C2=A0=C2=A0
SET =3D 0, FnV =3D 0</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.833018]=C2=A0=C2=A0
EA =3D 0, S1PTW =3D 0</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.833020]=C2=A0=C2=A0
FSC =3D 0x0e: level 2 permission fault</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.833024] swapper pgtable: 4k pages, 48-bit
VAs, pgdp=3D0000000082f89000</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.833028] [ffff80000b404000]
pgd=3D10000000df9ff003, p4d=3D10000000df9ff003, pud=3D10000000df9fe003,
pmd=3D00680000dfc00701</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.842633]=C2=A0=C2=A0
SET =3D 0, FnV =3D 0</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.852263]=C2=A0=C2=A0
EA =3D 0, S1PTW =3D 0</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.861893]=C2=A0=C2=A0
FSC =3D 0x0e: level 2 permission fault</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.864676] swapper pgtable: 4k pages, 48-bit
VAs, pgdp=3D0000000082f89000</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
6.867461] [ffff80000b404000]
pgd=3D10000000df9ff003, p4d=3D10000000df9ff003, pud=3D10000000df9fe003,
pmd=3D00680000dfc00701</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
7.899406] SMP: failed to stop secondary
CPUs 0-3</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
8.291494] Kernel Offset: disabled</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
8.294970] CPU features:
0x00000,00800084,0000420b</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
8.299835] Memory Limit: none</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">=C2=A0</p>

<p style=3D"margin: 0in; font-family: Calibri; font-size: 11pt;">[=C2=A0 13=
8.302882] ---[ end Kernel panic - not
syncing: Oops: Fatal exception in interrupt ]---</p><p style=3D"margin: 0in=
; font-family: Calibri; font-size: 11pt;"><br /></p><p style=3D"margin: 0in=
; font-family: Calibri; font-size: 11pt;">Thanks</p></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a89ac0da-35eb-420a-bb5a-0d4edd0ce2ebn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a89ac0da-35eb-420a-bb5a-0d4edd0ce2ebn%40googlegroups.co=
m</a>.<br />

------=_Part_2117_122312652.1681897859861--

------=_Part_2116_1442206217.1681897859861--
