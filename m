Return-Path: <jailhouse-dev+bncBCL6VUP7RYARBI6MTPTAKGQEG2YZRFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 023B5E1A4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 13:55:17 +0200 (CEST)
Received: by mail-ot1-x33e.google.com with SMTP id d11sf2140127otp.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 04:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=T7kM/FjyblmdHhyHo07rdbwmDfsgG7G/cTkHU1ZT1wA=;
        b=QV0Ij4cDIsdq3gBNxZ3hLWGqJC88yQ2jNB72gtoXFCtWEThMoj85/GX/2/6BEwLM/x
         lrQ7d6d8ZubSa8XturL6mqsr2YxKmBZSbXddw89L21M6l35F3le3YDKg9r7PvcjdaVab
         3oFF31jjBrpdo2n6Ve/URk5UYk43Hlcm74P1id1vUVp4YHiU3Lv6cfJNp1pq3Qs/tPMK
         pW/gQUeOk4pBDMQk/niaK8YR5L3z0cDoB/aPeelOwhCF9Qm4cnx4oPPOj0oMZzDwd8ix
         5OeAFMC9mI9rcHjwyYAdzRyXAs7rKvVkVeMIAM27rxr62bw8ZKCM7I784VJs+Vf4SwfC
         yNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=T7kM/FjyblmdHhyHo07rdbwmDfsgG7G/cTkHU1ZT1wA=;
        b=qqn9/AslkrTg96yA8jpT88llsbacUSfUwGH6RNjFu6pTU8VZsSh8LVxK9l3IPh4xfi
         Eig2e0lqVQh3roEe70A1F7C7KZ0BNJCAZejUzt8L6P4ZT43vrp5xSnVO7lOBpn4LZp69
         hUs32JCuhKHtmtd6k8ewHl41iNUyx5C6M9KgWubAf4rmVv+cMQEBhTcqvgqte/Eel67c
         ash75cbaRiwRMBYuRcDuccsQoX909U29bkBXjp8k403UWIG66BcHEUwlMgJ+sbCtWhpI
         YJZRtPtV7+TslTzLHogvDvnqEvD/i/NamChzR4V4bMRTEt05UNUgRrvfI5pa7RZD3f18
         aS6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXimrWlBugnfqjJOhx8383AbDLASGqhvLqWBa+qmnZsYU+C0DLZ
	XaQIyg8rkws8M+Fc7/IZPpQ=
X-Google-Smtp-Source: APXvYqzcvst0wE1vMhjmoXIit6U1bQNKb8Z4L9f+ztcGFEgnkfRkVi+c/GIaHrnfxb+CdeTQTtmegg==
X-Received: by 2002:a9d:61c6:: with SMTP id h6mr888471otk.316.1556538915899;
        Mon, 29 Apr 2019 04:55:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:64d3:: with SMTP id n19ls1934774otl.15.gmail; Mon, 29
 Apr 2019 04:55:15 -0700 (PDT)
X-Received: by 2002:a9d:37ca:: with SMTP id x68mr11292086otb.347.1556538915074;
        Mon, 29 Apr 2019 04:55:15 -0700 (PDT)
Date: Mon, 29 Apr 2019 04:55:14 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3cb885a7-8b66-42b4-adf2-6fc98375efa9@googlegroups.com>
In-Reply-To: <8ef112a9-2f0f-9205-3e67-f0c6fed498ba@siemens.com>
References: <16e3b6ef-37e1-4734-aba4-247bcbbc18e0@googlegroups.com>
 <6526d7d9-09fb-c25e-0037-628998267794@siemens.com>
 <81bb9c90-1557-47ae-990d-b1bf417a58b9@googlegroups.com>
 <63f974a9-5944-4f1f-77a2-4bd7393ff8a6@siemens.com>
 <05d90171-db1f-4031-a7b2-48570eb37847@googlegroups.com>
 <fdfcd6e7-e2a5-4187-b079-ca643fb281a1@googlegroups.com>
 <32bc2861-e11e-4ab0-bdcf-063e2c05318d@googlegroups.com>
 <f704088f-99c1-4ec0-bd5e-90e15874cc7d@googlegroups.com>
 <3e5ad4e4-abac-03f5-5402-661e62a83944@siemens.com>
 <7f55a310-7bb7-4a3f-b111-0c2a24939b7c@googlegroups.com>
 <1f880925-0420-7c15-1aa4-07d001a6efce@siemens.com>
 <bcd32c87-28e7-4747-b3ab-ebaedf160309@googlegroups.com>
 <32d0b346-10e4-de18-1d24-95e4e4cff977@web.de>
 <9732f874-1271-4296-b2ef-ededba614a87@googlegroups.com>
 <7deff203-cf29-6353-128a-8b40f8d42584@web.de>
 <cbeb1b02-5799-472c-bb5c-f6eb62a60305@googlegroups.com>
 <8ef112a9-2f0f-9205-3e67-f0c6fed498ba@siemens.com>
