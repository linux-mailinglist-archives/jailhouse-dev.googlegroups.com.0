Return-Path: <jailhouse-dev+bncBCL6VUP7RYARB752XPTAKGQEF2P2GNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BD413F7C
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 14:56:33 +0200 (CEST)
Received: by mail-ot1-x337.google.com with SMTP id i21sf5809815otf.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jX73ArIrzS8x9xmrvy8QL1n2Wwq8nvDOIxGC1lnAnSw=;
        b=KWSFrwuP5SF3fv2OR6ovrsQNNr3US76j8k3umQ1EcgueVqZWOmu0NNeRwIXk7O63ob
         tiDibV1Q/9lnod5vyx/N/atAp8EM1eehXPlY44TeEGAJtD46hlIbHmy5tIyh1a4KJmy9
         9Bo3h7blqoNNxUUsF28JZuZI/8FuLSzJ7MBNp84WQkNmzgYLHLfWSrzqlZL8in3prEmg
         xkIi7PTZ3yB9tEpAXZdbQLo7udSieiCSxJFlD2msEKXDaOVG+pYi7vji7TEWmNARNi4O
         Vdd3ablkeWj8J9wxbAML5wLASEkTqTUo6Lg5Z5obs5hoG29cGB/g6Rh//DTzm5oBRjD3
         VC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jX73ArIrzS8x9xmrvy8QL1n2Wwq8nvDOIxGC1lnAnSw=;
        b=Y3MRejE2CCnB+XhSPDoT21XtuqCxj+/ECn1BwVn07vX1fLvWQ2KkfBdICQqsDnGMJx
         uaPdx8D+UnHnEsyTCFf2e0xfuI2l1QD3aq1IP+bAJn1NoKCrQF/hin+ui9OpSNL4WMTf
         0Sn2N6VW0Qhm7GojJZi+IyDkpcq2B3JGEDZwpnQ1o5f7vOBj78nJZmHKIzr4BfpFgWhL
         kwN2ztEA6n2wZQOQfj0JMAxGtsXWMjBvVsqhFht+u6KPj1YVadsLOiRkZnIaRD43Guyj
         ZJ0YMdp+c4p5PeojEnBpixrLhrmCoMY9oFewth8hOX/aBZxY/1d4QJ3g3H9qd47Si8nw
         Cl+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUi0JdnXcaJRjbcvb+/bT3zGn8m+BczsAObST+DWHN2ovjcOWAk
	MbMfTHBFT6OIqbw9qE2eIV0=
X-Google-Smtp-Source: APXvYqx5TljbGjig0jINK/jiJBbN3OZILKh+LRMaBEQK0W7lSuPEvfy2df5TFww9/1fGFFT5CUgqqA==
X-Received: by 2002:a05:6830:210d:: with SMTP id i13mr13143933otc.331.1557060991572;
        Sun, 05 May 2019 05:56:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:ee3:: with SMTP id 90ls1669726otj.8.gmail; Sun, 05 May
 2019 05:56:31 -0700 (PDT)
X-Received: by 2002:a9d:550e:: with SMTP id l14mr9020175oth.369.1557060990779;
        Sun, 05 May 2019 05:56:30 -0700 (PDT)
Date: Sun, 5 May 2019 05:56:30 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c5cfbbaa-9df7-4b63-a584-3fa5e9603780@googlegroups.com>
In-Reply-To: <be558db9-b112-5891-119c-0290c33ef7f0@web.de>
References: <16e3b6ef-37e1-4734-aba4-247bcbbc18e0@googlegroups.com>
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
 <3cb885a7-8b66-42b4-adf2-6fc98375efa9@googlegroups.com>
 <26834bed-4a78-4bac-b093-d8f9e2646e72@googlegroups.com>
 <6ca6fe6a-27b7-4110-884f-e3c5be79134c@googlegroups.com>
 <f09baf4b-72c1-d6d8-56af-966b1afbb88a@web.de>
 <be558db9-b112-5891-119c-0290c33ef7f0@web.de>
Subject: Re: JAILHOUSE hangs with exception when trying to enable the root
 cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4_1028592830.1557060990201"
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

------=_Part_4_1028592830.1557060990201
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

5 May=C4=B1s 2019 Pazar 15:18:16 UTC+3 tarihinde Jan Kiszka yazd=C4=B1:
> On 05.05.19 10:10, Jan Kiszka wrote:
> > On 02.05.19 17:06, Hakk=C4=B1 Kurumahmut wrote:
> >> Hi again,
> >>
> >> Is my last patch in my previous message correct, I am asking for my cu=
riosity :)
> >
> > I still think it's papering over some other issue, but I need to regene=
rate the
> > config from your data.
>=20
> Checked the configs that are generated from
> HP_EliteBook_8460p_2019_04_29__18_59_data_collection.tar and
> HP_EliteBook_8460p_2019_04_29__19_00_data_collection.tar: They seem to de=
tect
> the DMAR unit base addresses correctly, and they also do not map them int=
o the
> guest - all fine. So, there is no need need for your patch. In fact, as I=
 stated
> before, it would create a bug as it would map the DMAR unit directly into=
 the