Subject: Re: JAILHOUSE hangs with exception when trying to enable the root
 cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_345_863169114.1556538914462"
X-Original-Sender: hkurumahmut84@hotmail.com
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

------=_Part_345_863169114.1556538914462
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


> > I debug Dell R710 Server new errors. I tradce  vtd.c file line 1063=20
> >=20
> > It is reading "Global Status Register".=20
> >=20
> > Read value 0x84000000=20
> >=20
> > 31 bit : DMA remapping is enabled=20
> > 26 bit : queued invalidation is enabled=20
> >=20
> > "queued invalidation is enabled" root cause of the problem.=20
> >=20
> > Do you have any suggestion? It is not supported by Jailhouse?=20
> >=20
> >=20
> > As noted in the other reply: Turn DMA remapping off (intel_iommu=3Doff)=
, but you may leave interrupt remapping on because that enables faster x2AP=
IC mode.

> >Note that, as documented, intel_iommu needs to be on during config gener=
ation, but it must be off (except for optional interrupt remapping) when Ja=
ilhouse is enabled.=20

R710 server problem is solved by this method. I have not find any document,=
 please can you share a link. Thanks.

Some regions of config creator have changed at every restart, so this metho=
d needs some manuel correction at result config file.


29 Nisan 2019 Pazartesi 11:44:35 UTC+3 tarihinde Jan Kiszka yazd=C4=B1:
> On 28.04.19 21:45, Hakk=C4=B1 Kurumahmut wrote:
> > 28 Nisan 2019 Pazar 17:31:20 UTC+3 tarihinde Jan Kiszka yazd=C4=B1:
> >> On 28.04.19 13:18, Hakk=C4=B1 Kurumahmut wrote:
> >>> 28 Nisan 2019 Pazar 11:22:30 UTC+3 tarihinde Jan Kiszka wrote:
> >>>
> >>> Hi Jan,
> >>>
> >>>> I looked into that code again and noticed a long-pending bug here, a=
nd also in the MSI hand-over logic. The effect was that actually no event w=
as generated at all when interrupt remapping (and x2APIC) was in use in the=
 root cell. Your commenting out of the code above probably just made the lo=
ss of the event (and, thus, the keystroke) less likely, but the proper fix =
is to do the injection.
> >>>>
> >>>> There are a number of commits in the next branch now that should fix=
 the issue without the need for commenting out code. Please test.
> >>>
> >>>
> >>> I test your last commit with 2 laptop at next branch. (commit d235bde=
2a4738b4cddb1df926a39b8a1e11c0acc)
> >>>
> >>> I was only changed all pio bitmap values to zero.
> >>>
> >>> On "HP EliteBook 8460p Notebook", works very well. ENTER keyboard str=
ike was disappered. Root Cell CPUs were not crashed.
> >>>
> >>> On "HP EliteBook 8470p Notebook", ENTER key strike was disappeared to=
o. But it is generating some crashes. I think they are not related your las=
t patch.
> >>>
> >>> I have installed Fedora 29 Workstation with "4.18.16-300.fc29.x86_64"=
 kernel at "HP EliteBook 8470p Notebook"
> >>>
> >>>
> >>> But I have received below exceptions. Do you have any advice?
> >>>
> >>> I have attached sysconfig.c, data collection archive, dmesg output an=
d lspci outputs for "HP EliteBook 8470p Notebook".
> >>>
> >>>
> >>> Activating hypervisor
> >>> VT-d fault event reported by IOMMU 1:
> >>>    Source Identifier (bus:dev.func): 24:00.0
> >>>    Fault Reason: 0x25 Fault Info: ee00000000000 Type 0
> >>
> >> Does this one still appear, even if you enable the device only after j=
ailhouse is running?
> >=20
> > I jave disabled wifi (airplane mode) this error was disappered. I have =
test disable and enable Root Cell continuously, but new problems are seen a=
s SATA based "Invalid MMIO/RAM read" errors. I will study this problem with=
 taking into account your below advices.
>=20
> Do the problem reappears if your re-enable wifi *while Jailhouse is runni=
ng*?


When wifi re-enabled while jailhouse Root Cell is running, I have not seen =
VT-d errors but sometimes I have seen linux hangs again. I thinks it is abo=
ut MMIO problems. I will discover it.=20