> guest which breaks isolation and more.
>=20
> If you still see access violations on DMAR addresses then this may have o=
ne of
> the following reasons:
>=20
>   - you forgot to disable the intel_iommu before enabling Jailhouse
>=20
>   - your Linux kernel uses an instruction for accessing the DMAR
>     interrupt remapping registers (which Jailhouse can emulate) that we
>     do not support yet
>=20
> Please post the complete access violation report if the issue persists.
>=20
>=20
> Regarding the different configs generate due to different kernel RAM addr=
esses:
> That is a harmless effect. The RAM regions, in their sum, will still map =
the
> same memory. We could avoid that effect by detecting and coalescing neigh=
boring
> regions with identical parameters.
>=20
> Jan


Hi Jan,

I have reported two different issues. One of them is about HP8460p machine,=
 the other is about HP8300.


---------------------------------------------------
---------------------------------------------------
---------------------------------------------------
One of them is about kernel code, data, bss section location that is locate=
d different areas when PC was restarted. I sent you below message for it. T=
herefore, the config file must be manually edited at every restart.


HP_EliteBook_8460p_2019_04_29__18_59_data_collection.tar=20
HP_EliteBook_8460p_2019_04_29__19_00_data_collection.tar

I attached sequential restart --> jailhouse rebuild --> config create resul=
ts for HP8460p.=20


Difference for Kernel code, data and bss sections.=20

First restart of PC (HP_EliteBook_8460p_2019_04_29__18_59_data_collection.t=
ar)
100000000-23dffffff : System RAM=20
  146000000-146c031d0 : Kernel code=20
  146c031d1-1476928ff : Kernel data=20
  147919000-147b61fff : Kernel bss=20

Second restart of PC (HP_EliteBook_8460p_2019_04_29__19_00_data_collection.=
tar)
7a000000-bbd90fff : System RAM=20
  adc00000-ae8031d0 : Kernel code=20
  ae8031d1-af2928ff : Kernel data=20
  af519000-af761fff : Kernel bss=20

Consequently, result config file is affected this changes. I think conseque=
ntly restart for IOMMU ON and OFF causes new problems. Maybe I'm misinterpr=
eting.=20
---------------------------------------------------
---------------------------------------------------
---------------------------------------------------






The other problem is about DMAR regions under reserved region. Config parse=
r needs a patch. I've added the details below:=20


Hi Jan,

While kernel command parameters are intel_iommu=3Don intremap=3Don at R710 =
and HP8300 machine, proc/iomem shows DMAR region under Reserved area. This =
patch or something else must be done for config creation to complete becaus=
e of generating DMAR region not found error although it exist.

I have write a patch that is attached below: (for jailhouse master branch)

It is not touch to tree only update dmar_regions variable.


git diff
diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 46c95fc2..70fe8869 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -94,14 +94,13 @@ def input_listdir(dir, wildcards):
=20
=20
 def parse_iomem(pcidevices):
-    regions =3D IOMemRegionTree.parse_iomem_tree(
-        IOMemRegionTree.parse_iomem_file())
+    dmar_regions =3D []
+    regions =3D IOMemRegionTree.parse_iomem_tree(IOMemRegionTree.parse_iom=
em_file(), dmar_regions)
=20
     rom_region =3D MemRegion(0xc0000, 0xdffff, 'ROMs')
     add_rom_region =3D False
=20
     ret =3D []
-    dmar_regions =3D []
     for r in regions:
         append_r =3D True
         # filter the list for MSI-X pages
@@ -878,9 +877,27 @@ class IOMemRegionTree:
=20
         return regions
=20
+    # find DMAR regions in tree
+    @staticmethod
+    def find_dmar_regions(tree):
+        regions =3D []
+
+        for tree in tree.children:
+            r =3D tree.region
+            s =3D r.typestr
+
+            if (s.find('dmar') >=3D 0):
+                regions.append(r)
+
+            # if the tree continues recurse further down ...
+            if (len(tree.children) > 0):
+                regions.extend(IOMemRegionTree.find_dmar_regions(tree))
+
+        return regions
+
     # recurse down the tree
     @staticmethod
-    def parse_iomem_tree(tree):
+    def parse_iomem_tree(tree, dmar_regions):

         regions =3D []
=20
         for tree in tree.children:
@@ -904,11 +921,12 @@ class IOMemRegionTree:

             # generally blacklisted, unless we find an HPET behind it
             if (s.lower() =3D=3D 'reserved'):
                 regions.extend(IOMemRegionTree.find_hpet_regions(tree))
+                dmar_regions.extend(IOMemRegionTree.find_dmar_regions(tree=
))
                 continue

=20
             # if the tree continues recurse further down ...
             if (len(tree.children) > 0):
-                regions.extend(IOMemRegionTree.parse_iomem_tree(tree))
+                regions.extend(IOMemRegionTree.parse_iomem_tree(tree, dmar=
_regions))
                 continue
=20
             # add all remaining leaves


Example /proc/iomem for HP8300=20

"intel_iommu=3Don intremap=3Don"=20

You can see that dmar0 under Reserved region for HP8300 machine...=20

ubuntu@ubuntu-HP8300:~$ sudo cat /proc/iomem=20
00000000-00000fff : Reserved=20
00001000-0009ffff : System RAM=20
000a0000-000bffff : PCI Bus 0000:00=20
000c0000-000ce9ff : Video ROM=20
000cf000-000cffff : Adapter ROM=20
000d0000-000d3fff : PCI Bus 0000:00=20
000d4000-000d7fff : PCI Bus 0000:00=20
000d8000-000dbfff : PCI Bus 0000:00=20
000dc000-000dffff : PCI Bus 0000:00=20
000f0000-000fffff : System ROM=20
00100000-38ffffff : System RAM=20
39000000-78ffffff : Reserved=20
79000000-de35bfff : System RAM=20
de35c000-de365fff : Unknown E820 type=20
de366000-de3e6fff : Reserved=20
de3e7000-de414fff : Unknown E820 type=20
de415000-de93efff : Reserved=20
de93f000-deba4fff : ACPI Non-volatile Storage=20
deba5000-debb5fff : ACPI Tables=20
debb6000-debbefff : ACPI Non-volatile Storage=20
debbf000-debc3fff : ACPI Tables=20
debc4000-dec06fff : ACPI Non-volatile Storage=20
dec07000-deffffff : System RAM=20
df000000-dfffffff : RAM buffer=20
e0000000-feafffff : PCI Bus 0000:00=20
  e0000000-efffffff : PCI Bus 0000:01=20
    e0000000-efffffff : 0000:01:00.0=20
  f0000000-f0000fff : pnp 00:0a=20
  f7e00000-f7efffff : PCI Bus 0000:01=20
    f7e20000-f7e3ffff : 0000:01:00.0=20
  f7f00000-f7f1ffff : 0000:00:19.0=20
    f7f00000-f7f1ffff : e1000e=20
  f7f20000-f7f2ffff : 0000:00:14.0=20
    f7f20000-f7f2ffff : xhci-hcd=20
  f7f30000-f7f33fff : 0000:00:1b.0=20
    f7f30000-f7f33fff : ICH HD audio=20
  f7f35000-f7f350ff : 0000:00:1f.3=20
  f7f36000-f7f367ff : 0000:00:1f.2=20
    f7f36000-f7f367ff : ahci=20
  f7f37000-f7f373ff : 0000:00:1d.0=20
    f7f37000-f7f373ff : ehci_hcd=20
  f7f38000-f7f383ff : 0000:00:1a.0=20
    f7f38000-f7f383ff : ehci_hcd=20
  f7f39000-f7f39fff : 0000:00:19.0=20
    f7f39000-f7f39fff : e1000e=20
  f7f3a000-f7f3afff : 0000:00:16.3=20
  f7f3c000-f7f3c00f : 0000:00:16.0=20
    f7f3c000-f7f3c00f : mei_me=20
  f8000000-fbffffff : PCI MMCONFIG 0000 [bus 00-3f]=20
    f8000000-fbffffff : Reserved=20
      f8000000-fbffffff : pnp 00:0a=20
fec00000-fec00fff : Reserved=20
  fec00000-fec003ff : IOAPIC 0=20
fed00000-fed03fff : Reserved=20
  fed00000-fed003ff : HPET 0=20
    fed00000-fed003ff : PNP0103:00=20
fed10000-fed17fff : pnp 00:0a=20
fed18000-fed18fff : pnp 00:0a=20
fed19000-fed19fff : pnp 00:0a=20
fed1c000-fed44fff : Reserved=20
  fed1c000-fed1ffff : pnp 00:0a=20
    fed1f410-fed1f414 : iTCO_wdt.0.auto=20
  fed20000-fed3ffff : pnp 00:0a=20
  fed40000-fed44fff : pnp 00:00=20
    fed40000-fed44fff : TPM=20
fed45000-fed8ffff : pnp 00:0a=20
fed90000-fed93fff : Reserved=20
  fed90000-fed90fff : dmar0 			*****DMAR is under reserved region, current =
parser ignores******
fee00000-fee00fff : Local APIC=20
  fee00000-fee00fff : Reserved=20
ff000000-ffffffff : Reserved=20
  ff000000-ffffffff : INT0800:00=20
    ff000000-ffffffff : pnp 00:0a=20
100000000-21dffffff : System RAM=20
  1fe800000-1ff4031d0 : Kernel code=20
  1ff4031d1-1ffe928ff : Kernel data=20
  200119000-200361fff : Kernel bss=20
21e000000-21fffffff : RAM buffer=20
ubuntu@ubuntu-HP8300:~$=20

If this patch is not apply, error is throw by "config creation" whether int=
el_iommu On or Off because "reserved" regions are currently excluded from t=
he generated config although DMAR region exists. Thus, HPET and DMAR under =
reserved section must be parsed by config parser.


            if size =3D=3D 0:
                raise RuntimeError('DMAR region size cannot be identified.\=
n'
                                   'Target Linux must run with Intel IOMMU =
'
                                   'enabled.')



I hope I could explain this time.

Thanks.

HAKKI

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_4_1028592830.1557060990201--