> >=20
> >>>
> >>> FATAL: Invalid MMIO/RAM read, addr: 0x00000000b9c34010 size: 4
> >>
> >> proc/iomem reports this as "reserved" but it is still used, likely for=
 BIOS
> >> topics. Expand the region at b9c7f000 to include RAM down to b88ff000 =
as well.
> >=20
> > I will test this situation. What is the parsing rules of /proc/iomem?
>=20
> "reserved" regions are currently excluded from the generated config. That=
 tend=20
> to cause problems, so there was already the proposal to add a switch to t=
he=20
> generator to include them. Currently, you need to do that manually, on re=
ported=20
> access violations.
>=20
> >=20
> > I have a Dell R710 Server. It is need intel_iommu=3Don because DMAR reg=
ion does not seeen /proc/iomem. I have enabled it with kernel command so DM=
AR region is seen under reserved region but parser ignore this line. I debu=
g parse_iomem_file() python function, I seen that parse_iomem_tree() functi=
on ignoring other than HPET.
> >=20
> >        if (s.lower() =3D=3D 'reserved'):
> >           regions.extend(IOMemRegionTree.find_hpet_regions(tree))
> >=20
> >=20
> > I have attached below code to find_hpet_regions()
> >=20
> >       if (s.find('dmar') >=3D 0):
> >          regions.append(r)
> >=20
> > Is my approach correct? Because I have received additional errors :)
>=20
> Sorry, can you describe again what you did when?
>=20
> Note that, as documented, intel_iommu needs to be on during config genera=
tion,=20
> but it must be off (except for optional interrupt remapping) when Jailhou=
se is=20
> enabled.

Patch is attached below: (for jailhouse master branch)


git diff
diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 46c95fc2..6d36f4fb 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -860,21 +860,24 @@ class IOMemRegionTree:

         return root

-    # find HPET regions in tree
+    # find HPET and DMAR regions in tree
     @staticmethod
-    def find_hpet_regions(tree):
+    def find_hpet_and_dmar_regions(tree):
         regions =3D []

         for tree in tree.children:
             r =3D tree.region
             s =3D r.typestr

+            if (s.find('HPET') >=3D 0):
+                regions.append(r)
+
             if (s.find('HPET') >=3D 0):
                 regions.append(r)

             # if the tree continues recurse further down ...
             if (len(tree.children) > 0):
-                regions.extend(IOMemRegionTree.find_hpet_regions(tree))
+                regions.extend(IOMemRegionTree.find_hpet_and_dmar_regions(=
tree))

         return regions

@@ -903,7 +906,7 @@ class IOMemRegionTree:

             # generally blacklisted, unless we find an HPET behind it
             if (s.lower() =3D=3D 'reserved'):
-                regions.extend(IOMemRegionTree.find_hpet_regions(tree))
+                regions.extend(IOMemRegionTree.find_hpet_and_dmar_regions(=
tree))
                 continue




Example /proc/iomem for HP8300

You can see that dmar0 under Reserved region...

ubuntu@ubuntu-HP8300:~$ sudo cat /proc/iomem
[sudo] password for ubuntu:
00000000-00000fff : Reserved
00001000-0009ffff : System RAM
000a0000-000bffff : PCI Bus 0000:00
000c0000-000ce9ff : Video ROM
000cf000-000cffff : Adapter ROM
000d0000-000d3fff : PCI Bus 0000:00
000d4000-000d7fff : PCI Bus 0000:00
000d8000-000dbfff : PCI Bus 0000:00
000dc000-000dffff : PCI Bus 0000:00
000f0000-000fffff : System ROM
00100000-38ffffff : System RAM
39000000-78ffffff : Reserved
79000000-de35bfff : System RAM
de35c000-de365fff : Unknown E820 type
de366000-de3e6fff : Reserved
de3e7000-de414fff : Unknown E820 type
de415000-de93efff : Reserved
de93f000-deba4fff : ACPI Non-volatile Storage
deba5000-debb5fff : ACPI Tables
debb6000-debbefff : ACPI Non-volatile Storage
debbf000-debc3fff : ACPI Tables
debc4000-dec06fff : ACPI Non-volatile Storage
dec07000-deffffff : System RAM
df000000-dfffffff : RAM buffer
e0000000-feafffff : PCI Bus 0000:00
  e0000000-efffffff : PCI Bus 0000:01
    e0000000-efffffff : 0000:01:00.0
  f0000000-f0000fff : pnp 00:0a
  f7e00000-f7efffff : PCI Bus 0000:01
    f7e20000-f7e3ffff : 0000:01:00.0
  f7f00000-f7f1ffff : 0000:00:19.0
    f7f00000-f7f1ffff : e1000e
  f7f20000-f7f2ffff : 0000:00:14.0
    f7f20000-f7f2ffff : xhci-hcd
  f7f30000-f7f33fff : 0000:00:1b.0
    f7f30000-f7f33fff : ICH HD audio
  f7f35000-f7f350ff : 0000:00:1f.3
  f7f36000-f7f367ff : 0000:00:1f.2
    f7f36000-f7f367ff : ahci
  f7f37000-f7f373ff : 0000:00:1d.0
    f7f37000-f7f373ff : ehci_hcd
  f7f38000-f7f383ff : 0000:00:1a.0
    f7f38000-f7f383ff : ehci_hcd
  f7f39000-f7f39fff : 0000:00:19.0
    f7f39000-f7f39fff : e1000e
  f7f3a000-f7f3afff : 0000:00:16.3
  f7f3c000-f7f3c00f : 0000:00:16.0
    f7f3c000-f7f3c00f : mei_me
  f8000000-fbffffff : PCI MMCONFIG 0000 [bus 00-3f]
    f8000000-fbffffff : Reserved
      f8000000-fbffffff : pnp 00:0a
fec00000-fec00fff : Reserved
  fec00000-fec003ff : IOAPIC 0
fed00000-fed03fff : Reserved
  fed00000-fed003ff : HPET 0
    fed00000-fed003ff : PNP0103:00
fed10000-fed17fff : pnp 00:0a
fed18000-fed18fff : pnp 00:0a
fed19000-fed19fff : pnp 00:0a
fed1c000-fed44fff : Reserved
  fed1c000-fed1ffff : pnp 00:0a
    fed1f410-fed1f414 : iTCO_wdt.0.auto
  fed20000-fed3ffff : pnp 00:0a
  fed40000-fed44fff : pnp 00:00
    fed40000-fed44fff : TPM
fed45000-fed8ffff : pnp 00:0a
fed90000-fed93fff : Reserved
  fed90000-fed90fff : dmar0
fee00000-fee00fff : Local APIC
  fee00000-fee00fff : Reserved
ff000000-ffffffff : Reserved
  ff000000-ffffffff : INT0800:00
    ff000000-ffffffff : pnp 00:0a
100000000-21dffffff : System RAM
  1fe800000-1ff4031d0 : Kernel code
  1ff4031d1-1ffe928ff : Kernel data
  200119000-200361fff : Kernel bss
21e000000-21fffffff : RAM buffer
ubuntu@ubuntu-HP8300:~$

If this patch is not apply, below exception is throw by "config creation" w=
hether intel_iommu On or Off because "reserved" regions are currently exclu=
ded from the generated config. HPET and DMAR under reserved section must be=
 parsed by config creation parser at find_hpet_and_dmar_regions() functions=
.


> >>> RIP: 0xffffffffbc04eb25 RSP: 0xffffbb66c0e17ab0 FLAGS: 10046
> >>> RAX: 0xffffbb66c0002000 RBX: 0xffff998a76d52000 RCX: 0x00000000000000=
01
> >>> RDX: 0x0000000000000001 RSI: 0x0000000000000202 RDI: 0xffffbb66c00020=
10
> >>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
> >>> CR0: 0x0000000080050033 CR3: 0x00000001df20a004 CR4: 0x00000000001626=
f0
> >>> EFER: 0x0000000000000d01
> >>> Parking CPU 0 (Cell: "RootCell")
> >>>
> >>> FATAL: unsupported instruction (0xf3 0x00 0x00 0x00)
> >>> FATAL: Invalid MMIO/RAM read, addr: 0x00000000b9c3f000 size: 0
> >>
> >> The above will address this, too.
> >=20
> > OK. I will study.
> >=20
> >>> RIP: 0xffffffffbc901226 RSP: 0xffffbb66c1d1fe08 FLAGS: 10286
> >>> RAX: 0xffff998a47ac5800 RBX: 0x000000000000060d RCX: 0x00000000000006=
0d
> >>> RDX: 0x000000000000060d RSI: 0xffffbb66c0d11000 RDI: 0xffff998a47ac58=
00
> >>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
> >>> CR0: 0x0000000080050033 CR3: 0x0000000218966001 CR4: 0x00000000001626=
e0
> >>> EFER: 0x0000000000000d01
> >>> Parking CPU 2 (Cell: "RootCell")
> >>>
> >=20
> >=20
> > Thanks.
> >=20
> > HAKKI
> >=20
>=20
> Jan
>=20
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux

Thanks.

HAKKI

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_345_863169114.1556538914462--
