Return-Path: <jailhouse-dev+bncBDCN3RNB2MDRBVNYZ7TAKGQEFXLNLPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23e.google.com (mail-oi1-x23e.google.com [IPv6:2607:f8b0:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACA718663
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 09:52:55 +0200 (CEST)
Received: by mail-oi1-x23e.google.com with SMTP id s64sf528742oia.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 00:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kJwdjaQ4/3nOSc6SvcVyYfRuImdqfND3/DjfI03wKpc=;
        b=QR5Dv8RyvCskh+dKfVbpxQsAWnuPisLZ/fCgJ4TcbVLrQTZ7/bQb8PmI15hdeAnY/a
         3dVVllrlNP7s+h+zzTGqTgq8BLewQH1FE11q/J1PDsrDXSjkhTX5jgwv16PM55fHj+1Y
         IH7VQJKCJ4DJ3KlF5HROrqH/BJWkt6LAoHbCLOJfVLxE+mw4oW38wY+1KQZfMzRnYOsz
         aEXsdBKyiA2j69hV6YkonaVzxsfu7FSfdXrsdQ0xVBLN0F9Q29itQ1njvWHbR+XqDfUt
         stv4F/OdCANg5bW5TtSiFCgEVqIXVlf32BgxBvdsB6KfVijD91lm2t+oRxDtZ0u+wI3n
         tPZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kJwdjaQ4/3nOSc6SvcVyYfRuImdqfND3/DjfI03wKpc=;
        b=vE66SWcyZyVhwgWRxU+2yfZ5LvJ0JWwhseno2Q/4DFmROHEHBLINrjVCQN/0RVJeX+
         uXKqE04zinVI5m1l/dydbKUzNFhEezkjoSGOIZQixzHbjmKev6RYoCLjCNde7Gf6uT/j
         YHhY00MNxu1YP9qj7b2fio2T87ctwfcoziM/FFgPKxhpYXJYfViQ9HipFfB2gX9srqQm
         VxkphgwqZeRgUF/20RsEVScLw3/IYjPJNMy5b0XxOY8++dkkFnYfaDr8E3zUbqO+L7Jh
         +ebS/j7LZoJQCcD2uRIEShwMjhsJsZy6aLls2uxDSPEUFD2Oq+yWUu85SURp6wfy+rcT
         V7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kJwdjaQ4/3nOSc6SvcVyYfRuImdqfND3/DjfI03wKpc=;
        b=NWi+oPlJIFpeYo0o3FJ8pNpDgG0yWmE68kJ1pQazXHFuZUzSEfOMH8mRfNFgR44Z6t
         dNlNendRVUBhKfaXrrKRrMEXEduvQs20/QzIGu7xz84E6mwHJT7Lt6opW12exdi1+ay9
         2ETtc2aCgXSeLgKRLNqKCBMrGlRbnSpL3edvrJICiTd732zTfb6l1KxqMoLUFvuFSw9p
         p6F/qmCudr72cwfvWYEqnZzUBxgwbzXtZ3KZJdSdU0s8/5J8ICp/rWg5lJe7k6qYhTm8
         yco4nxw1JgBmxxOU+TdKGGl2pf5EXHQd7DCXIoKV8kh4suOvczfYsnNS1EAAJ8mUwb/e
         v76Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUzJ90vlH4IgXYp7GtUct11gnwOYubiiNkzctqVD8yRlJkrNnrR
	9ZPBOif/xbWisbS20emaBlU=
X-Google-Smtp-Source: APXvYqwmXvdXhXFCIePuZCgVRYRctcDkrWEO3/oJ59TLAYxyelgz/Pmui6W6Ft2RwV8nMIg8ODR3hA==
X-Received: by 2002:a05:6808:64f:: with SMTP id z15mr604333oih.148.1557388373664;
        Thu, 09 May 2019 00:52:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:748b:: with SMTP id t11ls297810otk.7.gmail; Thu, 09 May
 2019 00:52:52 -0700 (PDT)
X-Received: by 2002:a9d:7346:: with SMTP id l6mr1510777otk.139.1557388372597;
        Thu, 09 May 2019 00:52:52 -0700 (PDT)
Date: Thu, 9 May 2019 00:52:51 -0700 (PDT)
From: jeanne.romefort@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <71f64f49-1bcd-4ab0-947a-0bcabc2ac1e6@googlegroups.com>
In-Reply-To: <cda9daa8-fbe8-46fb-aaba-75ebd38e141e@googlegroups.com>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
 <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
 <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
 <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
 <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
 <c238d436-5995-4c44-8a19-bc26654671d5@googlegroups.com>
 <5c94104f-c27d-9074-1990-61fa9e9d05c1@siemens.com>
 <cda9daa8-fbe8-46fb-aaba-75ebd38e141e@googlegroups.com>
Subject: Re: Unsupported DMAR Device Scope Structure
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_195_834613010.1557388371426"
X-Original-Sender: jeanne.romefort@gmail.com
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

------=_Part_195_834613010.1557388371426
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 7 mai 2019 23:14:41 UTC+2, Hakk=C4=B1 Kurumahmut a =C3=A9crit=C2=
=A0:
> Hi Jan, Jeanne
>=20
> @Jeanne
>=20
> I prepared a solution about the problem. Please apply two patch for jailh=
ouse/next branch. Or download attached file sysfs_parser.py.
>=20
> I also sent sysconfig.c for your platform. When you use the new script, y=
ou will produce a similar file.
>=20
> Please test it.
>=20
> Could you send us below command outputs?
>=20
> sudo lspci -D
> sudo lspci -Dtvvv
> sudo lspci -Dkvvvnnxxx
>=20
>=20
> @Jan
>=20
> I have a question about the patch. assign_iommu_info and append_comment_i=
nfo methods is running for PCI-PCI bridge primary and secondary bus,dev,fn.=
=20
>=20
> I'm not sure it should work for the primary bus,dev,fn.
>=20
> Example Device Scope:
>=20
> 01 0A 00 00 00 00 1C 07 00 00=20
> 01 0A 00 00 00 00 1C 07 00 02=20
> 01 0A 00 00 00 00 1C 07 00 04
>=20
> It is running order
>=20
> 1.) 00:1C.07
> 2.) sec-bus:00.00
> 3.) 00:1C.07
> 4.) sec-bus:00.02=20
> 5.) 00:1C.07
> 6.) sec-bus:00.04=20
>=20
> May be it is run for only secondary buses.
>=20
> 1.) sec-bus:00.00
> 2.) sec-bus:00.02=20
> 3.) sec-bus:00.04=20
>=20
>=20
> -------------------------------------------------------------------------=
--
> [PATCH 1/2]
>=20
> From aa9e7f0e25317d2f516da68b4163f9f08fc6c76d Mon Sep 17 00:00:00 2001
> From: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
> Date: Tue, 7 May 2019 19:37:59 +0300
> Subject: [PATCH 1/2] Scripts: Fix for Parsing DMAR Region under Reserved
>  Section
>=20
>  While kernel command parameters are intel_iommu=3Don  intremap=3Don at
>  some machines, cat /proc/iomem shows DMAR region under reserved section.
>  This patch must be done for config creation to complete because of
>  generating DMAR region not found error although it exist. If this patch =
is
>  not apply, an error is throw by "config create" command whether
>  intel_iommu On or Off because "reserved" regions are currently excluded =
from
>  the generated config although DMAR region exists. Thus, DMAR under reser=
ved
>  section must be parsed by parser.
>=20
> Signed-off-by: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
> ---
>  pyjailhouse/sysfs_parser.py | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>=20
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 46c95fc2..4f5da12e 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -94,14 +94,13 @@ def input_listdir(dir, wildcards):
> =20
> =20
>  def parse_iomem(pcidevices):
> -    regions =3D IOMemRegionTree.parse_iomem_tree(
> +    (regions, dmar_regions) =3D IOMemRegionTree.parse_iomem_tree(
>          IOMemRegionTree.parse_iomem_file())
> =20
>      rom_region =3D MemRegion(0xc0000, 0xdffff, 'ROMs')
>      add_rom_region =3D False
> =20
>      ret =3D []
> -    dmar_regions =3D []
>      for r in regions:
>          append_r =3D True
>          # filter the list for MSI-X pages
> @@ -860,21 +859,21 @@ class IOMemRegionTree:
> =20
>          return root
> =20
> -    # find HPET regions in tree
> +    # find specific regions in tree
>      @staticmethod
> -    def find_hpet_regions(tree):
> +    def find_regions_by_name(tree, string):
>          regions =3D []
> =20
>          for tree in tree.children:
>              r =3D tree.region
>              s =3D r.typestr
> =20
> -            if (s.find('HPET') >=3D 0):
> +            if (s.find(string) >=3D 0):
>                  regions.append(r)
> =20
>              # if the tree continues recurse further down ...
>              if (len(tree.children) > 0):
> -                regions.extend(IOMemRegionTree.find_hpet_regions(tree))
> +                regions.extend(IOMemRegionTree.find_regions_by_name(tree=
, string))
> =20
>          return regions
> =20
> @@ -882,6 +881,7 @@ class IOMemRegionTree:
>      @staticmethod
>      def parse_iomem_tree(tree):
>          regions =3D []
> +        dmar_regions =3D []
> =20
>          for tree in tree.children:
>              r =3D tree.region
> @@ -901,20 +901,23 @@ class IOMemRegionTree:
>              ):
>                  continue
> =20
> -            # generally blacklisted, unless we find an HPET behind it
> +            # generally blacklisted, with a few exceptions
>              if (s.lower() =3D=3D 'reserved'):
> -                regions.extend(IOMemRegionTree.find_hpet_regions(tree))
> +                regions.extend(IOMemRegionTree.find_regions_by_name(tree=
, 'HPET'))
> +                dmar_regions.extend(IOMemRegionTree.find_regions_by_name=
(tree, 'dmar'))
>                  continue
> =20
>              # if the tree continues recurse further down ...
>              if (len(tree.children) > 0):
> -                regions.extend(IOMemRegionTree.parse_iomem_tree(tree))
> +                (temp_regions, temp_dmar_regions) =3D IOMemRegionTree.pa=
rse_iomem_tree(tree)
> +                regions.extend(temp_regions)
> +                dmar_regions.extend(temp_dmar_regions)
>                  continue
> =20
>              # add all remaining leaves
>              regions.append(r)
> =20
> -        return regions
> +        return regions, dmar_regions
> =20
> =20
>  class IOMMUConfig:
> --=20
> 2.17.1
>=20
>=20
> -------------------------------------------------------------------------=
--
> [PATCH 2/2]
>=20
> From d7f925b10f32a37b4595255afe8690abf50a4a3d Mon Sep 17 00:00:00 2001
> From: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
> Date: Tue, 7 May 2019 23:25:14 +0300
> Subject: [PATCH 2/2] Scrits: Fix for Unsupported DMAR Device Scope Struct=
ure
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
>  Currently DMAR parser does not support parsing secondary path info for P=
CI-PCI bridge that is "PCI Endpoint Device" type.
>  For example: 8086:1d1e Patsburg PCI Express Root Port 8
>=20
>  If the =E2=80=98Path=E2=80=99 field length is more than 2 bytes (N > 1),=
 the Device Scope
>  Entry identifies a device behind one or more system software visible PCI=
-
>  PCI bridges. Bus rebalancing actions by system software modifying bus
>  assignments of the device=E2=80=99s parent bridge impacts the bus number=
 portion
>  of device=E2=80=99s requester-id.
>=20
>  Please read VT-d Specification Chapter 8.3.1
>=20
> Signed-off-by: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
> ---
>  pyjailhouse/sysfs_parser.py | 113 ++++++++++++++++++++++--------------
>  1 file changed, 70 insertions(+), 43 deletions(-)
>=20
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 4f5da12e..9e5c08d1 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -194,12 +194,45 @@ def parse_madt():
>      return ioapics
> =20
> =20
> -def parse_dmar_devscope(f):
> -    (scope_type, scope_len, id, bus, dev, fn) =3D \
> -        struct.unpack('<BBxxBBBB', f.read(8))
> -    if scope_len !=3D 8:
> -        raise RuntimeError('Unsupported DMAR Device Scope Structure')
> -    return (scope_type, scope_len, id, bus, dev, fn)
> +def assign_iommu_info(flags, pcidevices, units, ioapics, scope_type, id,=
 bus, dev, fn):
> +    # PCI Endpoint Device
> +    if scope_type =3D=3D 1:
> +        assert not (flags & 1)
> +        for d in pcidevices:
> +            if d.bus =3D=3D bus and d.dev =3D=3D dev and d.fn =3D=3D fn:
> +                d.iommu =3D len(units) - 1
> +                break
> +    # PCI Sub-hierarchy
> +    elif scope_type =3D=3D 2:
> +        assert not (flags & 1)
> +        for d in pcidevices:
> +            if d.bus =3D=3D bus and d.dev =3D=3D dev and d.fn =3D=3D fn:
> +                (secondbus, subordinate) =3D \
> +                    PCIPCIBridge.get_2nd_busses(d)
> +                for d2 in pcidevices:
> +                    if (
> +                        d2.bus >=3D secondbus and
> +                        d2.bus <=3D subordinate
> +                    ):
> +                        d2.iommu =3D len(units) - 1
> +                break
> +    # IOAPIC
> +    elif scope_type =3D=3D 3:
> +        ioapic =3D next(chip for chip in ioapics if chip.id =3D=3D id)
> +        bdf =3D (bus << 8) | (dev << 3) | fn
> +        for chip in ioapics:
> +            if chip.bdf =3D=3D bdf:
> +                raise RuntimeError('IOAPICs with identical BDF')
> +        ioapic.bdf =3D bdf
> +        ioapic.iommu =3D len(units) - 1
> +
> +
> +def append_comment_info(comments, scope_type, bus, dev, fn):
> +    if scope_type =3D=3D 1:
> +        comments.append('PCI device: %02x:%02x.%x' %
> +                        (bus, dev, fn))
> +    else:
> +        comments.append('DMAR parser could not decode device path')
> =20
> =20
>  # parsing of DMAR ACPI Table
> @@ -249,38 +282,22 @@ def parse_dmar(pcidevices, ioapics, dmar_regions):
>                          d.iommu =3D len(units) - 1
>              offset +=3D 16 - offset
>              while offset < struct_len:
> -                (scope_type, scope_len, id, bus, dev, fn) =3D\
> -                    parse_dmar_devscope(f)
> -                # PCI Endpoint Device
> -                if scope_type =3D=3D 1:
> -                    assert not (flags & 1)
> -                    for d in pcidevices:
> -                        if d.bus =3D=3D bus and d.dev =3D=3D dev and d.f=
n =3D=3D fn:
> -                            d.iommu =3D len(units) - 1
> -                            break
> -                # PCI Sub-hierarchy
> -                elif scope_type =3D=3D 2:
> -                    assert not (flags & 1)
> +                (scope_type, scope_len) =3D struct.unpack('<BB', f.read(=
2))
> +
> +                N =3D (int)((scope_len - 6) / 2) - 1
> +
> +                (id, starting_bus, starting_dev, starting_fn) =3D struct=
.unpack('<xxBBBB', f.read(6))
> +
> +                assign_iommu_info(flags, pcidevices, units, ioapics, sco=
pe_type, id, starting_bus, starting_dev, starting_fn)
> +
> +                while N !=3D 0:
> +                    N-=3D1
> +                    (secondary_dev, secondary_fn) =3D struct.unpack('<BB=
', f.read(2))
>                      for d in pcidevices:
> -                        if d.bus =3D=3D bus and d.dev =3D=3D dev and d.f=
n =3D=3D fn:
> -                            (secondbus, subordinate) =3D \
> -                                PCIPCIBridge.get_2nd_busses(d)
> -                            for d2 in pcidevices:
> -                                if (
> -                                    d2.bus >=3D secondbus and
> -                                    d2.bus <=3D subordinate
> -                                ):
> -                                    d2.iommu =3D len(units) - 1
> +                        if d.bus =3D=3D starting_bus and d.dev =3D=3D st=
arting_dev and d.fn =3D=3D starting_fn:
> +                            (secondbus, subordinate) =3D PCIPCIBridge.ge=
t_2nd_busses(d)
>                              break
> -                # IOAPIC
> -                elif scope_type =3D=3D 3:
> -                    ioapic =3D next(chip for chip in ioapics if chip.id =
=3D=3D id)
> -                    bdf =3D (bus << 8) | (dev << 3) | fn
> -                    for chip in ioapics:
> -                        if chip.bdf =3D=3D bdf:
> -                            raise RuntimeError('IOAPICs with identical B=
DF')
> -                    ioapic.bdf =3D bdf
> -                    ioapic.iommu =3D len(units) - 1
> +                    assign_iommu_info(flags, pcidevices, units, ioapics,=
 scope_type, id, secondbus, secondary_dev, secondary_fn)
>                  offset +=3D scope_len
> =20
>          # Reserved Memory Region Reporting Structure
> @@ -292,13 +309,23 @@ def parse_dmar(pcidevices, ioapics, dmar_regions):
> =20
>              comments =3D []
>              while offset < struct_len:
> -                (scope_type, scope_len, id, bus, dev, fn) =3D\
> -                    parse_dmar_devscope(f)
> -                if scope_type =3D=3D 1:
> -                    comments.append('PCI device: %02x:%02x.%x' %
> -                                    (bus, dev, fn))
> -                else:
> -                    comments.append('DMAR parser could not decode device=
 path')
> +                (scope_type, scope_len) =3D struct.unpack('<BB', f.read(=
2))
> +
> +                N =3D (int)((scope_len - 6) / 2) - 1
> +
> +                (id, starting_bus, starting_dev, starting_fn) =3D struct=
.unpack('<xxBBBB', f.read(6))
> +
> +                append_comment_info(comments, scope_type, starting_bus, =
starting_dev, starting_fn)
> +
> +                while N !=3D 0:
> +                    N-=3D1
> +                    (secondary_dev, secondary_fn) =3D struct.unpack('<BB=
', f.read(2))
> +                    for d in pcidevices:
> +                        if d.bus =3D=3D starting_bus and d.dev =3D=3D st=
arting_dev and d.fn =3D=3D starting_fn:
> +                            (secondbus, subordinate) =3D PCIPCIBridge.ge=
t_2nd_busses(d)
> +                            break
> +
> +                    append_comment_info(comments, scope_type, secondbus,=
 secondary_dev, secondary_fn)
>                  offset +=3D scope_len
> =20
>              reg =3D MemRegion(base, limit, 'ACPI DMAR RMRR', comments)
> --=20
> 2.17.1
>=20
> -------------------------------------------------------------------------=
--
>=20
>=20
> Thanks.
>=20
> HAKKI

Hello everyone,=20

Thanks for the help now I pass the hradware check ! Unfortunately the enabl=
ing of the rootCell is not working yet. With Halli's configuration everythi=
ng is juste freezing without giving any error. When I use my generated file=
 (that is similar to Hakki's one) I got this error :


[] Irq 16 : nobody cared (try booting with the "irqpoll" option)=20
[] Handlers :
[] [<ffffffff81622fa0>] usb_hcd_irq
[] [<ffffffffc025c360>] ilo_isr [hpilo]
[] Disabling IRQ # 16
[] NMI watchdog: BUG: soft lockup - CPU#7 stuck for 22s! [kworkers/...]
[] NMI watchdog: BUG: soft lockup - CPU#6 stuck for 22s! [kworkers/...]
[] NMI watchdog: BUG: soft lockup - CPU#8 stuck for 22s! [kworkers/...]
[] NMI watchdog: BUG: soft lockup - CPU#9 stuck for 22s! [kworkers/...]
[] NMI watchdog: BUG: soft lockup - CPU#11 stuck for 22s! [kworkers/...]
[] NMI watchdog: BUG: soft lockup - CPU#12 stuck for 22s! [kworkers/...]
[] NMI watchdog: BUG: soft lockup - CPU#13 stuck for 22s! [kworkers/...]
[] NMI watchdog: BUG: soft lockup - CPU#14 stuck for 22s! [kworkers/...]
[] NMI watchdog: BUG: soft lockup - CPU#15 stuck for 22s! [kworkers/...]
[] NMI watchdog: BUG: soft lockup - CPU#17 stuck for 22s! [kworkers/...]

etc...

I don't know why there is this error. Do you have an idea ?=20



@Hakki you can find in attachment the lspci command lines you requested

again : thanks for your help


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/71f64f49-1bcd-4ab0-947a-0bcabc2ac1e6%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_195_834613010.1557388371426
Content-Type: text/plain; charset=US-ASCII; name=lspci.txt
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=lspci.txt
X-Attachment-Id: 8e94783c-7227-43ef-aafe-1afa37f78958
Content-ID: <8e94783c-7227-43ef-aafe-1afa37f78958>

sudo lspci -D

0000:00:00.0 Host bridge: Intel Corporation Xeon E5/Core i7 DMI2 (rev 07)
0000:00:01.0 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 1a (rev 07)
0000:00:01.1 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 1b (rev 07)
0000:00:02.0 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2a (rev 07)
0000:00:02.1 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2b (rev 07)
0000:00:02.2 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2c (rev 07)
0000:00:02.3 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2d (rev 07)
0000:00:03.0 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3a in PCI Express Mode (rev 07)
0000:00:03.1 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3b (rev 07)
0000:00:03.2 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3c (rev 07)
0000:00:03.3 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3d (rev 07)
0000:00:04.0 System peripheral: Intel Corporation Xeon E5/Core i7 DMA Channel 0 (rev 07)
0000:00:04.1 System peripheral: Intel Corporation Xeon E5/Core i7 DMA Channel 1 (rev 07)
0000:00:04.2 System peripheral: Intel Corporation Xeon E5/Core i7 DMA Channel 2 (rev 07)
0000:00:04.3 System peripheral: Intel Corporation Xeon E5/Core i7 DMA Channel 3 (rev 07)
0000:00:04.4 System peripheral: Intel Corporation Xeon E5/Core i7 DMA Channel 4 (rev 07)
0000:00:04.5 System peripheral: Intel Corporation Xeon E5/Core i7 DMA Channel 5 (rev 07)
0000:00:04.6 System peripheral: Intel Corporation Xeon E5/Core i7 DMA Channel 6 (rev 07)
0000:00:04.7 System peripheral: Intel Corporation Xeon E5/Core i7 DMA Channel 7 (rev 07)
0000:00:05.0 System peripheral: Intel Corporation Xeon E5/Core i7 Address Map, VTd_Misc, System Management (rev 07)
0000:00:05.2 System peripheral: Intel Corporation Xeon E5/Core i7 Control Status and Global Errors (rev 07)
0000:00:05.4 PIC: Intel Corporation Xeon E5/Core i7 I/O APIC (rev 07)
0000:00:11.0 PCI bridge: Intel Corporation C600/X79 series chipset PCI Express Virtual Root Port (rev 05)
0000:00:1a.0 USB controller: Intel Corporation C600/X79 series chipset USB2 Enhanced Host Controller #2 (rev 05)
0000:00:1c.0 PCI bridge: Intel Corporation C600/X79 series chipset PCI Express Root Port 1 (rev b5)
0000:00:1c.7 PCI bridge: Intel Corporation C600/X79 series chipset PCI Express Root Port 8 (rev b5)
0000:00:1d.0 USB controller: Intel Corporation C600/X79 series chipset USB2 Enhanced Host Controller #1 (rev 05)
0000:00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev a5)
0000:00:1f.0 ISA bridge: Intel Corporation C600/X79 series chipset LPC Controller (rev 05)
0000:00:1f.2 IDE interface: Intel Corporation C600/X79 series chipset 4-Port SATA IDE Controller (rev 05)
0000:01:00.0 System peripheral: Hewlett-Packard Company Integrated Lights-Out Standard Slave Instrumentation & System Support (rev 05)
0000:01:00.1 VGA compatible controller: Matrox Electronics Systems Ltd. MGA G200EH
0000:01:00.2 System peripheral: Hewlett-Packard Company Integrated Lights-Out Standard Management Processor Support and Messaging (rev 05)
0000:01:00.4 USB controller: Hewlett-Packard Company Integrated Lights-Out Standard Virtual USB Controller (rev 02)
0000:02:00.0 RAID bus controller: Hewlett-Packard Company Smart Array Gen8 Controllers (rev 01)
0000:03:00.0 Ethernet controller: Broadcom Corporation NetXtreme BCM5719 Gigabit Ethernet PCIe (rev 01)
0000:03:00.1 Ethernet controller: Broadcom Corporation NetXtreme BCM5719 Gigabit Ethernet PCIe (rev 01)
0000:03:00.2 Ethernet controller: Broadcom Corporation NetXtreme BCM5719 Gigabit Ethernet PCIe (rev 01)
0000:03:00.3 Ethernet controller: Broadcom Corporation NetXtreme BCM5719 Gigabit Ethernet PCIe (rev 01)
0000:1f:08.0 System peripheral: Intel Corporation Xeon E5/Core i7 QPI Link 0 (rev 07)
0000:1f:08.3 System peripheral: Intel Corporation Xeon E5/Core i7 QPI Link Reut 0 (rev 07)
0000:1f:08.4 System peripheral: Intel Corporation Xeon E5/Core i7 QPI Link Reut 0 (rev 07)
0000:1f:09.0 System peripheral: Intel Corporation Xeon E5/Core i7 QPI Link 1 (rev 07)
0000:1f:09.3 System peripheral: Intel Corporation Xeon E5/Core i7 QPI Link Reut 1 (rev 07)
0000:1f:09.4 System peripheral: Intel Corporation Xeon E5/Core i7 QPI Link Reut 1 (rev 07)
0000:1f:0a.0 System peripheral: Intel Corporation Xeon E5/Core i7 Power Control Unit 0 (rev 07)
0000:1f:0a.1 System peripheral: Intel Corporation Xeon E5/Core i7 Power Control Unit 1 (rev 07)
0000:1f:0a.2 System peripheral: Intel Corporation Xeon E5/Core i7 Power Control Unit 2 (rev 07)
0000:1f:0a.3 System peripheral: Intel Corporation Xeon E5/Core i7 Power Control Unit 3 (rev 07)
0000:1f:0b.0 System peripheral: Intel Corporation Xeon E5/Core i7 Interrupt Control Registers (rev 07)
0000:1f:0b.3 System peripheral: Intel Corporation Xeon E5/Core i7 Semaphore and Scratchpad Configuration Registers (rev 07)
0000:1f:0c.0 System peripheral: Intel Corporation Xeon E5/Core i7 Unicast Register 0 (rev 07)
0000:1f:0c.1 System peripheral: Intel Corporation Xeon E5/Core i7 Unicast Register 0 (rev 07)
0000:1f:0c.2 System peripheral: Intel Corporation Xeon E5/Core i7 Unicast Register 0 (rev 07)
0000:1f:0c.6 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 0 (rev 07)
0000:1f:0c.7 System peripheral: Intel Corporation Xeon E5/Core i7 System Address Decoder (rev 07)
0000:1f:0d.0 System peripheral: Intel Corporation Xeon E5/Core i7 Unicast Register 0 (rev 07)
0000:1f:0d.1 System peripheral: Intel Corporation Xeon E5/Core i7 Unicast Register 0 (rev 07)
0000:1f:0d.2 System peripheral: Intel Corporation Xeon E5/Core i7 Unicast Register 0 (rev 07)
0000:1f:0d.6 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 1 (rev 07)
0000:1f:0e.0 System peripheral: Intel Corporation Xeon E5/Core i7 Processor Home Agent (rev 07)
0000:1f:0e.1 Performance counters: Intel Corporation Xeon E5/Core i7 Processor Home Agent Performance Monitoring (rev 07)
0000:1f:0f.0 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Registers (rev 07)
0000:1f:0f.1 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller RAS Registers (rev 07)
0000:1f:0f.2 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 0 (rev 07)
0000:1f:0f.3 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 1 (rev 07)
0000:1f:0f.4 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 2 (rev 07)
0000:1f:0f.5 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 3 (rev 07)
0000:1f:0f.6 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 4 (rev 07)
0000:1f:10.0 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 0 (rev 07)
0000:1f:10.1 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 1 (rev 07)
0000:1f:10.2 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 0 (rev 07)
0000:1f:10.3 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 1 (rev 07)
0000:1f:10.4 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 2 (rev 07)
0000:1f:10.5 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 3 (rev 07)
0000:1f:10.6 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 2 (rev 07)
0000:1f:10.7 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 3 (rev 07)
0000:1f:11.0 System peripheral: Intel Corporation Xeon E5/Core i7 DDRIO (rev 07)
0000:1f:13.0 System peripheral: Intel Corporation Xeon E5/Core i7 R2PCIe (rev 07)
0000:1f:13.1 Performance counters: Intel Corporation Xeon E5/Core i7 Ring to PCI Express Performance Monitor (rev 07)
0000:1f:13.4 Performance counters: Intel Corporation Xeon E5/Core i7 QuickPath Interconnect Agent Ring Registers (rev 07)
0000:1f:13.5 Performance counters: Intel Corporation Xeon E5/Core i7 Ring to QuickPath Interconnect Link 0 Performance Monitor (rev 07)
0000:1f:13.6 System peripheral: Intel Corporation Xeon E5/Core i7 Ring to QuickPath Interconnect Link 1 Performance Monitor (rev 07)
0000:20:00.0 PCI bridge: Intel Corporation Xeon E5/Core i7 DMI2 in PCI Express Mode (rev 07)
0000:20:01.0 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 1a (rev 07)
0000:20:01.1 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 1b (rev 07)
0000:20:02.0 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2a (rev 07)
0000:20:02.1 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2b (rev 07)
0000:20:02.2 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2c (rev 07)
0000:20:02.3 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2d (rev 07)
0000:20:03.0 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3a in PCI Express Mode (rev 07)
0000:20:03.1 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3b (rev 07)
0000:20:03.2 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3c (rev 07)
0000:20:03.3 PCI bridge: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3d (rev 07)
0000:20:04.0 System peripheral: Intel Corporation Xeon E5/Core i7 DMA Channel 0 (rev 07)
0000:20:04.1 System peripheral: Intel Corporation Xeon E5/Core i7 DMA Channel 1 (rev 07)
0000:20:04.2 System peripheral: Intel Corporation Xeon E5/Core i7 DMA Channel 2 (rev 07)
0000:20:04.3 System peripheral: Intel Corporation Xeon E5/Core i7 DMA Channel 3 (rev 07)
0000:20:04.4 System peripheral: Intel Corporation Xeon E5/Core i7 DMA Channel 4 (rev 07)
0000:20:04.5 System peripheral: Intel Corporation Xeon E5/Core i7 DMA Channel 5 (rev 07)
0000:20:04.6 System peripheral: Intel Corporation Xeon E5/Core i7 DMA Channel 6 (rev 07)
0000:20:04.7 System peripheral: Intel Corporation Xeon E5/Core i7 DMA Channel 7 (rev 07)
0000:20:05.0 System peripheral: Intel Corporation Xeon E5/Core i7 Address Map, VTd_Misc, System Management (rev 07)
0000:20:05.2 System peripheral: Intel Corporation Xeon E5/Core i7 Control Status and Global Errors (rev 07)
0000:20:05.4 PIC: Intel Corporation Xeon E5/Core i7 I/O APIC (rev 07)
0000:3f:08.0 System peripheral: Intel Corporation Xeon E5/Core i7 QPI Link 0 (rev 07)
0000:3f:08.3 System peripheral: Intel Corporation Xeon E5/Core i7 QPI Link Reut 0 (rev 07)
0000:3f:08.4 System peripheral: Intel Corporation Xeon E5/Core i7 QPI Link Reut 0 (rev 07)
0000:3f:09.0 System peripheral: Intel Corporation Xeon E5/Core i7 QPI Link 1 (rev 07)
0000:3f:09.3 System peripheral: Intel Corporation Xeon E5/Core i7 QPI Link Reut 1 (rev 07)
0000:3f:09.4 System peripheral: Intel Corporation Xeon E5/Core i7 QPI Link Reut 1 (rev 07)
0000:3f:0a.0 System peripheral: Intel Corporation Xeon E5/Core i7 Power Control Unit 0 (rev 07)
0000:3f:0a.1 System peripheral: Intel Corporation Xeon E5/Core i7 Power Control Unit 1 (rev 07)
0000:3f:0a.2 System peripheral: Intel Corporation Xeon E5/Core i7 Power Control Unit 2 (rev 07)
0000:3f:0a.3 System peripheral: Intel Corporation Xeon E5/Core i7 Power Control Unit 3 (rev 07)
0000:3f:0b.0 System peripheral: Intel Corporation Xeon E5/Core i7 Interrupt Control Registers (rev 07)
0000:3f:0b.3 System peripheral: Intel Corporation Xeon E5/Core i7 Semaphore and Scratchpad Configuration Registers (rev 07)
0000:3f:0c.0 System peripheral: Intel Corporation Xeon E5/Core i7 Unicast Register 0 (rev 07)
0000:3f:0c.1 System peripheral: Intel Corporation Xeon E5/Core i7 Unicast Register 0 (rev 07)
0000:3f:0c.2 System peripheral: Intel Corporation Xeon E5/Core i7 Unicast Register 0 (rev 07)
0000:3f:0c.6 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 0 (rev 07)
0000:3f:0c.7 System peripheral: Intel Corporation Xeon E5/Core i7 System Address Decoder (rev 07)
0000:3f:0d.0 System peripheral: Intel Corporation Xeon E5/Core i7 Unicast Register 0 (rev 07)
0000:3f:0d.1 System peripheral: Intel Corporation Xeon E5/Core i7 Unicast Register 0 (rev 07)
0000:3f:0d.2 System peripheral: Intel Corporation Xeon E5/Core i7 Unicast Register 0 (rev 07)
0000:3f:0d.6 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 1 (rev 07)
0000:3f:0e.0 System peripheral: Intel Corporation Xeon E5/Core i7 Processor Home Agent (rev 07)
0000:3f:0e.1 Performance counters: Intel Corporation Xeon E5/Core i7 Processor Home Agent Performance Monitoring (rev 07)
0000:3f:0f.0 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Registers (rev 07)
0000:3f:0f.1 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller RAS Registers (rev 07)
0000:3f:0f.2 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 0 (rev 07)
0000:3f:0f.3 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 1 (rev 07)
0000:3f:0f.4 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 2 (rev 07)
0000:3f:0f.5 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 3 (rev 07)
0000:3f:0f.6 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 4 (rev 07)
0000:3f:10.0 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 0 (rev 07)
0000:3f:10.1 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 1 (rev 07)
0000:3f:10.2 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 0 (rev 07)
0000:3f:10.3 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 1 (rev 07)
0000:3f:10.4 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 2 (rev 07)
0000:3f:10.5 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 3 (rev 07)
0000:3f:10.6 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 2 (rev 07)
0000:3f:10.7 System peripheral: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 3 (rev 07)
0000:3f:11.0 System peripheral: Intel Corporation Xeon E5/Core i7 DDRIO (rev 07)
0000:3f:13.0 System peripheral: Intel Corporation Xeon E5/Core i7 R2PCIe (rev 07)
0000:3f:13.1 Performance counters: Intel Corporation Xeon E5/Core i7 Ring to PCI Express Performance Monitor (rev 07)
0000:3f:13.4 Performance counters: Intel Corporation Xeon E5/Core i7 QuickPath Interconnect Agent Ring Registers (rev 07)
0000:3f:13.5 Performance counters: Intel Corporation Xeon E5/Core i7 Ring to QuickPath Interconnect Link 0 Performance Monitor (rev 07)
0000:3f:13.6 System peripheral: Intel Corporation Xeon E5/Core i7 Ring to QuickPath Interconnect Link 1 Performance Monitor (rev 07)


sudo lspci -Dtvvv

-+-[0000:3f]-+-08.0  Intel Corporation Xeon E5/Core i7 QPI Link 0
 |           +-08.3  Intel Corporation Xeon E5/Core i7 QPI Link Reut 0
 |           +-08.4  Intel Corporation Xeon E5/Core i7 QPI Link Reut 0
 |           +-09.0  Intel Corporation Xeon E5/Core i7 QPI Link 1
 |           +-09.3  Intel Corporation Xeon E5/Core i7 QPI Link Reut 1
 |           +-09.4  Intel Corporation Xeon E5/Core i7 QPI Link Reut 1
 |           +-0a.0  Intel Corporation Xeon E5/Core i7 Power Control Unit 0
 |           +-0a.1  Intel Corporation Xeon E5/Core i7 Power Control Unit 1
 |           +-0a.2  Intel Corporation Xeon E5/Core i7 Power Control Unit 2
 |           +-0a.3  Intel Corporation Xeon E5/Core i7 Power Control Unit 3
 |           +-0b.0  Intel Corporation Xeon E5/Core i7 Interrupt Control Registers
 |           +-0b.3  Intel Corporation Xeon E5/Core i7 Semaphore and Scratchpad Configuration Registers
 |           +-0c.0  Intel Corporation Xeon E5/Core i7 Unicast Register 0
 |           +-0c.1  Intel Corporation Xeon E5/Core i7 Unicast Register 0
 |           +-0c.2  Intel Corporation Xeon E5/Core i7 Unicast Register 0
 |           +-0c.6  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 0
 |           +-0c.7  Intel Corporation Xeon E5/Core i7 System Address Decoder
 |           +-0d.0  Intel Corporation Xeon E5/Core i7 Unicast Register 0
 |           +-0d.1  Intel Corporation Xeon E5/Core i7 Unicast Register 0
 |           +-0d.2  Intel Corporation Xeon E5/Core i7 Unicast Register 0
 |           +-0d.6  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 1
 |           +-0e.0  Intel Corporation Xeon E5/Core i7 Processor Home Agent
 |           +-0e.1  Intel Corporation Xeon E5/Core i7 Processor Home Agent Performance Monitoring
 |           +-0f.0  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Registers
 |           +-0f.1  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller RAS Registers
 |           +-0f.2  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 0
 |           +-0f.3  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 1
 |           +-0f.4  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 2
 |           +-0f.5  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 3
 |           +-0f.6  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 4
 |           +-10.0  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 0
 |           +-10.1  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 1
 |           +-10.2  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 0
 |           +-10.3  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 1
 |           +-10.4  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 2
 |           +-10.5  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 3
 |           +-10.6  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 2
 |           +-10.7  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 3
 |           +-11.0  Intel Corporation Xeon E5/Core i7 DDRIO
 |           +-13.0  Intel Corporation Xeon E5/Core i7 R2PCIe
 |           +-13.1  Intel Corporation Xeon E5/Core i7 Ring to PCI Express Performance Monitor
 |           +-13.4  Intel Corporation Xeon E5/Core i7 QuickPath Interconnect Agent Ring Registers
 |           +-13.5  Intel Corporation Xeon E5/Core i7 Ring to QuickPath Interconnect Link 0 Performance Monitor
 |           \-13.6  Intel Corporation Xeon E5/Core i7 Ring to QuickPath Interconnect Link 1 Performance Monitor
 +-[0000:20]-+-00.0-[2b]--
 |           +-01.0-[21]--
 |           +-01.1-[22]--
 |           +-02.0-[23]--
 |           +-02.1-[24]--
 |           +-02.2-[25]--
 |           +-02.3-[26]--
 |           +-03.0-[27]--
 |           +-03.1-[28]--
 |           +-03.2-[29]--
 |           +-03.3-[2a]--
 |           +-04.0  Intel Corporation Xeon E5/Core i7 DMA Channel 0
 |           +-04.1  Intel Corporation Xeon E5/Core i7 DMA Channel 1
 |           +-04.2  Intel Corporation Xeon E5/Core i7 DMA Channel 2
 |           +-04.3  Intel Corporation Xeon E5/Core i7 DMA Channel 3
 |           +-04.4  Intel Corporation Xeon E5/Core i7 DMA Channel 4
 |           +-04.5  Intel Corporation Xeon E5/Core i7 DMA Channel 5
 |           +-04.6  Intel Corporation Xeon E5/Core i7 DMA Channel 6
 |           +-04.7  Intel Corporation Xeon E5/Core i7 DMA Channel 7
 |           +-05.0  Intel Corporation Xeon E5/Core i7 Address Map, VTd_Misc, System Management
 |           +-05.2  Intel Corporation Xeon E5/Core i7 Control Status and Global Errors
 |           \-05.4  Intel Corporation Xeon E5/Core i7 I/O APIC
 +-[0000:1f]-+-08.0  Intel Corporation Xeon E5/Core i7 QPI Link 0
 |           +-08.3  Intel Corporation Xeon E5/Core i7 QPI Link Reut 0
 |           +-08.4  Intel Corporation Xeon E5/Core i7 QPI Link Reut 0
 |           +-09.0  Intel Corporation Xeon E5/Core i7 QPI Link 1
 |           +-09.3  Intel Corporation Xeon E5/Core i7 QPI Link Reut 1
 |           +-09.4  Intel Corporation Xeon E5/Core i7 QPI Link Reut 1
 |           +-0a.0  Intel Corporation Xeon E5/Core i7 Power Control Unit 0
 |           +-0a.1  Intel Corporation Xeon E5/Core i7 Power Control Unit 1
 |           +-0a.2  Intel Corporation Xeon E5/Core i7 Power Control Unit 2
 |           +-0a.3  Intel Corporation Xeon E5/Core i7 Power Control Unit 3
 |           +-0b.0  Intel Corporation Xeon E5/Core i7 Interrupt Control Registers
 |           +-0b.3  Intel Corporation Xeon E5/Core i7 Semaphore and Scratchpad Configuration Registers
 |           +-0c.0  Intel Corporation Xeon E5/Core i7 Unicast Register 0
 |           +-0c.1  Intel Corporation Xeon E5/Core i7 Unicast Register 0
 |           +-0c.2  Intel Corporation Xeon E5/Core i7 Unicast Register 0
 |           +-0c.6  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 0
 |           +-0c.7  Intel Corporation Xeon E5/Core i7 System Address Decoder
 |           +-0d.0  Intel Corporation Xeon E5/Core i7 Unicast Register 0
 |           +-0d.1  Intel Corporation Xeon E5/Core i7 Unicast Register 0
 |           +-0d.2  Intel Corporation Xeon E5/Core i7 Unicast Register 0
 |           +-0d.6  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 1
 |           +-0e.0  Intel Corporation Xeon E5/Core i7 Processor Home Agent
 |           +-0e.1  Intel Corporation Xeon E5/Core i7 Processor Home Agent Performance Monitoring
 |           +-0f.0  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Registers
 |           +-0f.1  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller RAS Registers
 |           +-0f.2  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 0
 |           +-0f.3  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 1
 |           +-0f.4  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 2
 |           +-0f.5  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 3
 |           +-0f.6  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 4
 |           +-10.0  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 0
 |           +-10.1  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 1
 |           +-10.2  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 0
 |           +-10.3  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 1
 |           +-10.4  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 2
 |           +-10.5  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 3
 |           +-10.6  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 2
 |           +-10.7  Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 3
 |           +-11.0  Intel Corporation Xeon E5/Core i7 DDRIO
 |           +-13.0  Intel Corporation Xeon E5/Core i7 R2PCIe
 |           +-13.1  Intel Corporation Xeon E5/Core i7 Ring to PCI Express Performance Monitor
 |           +-13.4  Intel Corporation Xeon E5/Core i7 QuickPath Interconnect Agent Ring Registers
 |           +-13.5  Intel Corporation Xeon E5/Core i7 Ring to QuickPath Interconnect Link 0 Performance Monitor
 |           \-13.6  Intel Corporation Xeon E5/Core i7 Ring to QuickPath Interconnect Link 1 Performance Monitor
 \-[0000:00]-+-00.0  Intel Corporation Xeon E5/Core i7 DMI2
             +-01.0-[04]--
             +-01.1-[11]--
             +-02.0-[03]--+-00.0  Broadcom Corporation NetXtreme BCM5719 Gigabit Ethernet PCIe
             |            +-00.1  Broadcom Corporation NetXtreme BCM5719 Gigabit Ethernet PCIe
             |            +-00.2  Broadcom Corporation NetXtreme BCM5719 Gigabit Ethernet PCIe
             |            \-00.3  Broadcom Corporation NetXtreme BCM5719 Gigabit Ethernet PCIe
             +-02.1-[12]--
             +-02.2-[02]----00.0  Hewlett-Packard Company Smart Array Gen8 Controllers
             +-02.3-[13]--
             +-03.0-[07]--
             +-03.1-[14]--
             +-03.2-[15]--
             +-03.3-[16]--
             +-04.0  Intel Corporation Xeon E5/Core i7 DMA Channel 0
             +-04.1  Intel Corporation Xeon E5/Core i7 DMA Channel 1
             +-04.2  Intel Corporation Xeon E5/Core i7 DMA Channel 2
             +-04.3  Intel Corporation Xeon E5/Core i7 DMA Channel 3
             +-04.4  Intel Corporation Xeon E5/Core i7 DMA Channel 4
             +-04.5  Intel Corporation Xeon E5/Core i7 DMA Channel 5
             +-04.6  Intel Corporation Xeon E5/Core i7 DMA Channel 6
             +-04.7  Intel Corporation Xeon E5/Core i7 DMA Channel 7
             +-05.0  Intel Corporation Xeon E5/Core i7 Address Map, VTd_Misc, System Management
             +-05.2  Intel Corporation Xeon E5/Core i7 Control Status and Global Errors
             +-05.4  Intel Corporation Xeon E5/Core i7 I/O APIC
             +-11.0-[18]--
             +-1a.0  Intel Corporation C600/X79 series chipset USB2 Enhanced Host Controller #2
             +-1c.0-[0a]--
             +-1c.7-[01]--+-00.0  Hewlett-Packard Company Integrated Lights-Out Standard Slave Instrumentation & System Support
             |            +-00.1  Matrox Electronics Systems Ltd. MGA G200EH
             |            +-00.2  Hewlett-Packard Company Integrated Lights-Out Standard Management Processor Support and Messaging
             |            \-00.4  Hewlett-Packard Company Integrated Lights-Out Standard Virtual USB Controller
             +-1d.0  Intel Corporation C600/X79 series chipset USB2 Enhanced Host Controller #1
             +-1e.0-[17]--
             +-1f.0  Intel Corporation C600/X79 series chipset LPC Controller
             \-1f.2  Intel Corporation C600/X79 series chipset 4-Port SATA IDE Controller


sudo lspci -Dkvvvnnxxx 


0000:00:00.0 Host bridge [0600]: Intel Corporation Xeon E5/Core i7 DMI2 [8086:3c00] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMI2 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Interrupt: pin A routed to IRQ 0
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed unknown, Width x0, TrErr- Train- SlotClk- DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible-
                RootCap: CRSVisible-
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [144 v1] Vendor Specific Information: ID=0004 Rev=1 Len=03c <?>
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
00: 86 80 00 3c 40 01 10 00 07 00 00 06 00 00 00 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 90 00 00 00 00 00 00 00 00 01 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 01 00 00 fc 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 00 80 00 00 00 00 00 00 41 78 7a 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 06 00 00 00
b0: 00 00 00 00 1e 10 00 00 00 00 00 00 06 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 10 00 00 00 00 00 00 00

0000:00:01.0 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 1a [8086:3c02] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 24
        Bus: primary=00, secondary=04, subordinate=04, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 1a [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #8, Speed 8GT/s, Width x8, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 02 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 00 04 04 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 83 78 7a 08
a0: 00 00 01 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:01.1 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 1b [8086:3c03] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 24
        Bus: primary=00, secondary=11, subordinate=11, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 1b [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 03 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 00 11 11 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 43 78 7a 00
a0: 00 00 01 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:02.0 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2a [8086:3c04] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 24
        Bus: primary=00, secondary=03, subordinate=03, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: f4000000-f40fffff
        Prefetchable memory behind bridge: 00000000f6b00000-00000000f6bfffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 2a [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #16, Speed 8GT/s, Width x8, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 5GT/s, Width x4, TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 04 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 00 03 03 00 f0 00 00 20
20: 00 f4 00 f4 b1 f6 b1 f6 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 83 78 7a 10
a0: 40 00 42 70 00 00 00 00 c0 07 48 01 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:02.1 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2b [8086:3c05] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 24
        Bus: primary=00, secondary=12, subordinate=12, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 2b [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 05 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 00 12 12 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 43 78 7a 00
a0: 00 00 02 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:02.2 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2c [8086:3c06] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 24
        Bus: primary=00, secondary=02, subordinate=02, sec-latency=0
        I/O behind bridge: 00005000-00005fff
        Memory behind bridge: f7e00000-f7ffffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 2c [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #18, Speed 8GT/s, Width x8, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 8GT/s, Width x8, TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+, EqualizationPhase1+
                         EqualizationPhase2+, EqualizationPhase3+, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 06 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 00 02 02 00 50 50 00 00
20: e0 f7 f0 f7 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 83 78 5a 12
a0: 00 00 83 70 00 00 00 00 c0 07 48 01 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 43 00 1f 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:02.3 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2d [8086:3c07] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 24
        Bus: primary=00, secondary=13, subordinate=13, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 2d [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 8GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 07 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 00 13 13 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 43 78 5a 00
a0: 00 00 03 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:03.0 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3a in PCI Express Mode [8086:3c08] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 24
        Bus: primary=00, secondary=07, subordinate=07, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 3a in PCI Express Mode [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag+ RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #24, Speed 8GT/s, Width x16, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 08 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 00 07 07 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 21 80 00 00 26 00 00 00 03 79 7a 18
a0: 00 00 01 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:03.1 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3b [8086:3c09] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 24
        Bus: primary=00, secondary=14, subordinate=14, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 3b [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 09 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 00 14 14 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 43 78 7a 00
a0: 00 00 01 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:03.2 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3c [8086:3c0a] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 24
        Bus: primary=00, secondary=15, subordinate=15, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 3c [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 0a 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 00 15 15 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 43 78 5a 00
a0: 00 00 01 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:03.3 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3d [8086:3c0b] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 24
        Bus: primary=00, secondary=16, subordinate=16, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 3d [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 0b 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 00 16 16 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 43 78 5a 00
a0: 00 00 01 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:04.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 0 [8086:3c20] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMA Channel 0 [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 5
        Region 0: Memory at f6cf0000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [80] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00003000
        Capabilities: [90] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ioatdma
        Kernel modules: ioatdma
00: 86 80 20 3c 06 04 10 00 07 00 80 08 10 00 80 00
10: 04 00 cf f6 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 05 01 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 0f 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 11 90 00 80 00 20 00 00 00 30 00 00 00 00 00 00
90: 10 e0 92 00 00 80 00 00 00 08 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:04.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 1 [8086:3c21] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMA Channel 1 [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 7
        Region 0: Memory at f6ce0000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [80] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00003000
        Capabilities: [90] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ioatdma
        Kernel modules: ioatdma
00: 86 80 21 3c 06 04 10 00 07 00 80 08 10 00 80 00
10: 04 00 ce f6 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 07 02 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 11 90 00 80 00 20 00 00 00 30 00 00 00 00 00 00
90: 10 e0 92 00 00 80 00 00 00 08 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:04.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 2 [8086:3c22] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMA Channel 2 [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin C routed to IRQ 10
        Region 0: Memory at f6cd0000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [80] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00003000
        Capabilities: [90] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ioatdma
        Kernel modules: ioatdma
00: 86 80 22 3c 06 04 10 00 07 00 80 08 10 00 80 00
10: 04 00 cd f6 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 0a 03 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 11 90 00 80 00 20 00 00 00 30 00 00 00 00 00 00
90: 10 e0 92 00 00 80 00 00 00 08 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:04.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 3 [8086:3c23] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMA Channel 3 [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin D routed to IRQ 10
        Region 0: Memory at f6cc0000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [80] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00003000
        Capabilities: [90] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ioatdma
        Kernel modules: ioatdma
00: 86 80 23 3c 06 04 10 00 07 00 80 08 10 00 80 00
10: 04 00 cc f6 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 0a 04 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 11 90 00 80 00 20 00 00 00 30 00 00 00 00 00 00
90: 10 e0 92 00 00 80 00 00 00 08 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:04.4 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 4 [8086:3c24] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMA Channel 4 [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 5
        Region 0: Memory at f6cb0000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [80] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00003000
        Capabilities: [90] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ioatdma
        Kernel modules: ioatdma
00: 86 80 24 3c 06 04 10 00 07 00 80 08 10 00 80 00
10: 04 00 cb f6 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 05 01 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 11 90 00 80 00 20 00 00 00 30 00 00 00 00 00 00
90: 10 e0 92 00 00 80 00 00 00 08 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:04.5 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 5 [8086:3c25] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMA Channel 5 [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 7
        Region 0: Memory at f6ca0000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [80] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00003000
        Capabilities: [90] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ioatdma
        Kernel modules: ioatdma
00: 86 80 25 3c 06 04 10 00 07 00 80 08 10 00 80 00
10: 04 00 ca f6 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 07 02 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 11 90 00 80 00 20 00 00 00 30 00 00 00 00 00 00
90: 10 e0 92 00 00 80 00 00 00 08 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:04.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 6 [8086:3c26] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMA Channel 6 [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin C routed to IRQ 10
        Region 0: Memory at f6c90000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [80] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00003000
        Capabilities: [90] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ioatdma
        Kernel modules: ioatdma
00: 86 80 26 3c 06 04 10 00 07 00 80 08 10 00 80 00
10: 04 00 c9 f6 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 0a 03 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 11 90 00 80 00 20 00 00 00 30 00 00 00 00 00 00
90: 10 e0 92 00 00 80 00 00 00 08 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:04.7 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 7 [8086:3c27] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMA Channel 7 [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin D routed to IRQ 10
        Region 0: Memory at f6c80000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [80] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00003000
        Capabilities: [90] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ioatdma
        Kernel modules: ioatdma
00: 86 80 27 3c 06 04 10 00 07 00 80 08 10 00 80 00
10: 04 00 c8 f6 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 0a 04 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 11 90 00 80 00 20 00 00 00 30 00 00 00 00 00 00
90: 10 e0 92 00 00 80 00 00 00 08 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:05.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Address Map, VTd_Misc, System Management [8086:3c28] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Address Map, VTd_Misc, System Management [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
00: 86 80 28 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 92 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 c0 00 00 00 cc 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 be 00 00 f0 be
b0: 00 00 ff ff ff ff 07 00 00 00 00 00 00 00 00 00
c0: 00 00 ff ff ff ff 07 00 00 00 00 00 00 00 00 00
d0: 00 00 00 bc 00 00 00 3c 10 00 00 00 00 00 00 00
e0: 00 00 00 fc ff ff ff ff 00 00 00 00 00 00 00 00
f0: 00 00 f8 ff ff ff ff ff 00 00 00 00 00 00 00 00

0000:00:05.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Control Status and Global Errors [8086:3c2a] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Control Status and Global Errors [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 4096 bytes
                DevSta: CorrErr+ UncorrErr+ FatalErr+ UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
00: 86 80 2a 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 92 00 00 00 00 00 06 50 07 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 50 01 20 28 00 00 00 00 00 00 00 00 65 15 00 00
90: 00 00 00 00 15 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 2a 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 c4 09 96 1e
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:05.4 PIC [0800]: Intel Corporation Xeon E5/Core i7 I/O APIC [8086:3c2c] (rev 07) (prog-if 20 [IO(X)-APIC])
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 I/O APIC [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Region 0: Memory at f6c70000 (32-bit, non-prefetchable) [size=4K]
        Capabilities: [6c] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
00: 86 80 2c 3c 06 00 10 00 07 20 00 08 10 00 80 00
10: 00 00 c7 f6 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 6c 00 00 00 00 00 00 00 00 00 00 00
40: 00 81 00 00 10 e0 91 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 01 00 03 00
70: 08 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:11.0 PCI bridge [0604]: Intel Corporation C600/X79 series chipset PCI Express Virtual Root Port [8086:1d3e] (rev 05) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 16
        Bus: primary=00, secondary=18, subordinate=18, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 4096 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #17, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled+ CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible-
                RootCap: CRSVisible-
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [80] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [88] Subsystem: Hewlett-Packard Company C600/X79 series chipset PCI Express Virtual Root Port [103c:18a9]
        Capabilities: [90] MSI: Enable- Count=1/1 Maskable- 64bit-
                Address: 00000000  Data: 0000
        Capabilities: [100 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [138 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans+
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 3e 1d 47 01 10 00 05 00 04 06 10 00 01 00
10: 00 00 00 00 00 00 00 00 00 18 18 00 f0 00 00 20
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 10 80 42 00 00 80 00 00 06 50 00 00 11 0c 40 11
50: 10 00 11 10 00 00 00 00 00 00 00 00 06 00 00 00
60: 00 00 00 00 20 00 00 00 00 00 00 00 02 00 00 00
70: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 01 88 03 c8 08 00 00 00 0d 90 00 00 3c 10 a9 18
90: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 f6 01 00 80 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:00:1a.0 USB controller [0c03]: Intel Corporation C600/X79 series chipset USB2 Enhanced Host Controller #2 [8086:1d2d] (rev 05) (prog-if 20 [EHCI])
        Subsystem: Hewlett-Packard Company C600/X79 series chipset USB2 Enhanced Host Controller [103c:18a9]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 21
        Region 0: Memory at f6c60000 (32-bit, non-prefetchable) [size=1K]
        Capabilities: [50] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [58] Debug port: BAR=1 offset=00a0
        Capabilities: [98] PCI Advanced Features
                AFCap: TP+ FLR+
                AFCtrl: FLR-
                AFStatus: TP-
        Kernel driver in use: ehci-pci
00: 86 80 2d 1d 46 01 90 02 05 20 03 0c 00 00 00 00
10: 00 00 c6 f6 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a9 18
30: 00 00 00 00 50 00 00 00 00 00 00 00 07 01 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 01 58 c2 c9 00 00 00 00 0a 98 a0 20 00 00 00 00
60: 20 20 ff 07 00 00 00 00 01 00 00 01 00 00 00 c0
70: 00 00 df 3f 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 80 00 11 88 0c 93 30 0d 08 24 00 00 00 00
90: 00 00 00 00 00 00 00 00 13 00 06 03 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 aa ff 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 40 02 08 00 00 91 01 50 14 50 03 c5
f0: 00 00 00 00 88 85 8f 00 87 0f 07 08 e8 97 5b 20

0000:00:1c.0 PCI bridge [0604]: Intel Corporation C600/X79 series chipset PCI Express Root Port 1 [8086:1d10] (rev b5) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 16
        Bus: primary=00, secondary=0a, subordinate=0a, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-
                LnkCap: Port #1, Speed 5GT/s, Width x4, ASPM L0s L1, Exit Latency L0s <1us, L1 <4us
                        ClockPM- Surprise- LLActRep+ BwNot- ASPMOptComp-
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train+ SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible-
                RootCap: CRSVisible-
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BC, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-
                Address: 00000000  Data: 0000
        Capabilities: [90] Subsystem: Hewlett-Packard Company C600/X79 series chipset PCI Express Root Port 1 [103c:18a9]
        Capabilities: [a0] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 10 1d 47 01 10 00 b5 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 00 0a 0a 00 f0 00 00 20
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 10 80 42 00 00 80 00 00 06 00 10 00 42 4c 11 01
50: 00 00 01 18 60 00 04 00 00 00 40 00 06 00 00 00
60: 00 00 00 00 16 00 00 00 00 00 00 00 00 00 00 00
70: 02 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 05 90 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 0d a0 00 00 3c 10 a9 18 00 00 00 00 00 00 00 00
a0: 01 00 02 c8 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 01 02 0b 00 00 00 80 11 01 00 00 00 00
e0: 00 3c 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 87 0f 07 08 00 00 00 00

0000:00:1c.7 PCI bridge [0604]: Intel Corporation C600/X79 series chipset PCI Express Root Port 8 [8086:1d1e] (rev b5) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin D routed to IRQ 19
        Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
        I/O behind bridge: 00003000-00003fff
        Memory behind bridge: f6d00000-f7dfffff
        Prefetchable memory behind bridge: 00000000f5000000-00000000f5ffffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA+ MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-
                LnkCap: Port #8, Speed 5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <1us, L1 <4us
                        ClockPM- Surprise- LLActRep+ BwNot- ASPMOptComp-
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible-
                RootCap: CRSVisible-
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BC, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-
                Address: 00000000  Data: 0000
        Capabilities: [90] Subsystem: Hewlett-Packard Company C600/X79 series chipset PCI Express Root Port 8 [103c:18a9]
        Capabilities: [a0] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 1e 1d 47 01 10 00 b5 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 00 01 01 00 30 30 00 20
20: d0 f6 d0 f7 01 f5 f1 f5 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 04 0b 00
40: 10 80 42 00 00 80 00 00 06 00 10 00 12 4c 11 08
50: 00 00 11 70 60 00 04 00 00 00 40 01 06 00 00 00
60: 00 00 00 00 16 00 00 00 00 00 00 00 00 00 00 00
70: 02 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 05 90 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 0d a0 00 00 3c 10 a9 18 00 00 00 00 00 00 00 00
a0: 01 00 02 c8 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 01 02 0b 00 00 00 80 11 01 00 00 00 00
e0: 00 03 00 00 00 00 00 00 01 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 87 0f 07 08 00 00 00 00

0000:00:1d.0 USB controller [0c03]: Intel Corporation C600/X79 series chipset USB2 Enhanced Host Controller #1 [8086:1d26] (rev 05) (prog-if 20 [EHCI])
        Subsystem: Hewlett-Packard Company C600/X79 series chipset USB2 Enhanced Host Controller [103c:18a9]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 20
        Region 0: Memory at f6c50000 (32-bit, non-prefetchable) [size=1K]
        Capabilities: [50] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [58] Debug port: BAR=1 offset=00a0
        Capabilities: [98] PCI Advanced Features
                AFCap: TP+ FLR+
                AFCtrl: FLR-
                AFStatus: TP-
        Kernel driver in use: ehci-pci
00: 86 80 26 1d 46 01 90 02 05 20 03 0c 00 00 00 00
10: 00 00 c5 f6 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a9 18
30: 00 00 00 00 50 00 00 00 00 00 00 00 05 01 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 01 58 c2 c9 00 00 00 00 0a 98 a0 20 00 00 00 00
60: 20 20 ff 07 00 00 00 00 01 00 00 01 00 00 08 c0
70: 00 00 df 3f 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 80 00 11 88 0c 93 30 0d 08 24 00 00 00 00
90: 00 00 00 00 00 00 00 00 13 00 06 03 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 aa ff 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 80 46 00 89 04 68 00 02 04 10 4c b9
f0: 00 00 00 00 88 85 8f 00 87 0f 07 08 e8 97 5b 20

0000:00:1e.0 PCI bridge [0604]: Intel Corporation 82801 PCI Bridge [8086:244e] (rev a5) (prog-if 01 [Subtractive decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Bus: primary=00, secondary=17, subordinate=17, sec-latency=32
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [50] Subsystem: Hewlett-Packard Company 82801 PCI Bridge [103c:18a9]
00: 86 80 4e 24 47 01 10 00 a5 01 04 06 00 00 01 00
10: 00 00 00 00 00 00 00 00 00 17 17 20 f0 00 80 22
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 50 00 00 00 00 00 00 00 ff 00 03 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 12 00 10
50: 0d 00 00 00 3c 10 a9 18 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 87 0f 07 08 00 00 00 00

0000:00:1f.0 ISA bridge [0601]: Intel Corporation C600/X79 series chipset LPC Controller [8086:1d41] (rev 05)
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Capabilities: [e0] Vendor Specific Information: Len=0c <?>
        Kernel driver in use: lpc_ich
        Kernel modules: lpc_ich
00: 86 80 41 1d 47 01 10 02 05 00 01 06 00 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 e0 00 00 00 00 00 00 00 00 00 00 00
40: 01 09 00 00 80 00 00 00 81 08 00 00 10 00 00 00
50: f8 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 85 87 8a 8a d0 00 00 00 85 87 80 80 f1 00 00 00
70: f8 00 f8 00 f8 00 f8 00 f8 00 f8 00 f8 00 f8 00
80: 10 00 0b 34 01 08 fc 00 a1 0c 0c 00 d1 0c 0c 00
90: 11 03 1c 00 30 0f 00 00 00 00 00 00 00 00 00 00
a0: 00 0a 24 00 00 42 00 00 00 47 00 00 00 03 00 40
b0: 00 00 00 00 00 00 00 00 00 40 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 67 45 00 00 cf ff 00 00 20 00 00 00
e0: 09 00 0c 10 00 00 00 00 91 02 64 0c 00 00 00 00
f0: 01 c0 d1 fe 00 00 00 00 87 0f 07 08 00 00 00 00

0000:00:1f.2 IDE interface [0101]: Intel Corporation C600/X79 series chipset 4-Port SATA IDE Controller [8086:1d00] (rev 05) (prog-if 8f [Master SecP SecO PriP PriO])
        Subsystem: Hewlett-Packard Company C600/X79 series chipset 4-Port SATA IDE Controller [103c:18a9]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin B routed to IRQ 17
        Region 0: I/O ports at 4000 [size=8]
        Region 1: I/O ports at 4008 [size=4]
        Region 2: I/O ports at 4010 [size=8]
        Region 3: I/O ports at 4018 [size=4]
        Region 4: I/O ports at 4020 [size=16]
        Region 5: I/O ports at 4030 [size=16]
        Capabilities: [70] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [b0] PCI Advanced Features
                AFCap: TP+ FLR+
                AFCtrl: FLR-
                AFStatus: TP-
        Kernel driver in use: ata_piix
        Kernel modules: pata_acpi
00: 86 80 00 1d 47 00 b0 02 05 8f 01 01 00 00 00 00
10: 01 40 00 00 09 40 00 00 11 40 00 00 19 40 00 00
20: 21 40 00 00 31 40 00 00 00 00 00 00 3c 10 a9 18
30: 00 00 00 00 70 00 00 00 00 00 00 00 07 02 00 00
40: 00 80 00 80 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 01 b0 03 00 08 00 00 00 00 00 00 00 00 00 00 00
80: 05 70 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 0f 81 83 01 00 3e 00 02 58 00 00 02 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 13 00 06 03 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 05 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 87 0f 07 08 00 00 00 00

0000:01:00.0 System peripheral [0880]: Hewlett-Packard Company Integrated Lights-Out Standard Slave Instrumentation & System Support [103c:3306] (rev 05)
        Subsystem: Hewlett-Packard Company iLO4 [103c:3381]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 5
        Region 0: I/O ports at 3000 [size=256]
        Region 1: Memory at f7df0000 (32-bit, non-prefetchable) [size=512]
        Region 2: I/O ports at 3400 [size=256]
        Capabilities: [78] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [b0] MSI: Enable- Count=1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [c0] Express (v1) Legacy Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq+ AuxPwr- TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s, Exit Latency L0s <4us, L1 <4us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk- DLActive- BWMgmt- ABWMgmt-
        Kernel modules: hpwdt
00: 3c 10 06 33 07 00 10 00 05 00 80 08 10 00 80 00
10: 01 30 00 00 00 00 df f7 01 34 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 81 33
30: 00 00 00 00 78 00 00 00 00 00 00 00 05 01 00 00
40: 27 df dc 00 51 2c 00 00 00 00 00 00 06 01 06 00
50: 04 00 db d9 00 00 00 02 ef fe fc 77 01 00 00 5a
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 80 00 00 01 01 01 b0 03 00 08 00 00 00
80: 00 00 00 00 00 01 00 f7 40 00 00 03 43 50 51 00
90: 01 00 00 00 02 00 00 5f 00 00 10 00 00 00 00 60
a0: 00 00 00 00 50 fe 02 00 2e 00 00 00 00 00 00 00
b0: 05 c0 80 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 10 00 11 00 c0 8f 00 00 06 00 08 00 11 64 01 00
d0: 00 00 11 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:01:00.1 VGA compatible controller [0300]: Matrox Electronics Systems Ltd. MGA G200EH [102b:0533] (prog-if 00 [VGA controller])
        Subsystem: Hewlett-Packard Company iLO4 [103c:3381]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 7
        Region 0: Memory at f5000000 (32-bit, prefetchable) [size=16M]
        Region 1: Memory at f7de0000 (32-bit, non-prefetchable) [size=16K]
        Region 2: Memory at f7000000 (32-bit, non-prefetchable) [size=8M]
        Expansion ROM at <unassigned> [disabled]
        Capabilities: [a8] Power Management version 3
                Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [b0] MSI: Enable- Count=1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [c0] Express (v1) Legacy Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq+ AuxPwr- TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s, Exit Latency L0s <4us, L1 <4us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk- DLActive- BWMgmt- ABWMgmt-
00: 2b 10 33 05 47 00 10 00 00 00 00 03 10 00 80 00
10: 08 00 00 f5 00 00 de f7 00 00 00 f7 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 81 33
30: 00 00 00 00 a8 00 00 00 00 00 00 00 07 02 00 00
40: 20 01 00 00 08 3c 00 00 00 00 1e 00 00 00 00 00
50: 00 30 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 01 00 00 00 4b 00 09 00 00 00 00 00 00 03 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 03 00 00 0f 01 b0 23 00 08 00 00 00
b0: 05 c0 80 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 10 00 11 00 c0 8f 00 00 06 00 08 00 11 64 01 00
d0: 00 00 11 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:01:00.2 System peripheral [0880]: Hewlett-Packard Company Integrated Lights-Out Standard Management Processor Support and Messaging [103c:3307] (rev 05)
        Subsystem: Hewlett-Packard Company iLO4 [103c:3381]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 16
        Region 0: I/O ports at 3800 [size=256]
        Region 1: Memory at f6ff0000 (32-bit, non-prefetchable) [size=256]
        Region 2: Memory at f6e00000 (32-bit, non-prefetchable) [size=1M]
        Region 3: Memory at f6d80000 (32-bit, non-prefetchable) [size=512K]
        Region 4: Memory at f6d70000 (32-bit, non-prefetchable) [size=32K]
        Region 5: Memory at f6d60000 (32-bit, non-prefetchable) [size=32K]
        [virtual] Expansion ROM at f6d00000 [disabled] [size=64K]
        Capabilities: [78] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [b0] MSI: Enable- Count=1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [c0] Express (v1) Legacy Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq+ AuxPwr- TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s, Exit Latency L0s <4us, L1 <4us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk- DLActive- BWMgmt- ABWMgmt-
        Kernel driver in use: hpilo
        Kernel modules: hpilo
00: 3c 10 07 33 07 00 10 00 05 00 80 08 10 00 80 00
10: 01 38 00 00 00 00 ff f6 00 00 e0 f6 00 00 d8 f6
20: 00 00 d7 f6 00 00 d6 f6 00 00 00 00 3c 10 81 33
30: 00 00 00 00 78 00 00 00 00 00 00 00 07 02 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 01 b0 03 c8 08 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 62 00 05 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 05 c0 80 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 10 00 11 00 c0 8f 00 00 06 00 08 00 11 64 01 00
d0: 00 00 11 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:01:00.4 USB controller [0c03]: Hewlett-Packard Company Integrated Lights-Out Standard Virtual USB Controller [103c:3300] (rev 02) (prog-if 00 [UHCI])
        Subsystem: Hewlett-Packard Company iLO4 [103c:3381]
        Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 16
        Region 4: I/O ports at 3c00 [size=32]
        Capabilities: [70] MSI: Enable- Count=1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [80] Express (v1) Legacy Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq+ AuxPwr- TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s, Exit Latency L0s <4us, L1 <4us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk- DLActive- BWMgmt- ABWMgmt-
        Capabilities: [f0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: uhci_hcd
00: 3c 10 00 33 45 00 10 00 02 00 03 0c 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 01 3c 00 00 00 00 00 00 00 00 00 00 3c 10 81 33
30: 00 00 00 00 70 00 00 00 00 00 00 00 07 02 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 05 80 80 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 10 f0 11 00 c0 8f 00 00 06 00 08 00 11 64 01 00
90: 00 00 11 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 20 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 01 00 03 00 08 00 00 00 00 00 00 00 00 00 00 00

0000:02:00.0 RAID bus controller [0104]: Hewlett-Packard Company Smart Array Gen8 Controllers [103c:323b] (rev 01)
        DeviceName: Storage Controller
        Subsystem: Hewlett-Packard Company P420i [103c:3354]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 26
        Region 0: Memory at f7f00000 (64-bit, non-prefetchable) [size=1M]
        Region 2: Memory at f7ef0000 (64-bit, non-prefetchable) [size=1K]
        Region 4: I/O ports at 5000 [size=256]
        [virtual] Expansion ROM at f7e00000 [disabled] [size=512K]
        Capabilities: [80] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1+,D2-,D3hot+,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [90] MSI: Enable- Count=1/32 Maskable+ 64bit+
                Address: 0000000000000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [b0] MSI-X: Enable+ Count=64 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00003000
        Capabilities: [c0] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 512 bytes, PhantFunc 0, Latency L0s <4us, L1 <1us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 4096 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x8, ASPM L0s L1, Exit Latency L0s unlimited, L1 <64us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 8GT/s, Width x8, TrErr- Train- SlotClk- DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range B, TimeoutDis+, LTR+, OBFF Via message
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+, EqualizationPhase1+
                         EqualizationPhase2+, EqualizationPhase3+, LinkEqualizationRequest-
        Capabilities: [100 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES+ TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap+ CGenEn- ChkCap+ ChkEn-
        Capabilities: [300 v1] #19
        Kernel driver in use: hpsa
        Kernel modules: hpsa
00: 3c 10 3b 32 47 04 10 00 01 00 04 01 10 00 00 00
10: 04 00 f0 f7 00 00 00 00 04 00 ef f7 00 00 00 00
20: 01 50 00 00 00 00 00 00 00 00 00 00 3c 10 54 33
30: 00 00 00 00 80 00 00 00 00 00 00 00 05 01 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 01 90 03 58 08 00 00 00 00 00 00 00 00 00 00 00
90: 05 b0 8a 01 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 11 c0 3f 80 00 20 00 00 00 30 00 00 00 00 00 00
c0: 10 00 02 00 a2 81 00 00 36 58 00 00 83 7c 43 00
d0: 00 00 83 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 92 1b 04 00 00 00 00 00 0e 00 00 00
f0: 03 00 1f 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:03:00.0 Ethernet controller [0200]: Broadcom Corporation NetXtreme BCM5719 Gigabit Ethernet PCIe [14e4:1657] (rev 01)
        DeviceName: NIC Port 1
        Subsystem: Hewlett-Packard Company Ethernet 1Gb 4-port 331FLR Adapter [103c:169d]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 51
        Region 0: Memory at f6bf0000 (64-bit, prefetchable) [size=64K]
        Region 2: Memory at f6be0000 (64-bit, prefetchable) [size=64K]
        Region 4: Memory at f6bd0000 (64-bit, prefetchable) [size=64K]
        [virtual] Expansion ROM at f4000000 [disabled] [size=128K]
        Capabilities: [48] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
        Capabilities: [50] Vital Product Data
                Product Name: HP Ethernet 1Gb 4-port 331FLR Adapter
                Read-only fields:
                        [PN] Part number: 629133-001
                        [EC] Engineering changes: ECdate
                        [SN] Serial number: serial number
                        [V0] Vendor specific: PCIe x4 gen2, PW=5W
                        [V2] Vendor specific: MFG Date
                        [V4] Vendor specific: MAC address
                        [V5] Vendor specific: Rev A
                        [RV] Reserved: checksum good, 3 byte(s) reserved
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                Read/write fields:
                        [V1] Vendor specific: N/A
                        [V3] Vendor specific: FW ver 1.24
                        [V6] Vendor specific: PXE ver 15.0.12
                        [RW] Read-write area: 99 byte(s) free
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                End
        Capabilities: [58] MSI: Enable- Count=1/8 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [a0] MSI-X: Enable+ Count=17 Masked-
                Vector table: BAR=4 offset=00000000
                PBA: BAR=4 offset=00001000
        Capabilities: [ac] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 <64us
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr+ NoSnoop- FLReset-
                        MaxPayload 256 bytes, MaxReadReq 4096 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-
                LnkCap: Port #0, Speed 5GT/s, Width x4, ASPM L0s L1, Exit Latency L0s <1us, L1 <2us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 5GT/s, Width x4, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
                LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [100 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES+ TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap+ CGenEn- ChkCap+ ChkEn-
        Capabilities: [13c v1] Device Serial Number 00-00-d8-9d-67-15-36-e4
        Capabilities: [150 v1] Power Budgeting <?>
        Capabilities: [160 v1] Virtual Channel
                Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=Fixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
                        Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
                        Status: NegoPending- InProgress-
        Kernel driver in use: tg3
        Kernel modules: tg3
00: e4 14 57 16 46 04 10 00 01 00 00 02 10 00 80 00
10: 0c 00 bf f6 00 00 00 00 0c 00 be f6 00 00 00 00
20: 0c 00 bd f6 00 00 00 00 00 00 00 00 3c 10 9d 16
30: 00 00 00 00 48 00 00 00 00 00 00 00 05 01 00 00
40: 00 00 00 00 00 00 00 91 01 50 03 c8 08 20 00 64
50: 03 58 1c 83 00 00 00 78 05 a0 86 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 98 02 01 f0 81 00 38 00
70: b0 10 07 00 61 e1 45 78 00 00 00 00 00 00 00 00
80: e4 14 57 16 f8 00 00 80 00 00 00 00 59 01 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 05 04 00 00
a0: 11 ac 10 80 04 00 00 00 04 10 00 00 10 00 02 00
b0: 81 8d 00 10 26 54 10 00 42 cc 04 00 40 00 42 10
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 1f 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 01 90 71 05 00 00 00 00 00 3f 77 d6

0000:03:00.1 Ethernet controller [0200]: Broadcom Corporation NetXtreme BCM5719 Gigabit Ethernet PCIe [14e4:1657] (rev 01)
        DeviceName: NIC Port 2
        Subsystem: Hewlett-Packard Company Ethernet 1Gb 4-port 331FLR Adapter [103c:169d]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 52
        Region 0: Memory at f6bc0000 (64-bit, prefetchable) [size=64K]
        Region 2: Memory at f6bb0000 (64-bit, prefetchable) [size=64K]
        Region 4: Memory at f6ba0000 (64-bit, prefetchable) [size=64K]
        [virtual] Expansion ROM at f4020000 [disabled] [size=128K]
        Capabilities: [48] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
        Capabilities: [50] Vital Product Data
                Product Name: HP Ethernet 1Gb 4-port 331FLR Adapter
                Read-only fields:
                        [PN] Part number: 629133-001
                        [EC] Engineering changes: ECdate
                        [SN] Serial number: serial number
                        [V0] Vendor specific: PCIe x4 gen2, PW=5W
                        [V2] Vendor specific: MFG Date
                        [V4] Vendor specific: MAC address
                        [V5] Vendor specific: Rev A
                        [RV] Reserved: checksum good, 3 byte(s) reserved
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                Read/write fields:
                        [V1] Vendor specific: N/A
                        [V3] Vendor specific: FW ver 1.24
                        [V6] Vendor specific: PXE ver 15.0.12
                        [RW] Read-write area: 99 byte(s) free
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                End
        Capabilities: [58] MSI: Enable- Count=1/8 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [a0] MSI-X: Enable- Count=17 Masked-
                Vector table: BAR=4 offset=00000000
                PBA: BAR=4 offset=00001000
        Capabilities: [ac] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 <64us
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr+ NoSnoop+ FLReset-
                        MaxPayload 256 bytes, MaxReadReq 4096 bytes
                DevSta: CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr+ TransPend-
                LnkCap: Port #0, Speed 5GT/s, Width x4, ASPM L0s L1, Exit Latency L0s <1us, L1 <2us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 5GT/s, Width x4, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [100 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES+ TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap+ CGenEn- ChkCap+ ChkEn-
        Capabilities: [13c v1] Device Serial Number 00-00-d8-9d-67-15-36-e5
        Capabilities: [150 v1] Power Budgeting <?>
        Capabilities: [160 v1] Virtual Channel
                Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=Fixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
                        Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
                        Status: NegoPending- InProgress-
        Kernel driver in use: tg3
        Kernel modules: tg3
00: e4 14 57 16 46 00 10 00 01 00 00 02 10 00 80 00
10: 0c 00 bc f6 00 00 00 00 0c 00 bb f6 00 00 00 00
20: 0c 00 ba f6 00 00 00 00 00 00 00 00 3c 10 9d 16
30: 00 00 00 00 48 00 00 00 00 00 00 00 07 02 00 00
40: 00 00 00 00 00 00 00 00 01 50 03 c8 08 20 00 64
50: 03 58 1c 83 00 00 00 78 05 a0 86 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 9a 02 01 f0 00 00 38 00
70: b2 10 07 00 a8 15 a4 78 00 00 00 00 00 00 00 00
80: e4 14 57 16 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 11 ac 10 00 04 00 00 00 04 10 00 00 10 00 02 00
b0: 81 8d 00 10 36 5c 19 00 42 cc 04 00 40 00 42 10
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 1f 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 01 90 71 05 00 00 00 00 00 00 00 00

0000:03:00.2 Ethernet controller [0200]: Broadcom Corporation NetXtreme BCM5719 Gigabit Ethernet PCIe [14e4:1657] (rev 01)
        DeviceName: NIC Port 3
        Subsystem: Hewlett-Packard Company Ethernet 1Gb 4-port 331FLR Adapter [103c:169d]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 51
        Region 0: Memory at f6b90000 (64-bit, prefetchable) [size=64K]
        Region 2: Memory at f6b80000 (64-bit, prefetchable) [size=64K]
        Region 4: Memory at f6b70000 (64-bit, prefetchable) [size=64K]
        [virtual] Expansion ROM at f4040000 [disabled] [size=128K]
        Capabilities: [48] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
        Capabilities: [50] Vital Product Data
                Product Name: HP Ethernet 1Gb 4-port 331FLR Adapter
                Read-only fields:
                        [PN] Part number: 629133-001
                        [EC] Engineering changes: ECdate
                        [SN] Serial number: serial number
                        [V0] Vendor specific: PCIe x4 gen2, PW=5W
                        [V2] Vendor specific: MFG Date
                        [V4] Vendor specific: MAC address
                        [V5] Vendor specific: Rev A
                        [RV] Reserved: checksum good, 3 byte(s) reserved
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                Read/write fields:
                        [V1] Vendor specific: N/A
                        [V3] Vendor specific: FW ver 1.24
                        [V6] Vendor specific: PXE ver 15.0.12
                        [RW] Read-write area: 99 byte(s) free
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                End
        Capabilities: [58] MSI: Enable- Count=1/8 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [a0] MSI-X: Enable- Count=17 Masked-
                Vector table: BAR=4 offset=00000000
                PBA: BAR=4 offset=00001000
        Capabilities: [ac] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 <64us
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr+ NoSnoop+ FLReset-
                        MaxPayload 256 bytes, MaxReadReq 4096 bytes
                DevSta: CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr+ TransPend-
                LnkCap: Port #0, Speed 5GT/s, Width x4, ASPM L0s L1, Exit Latency L0s <1us, L1 <2us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 5GT/s, Width x4, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [100 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES+ TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap+ CGenEn- ChkCap+ ChkEn-
        Capabilities: [13c v1] Device Serial Number 00-00-d8-9d-67-15-36-e6
        Capabilities: [150 v1] Power Budgeting <?>
        Capabilities: [160 v1] Virtual Channel
                Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=Fixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
                        Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
                        Status: NegoPending- InProgress-
        Kernel driver in use: tg3
        Kernel modules: tg3
00: e4 14 57 16 46 00 10 00 01 00 00 02 10 00 80 00
10: 0c 00 b9 f6 00 00 00 00 0c 00 b8 f6 00 00 00 00
20: 0c 00 b7 f6 00 00 00 00 00 00 00 00 3c 10 9d 16
30: 00 00 00 00 48 00 00 00 00 00 00 00 05 01 00 00
40: 00 00 00 00 00 00 00 00 01 50 03 c8 08 20 00 64
50: 03 58 1c 83 00 00 00 78 05 a0 86 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 9a 02 01 f0 00 00 38 00
70: b2 10 07 00 d3 2b c0 bc 00 00 00 00 00 00 00 00
80: e4 14 57 16 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 11 ac 10 00 04 00 00 00 04 10 00 00 10 00 02 00
b0: 81 8d 00 10 36 5c 19 00 42 cc 04 00 40 00 42 10
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 1f 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 01 90 71 05 00 00 00 00 00 00 00 00

0000:03:00.3 Ethernet controller [0200]: Broadcom Corporation NetXtreme BCM5719 Gigabit Ethernet PCIe [14e4:1657] (rev 01)
        DeviceName: NIC Port 4
        Subsystem: Hewlett-Packard Company Ethernet 1Gb 4-port 331FLR Adapter [103c:169d]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 52
        Region 0: Memory at f6b60000 (64-bit, prefetchable) [size=64K]
        Region 2: Memory at f6b50000 (64-bit, prefetchable) [size=64K]
        Region 4: Memory at f6b40000 (64-bit, prefetchable) [size=64K]
        [virtual] Expansion ROM at f4060000 [disabled] [size=128K]
        Capabilities: [48] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
        Capabilities: [50] Vital Product Data
                Product Name: HP Ethernet 1Gb 4-port 331FLR Adapter
                Read-only fields:
                        [PN] Part number: 629133-001
                        [EC] Engineering changes: ECdate
                        [SN] Serial number: serial number
                        [V0] Vendor specific: PCIe x4 gen2, PW=5W
                        [V2] Vendor specific: MFG Date
                        [V4] Vendor specific: MAC address
                        [V5] Vendor specific: Rev A
                        [RV] Reserved: checksum good, 3 byte(s) reserved
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                Read/write fields:
                        [V1] Vendor specific: N/A
                        [V3] Vendor specific: FW ver 1.24
                        [V6] Vendor specific: PXE ver 15.0.12
                        [RW] Read-write area: 99 byte(s) free
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                        [] Unknown:
                End
        Capabilities: [58] MSI: Enable- Count=1/8 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [a0] MSI-X: Enable- Count=17 Masked-
                Vector table: BAR=4 offset=00000000
                PBA: BAR=4 offset=00001000
        Capabilities: [ac] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 <64us
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr+ NoSnoop+ FLReset-
                        MaxPayload 256 bytes, MaxReadReq 4096 bytes
                DevSta: CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr+ TransPend-
                LnkCap: Port #0, Speed 5GT/s, Width x4, ASPM L0s L1, Exit Latency L0s <1us, L1 <2us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 5GT/s, Width x4, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [100 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES+ TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap+ CGenEn- ChkCap+ ChkEn-
        Capabilities: [13c v1] Device Serial Number 00-00-d8-9d-67-15-36-e7
        Capabilities: [150 v1] Power Budgeting <?>
        Capabilities: [160 v1] Virtual Channel
                Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=Fixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
                        Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
                        Status: NegoPending- InProgress-
        Kernel driver in use: tg3
        Kernel modules: tg3
00: e4 14 57 16 46 00 10 00 01 00 00 02 10 00 80 00
10: 0c 00 b6 f6 00 00 00 00 0c 00 b5 f6 00 00 00 00
20: 0c 00 b4 f6 00 00 00 00 00 00 00 00 3c 10 9d 16
30: 00 00 00 00 48 00 00 00 00 00 00 00 07 02 00 00
40: 00 00 00 00 00 00 00 00 01 50 03 c8 08 20 00 64
50: 03 58 1c 83 00 00 00 78 05 a0 86 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 9a 02 01 f0 00 00 38 00
70: b2 10 07 00 92 f8 07 a6 00 00 00 00 00 00 00 00
80: e4 14 57 16 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 11 ac 10 00 04 00 00 00 04 10 00 00 10 00 02 00
b0: 81 8d 00 10 36 5c 19 00 42 cc 04 00 40 00 42 10
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 1f 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 01 90 71 05 00 00 00 00 00 00 00 00

0000:1f:08.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link 0 [8086:3c80] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 QPI Link 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 80 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 01 f8 96 08 00 00 38 00 00 fc 06 06 01 00 7f 00
50: 85 03 00 00 00 00 e1 00 00 00 00 00 00 00 00 00
60: 00 00 38 00 64 11 11 11 64 11 11 11 00 00 00 00
70: 81 03 00 00 80 00 20 00 00 00 01 00 00 00 ca ff
80: 2c 02 02 00 80 00 0e 00 02 00 00 00 80 04 00 00
90: 00 00 00 00 10 02 66 11 10 02 66 11 68 00 02 00
a0: e2 95 a0 13 81 f6 fc 0f 5e 93 3e 5e 2a e3 7c 00
b0: 00 00 00 00 00 00 00 00 89 08 78 00 f9 9c 68 00
c0: 06 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 04 00 00 00 00 00 00 00 00 68 42 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 30 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:08.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link Reut 0 [8086:3c83] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 QPI Link Reut 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
        Capabilities: [100 v0] Vendor Specific Information: ID=0001 Rev=0 Len=0f0 <?>
00: 86 80 83 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:08.4 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link Reut 0 [8086:3c84] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 QPI Link Reut 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 84 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:09.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link 1 [8086:3c90] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 QPI Link 1 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 90 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 01 f8 96 08 00 00 38 00 00 fc 06 06 00 00 7f 00
50: 85 03 00 00 00 00 e1 00 00 00 00 00 00 00 00 00
60: 00 00 38 00 64 11 11 11 64 11 11 11 00 00 00 00
70: 81 03 00 00 80 00 20 00 00 00 01 00 00 00 ca ff
80: 2c 02 02 00 80 00 0e 00 02 00 00 00 cd 04 00 00
90: 00 00 00 00 10 02 66 11 10 02 66 11 68 00 02 00
a0: 76 43 a0 10 5b e4 37 0d fc 96 46 5e 88 69 15 00
b0: 00 00 00 00 00 00 00 00 65 b5 6b 00 a7 18 78 00
c0: 06 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 30 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:09.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link Reut 1 [8086:3c93] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 QPI Link Reut 1 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
        Capabilities: [100 v0] Vendor Specific Information: ID=0001 Rev=0 Len=0f0 <?>
00: 86 80 93 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:09.4 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link Reut 1 [8086:3c94] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 QPI Link Reut 1 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 94 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0a.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Power Control Unit 0 [8086:3cc0] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Power Control Unit 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 c0 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 c7 f3 7f 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 8d 52 9c 0c
80: 00 00 00 00 f8 02 70 01 b0 04 2f 00 03 10 0a 00
90: ce 9d e4 1b 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 17 01 64 00 0c 00 00
b0: 00 00 00 00 05 b0 79 85 3a 6b 6e be 1d a9 1f c2
c0: 00 00 00 00 00 00 00 00 25 00 00 00 25 00 00 00
d0: 00 00 00 00 56 cd 57 82 ff 00 00 00 00 00 00 00
e0: 00 00 00 00 00 0a 5b 00 f8 82 5a 00 90 83 06 80
f0: 00 00 00 80 00 00 00 00 60 06 00 00 94 14 14 00

0000:1f:0a.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Power Control Unit 1 [8086:3cc1] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Power Control Unit 1 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 c1 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 32 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 cd 00 00 00
90: 00 00 00 00 1e 1e 00 00 0a 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ff ff
b0: 0e 31 00 14 00 00 00 00 1a 00 00 00 00 00 00 00
c0: 10 00 fa 00 00 b1 1d 80 a8 2f 40 06 00 00 00 00
d0: 00 00 00 00 7e 78 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0a.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Power Control Unit 2 [8086:3cc2] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Power Control Unit 2 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 c2 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 1f 00 80 00 00 00 00 00 00 00 00 00 00 00 00
50: a8 2f 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 04 00 00 00
70: 10 00 00 30 00 00 00 00 00 00 00 00 00 00 00 03
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 18 01 78 00 58 02 2f 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 80 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 83 44 02 7d dd 94 58 0c 00 00 00 00
f0: 50 14 00 04 50 14 00 04 00 00 00 00 ff ff ff ff

0000:1f:0a.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Power Control Unit 3 [8086:3cd0] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Power Control Unit 3 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 d0 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 00 00 00 00
40: c0 00 00 00 c0 00 02 00 c0 4b 02 00 c0 40 02 00
50: e0 44 02 00 40 07 02 00 60 07 02 00 40 85 02 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 09 00 18 01 84 61 18 48 81 02 00 18 00 00 00 3a
90: 00 08 00 10 7e 00 00 20 00 00 00 00 00 00 00 00
a0: 00 17 01 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 3f 03 3f 01 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 20 00 00 a8 01 04 00 00 00 00 00

0000:1f:0b.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Interrupt Control Registers [8086:3ce0] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Interrupt Control Registers [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e0 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 03 00 00 80 01 00 00 00 00 00 00 00
50: 02 00 00 00 08 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0b.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Semaphore and Scratchpad Configuration Registers [8086:3ce3] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Semaphore and Scratchpad Configuration Registers [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e3 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 82 0f 00 00 12 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 e3 06 c0 00
60: 30 02 03 00 00 00 00 00 03 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 bf
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 23 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 04 00 00 00 00 00 00 00
b0: c0 00 00 00 c0 00 02 00 c0 4b 02 00 c0 40 02 00
c0: c0 44 02 00 40 07 02 00 60 07 02 00 40 85 02 00
d0: 00 1f 00 80 00 00 00 00 40 1f 00 01 00 00 00 00
e0: ff ff ff ff ff ff ff ff 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0c.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Unicast Register 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e8 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 80 01 c0 00 00 00 00 00 c0 01 00 01 00 00 00 00
50: 00 08 00 00 85 20 00 80 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 40 00 00 00 00 00 00 00 ff ff 00 00 01 00 00 00
90: 00 00 00 00 3a 07 00 00 03 00 6b 93 2b 00 48 fe
a0: 01 00 04 00 00 00 00 00 07 00 07 00 00 00 00 00
b0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 01 00 04 00 00 00 00 00 07 00 07 00 00 00 00 00
d0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0c.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Unicast Register 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e8 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 80 01 c0 00 00 00 00 00 c0 01 00 01 00 00 00 00
50: 00 08 00 00 85 20 00 80 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 40 00 00 00 00 00 00 00 ff ff 00 00 01 00 00 00
90: 00 00 00 00 3a 07 00 00 03 00 dd bf 2b 00 48 fe
a0: 1b 00 12 00 00 00 00 00 21 00 15 00 00 00 00 00
b0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 1b 00 12 00 00 00 00 00 21 00 15 00 00 00 00 00
d0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0c.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Unicast Register 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e8 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 80 01 c0 00 00 00 00 00 c0 01 00 01 00 00 00 00
50: 00 08 00 00 85 20 00 80 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 40 00 00 00 00 00 00 00 ff ff 00 00 01 00 00 00
90: 00 00 00 00 3a 07 00 00 03 00 c8 85 2b 00 48 fe
a0: 3a 00 20 00 00 00 00 00 00 02 23 00 00 00 00 00
b0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 3a 00 20 00 00 00 00 00 00 02 23 00 00 00 00 00
d0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0c.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 0 [8086:3cf4] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 f4 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 30 33 33 33 33 33 33 00 00 00 00 00 02 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: c3 83 00 00 00 00 00 00 c3 03 01 00 09 09 09 09
90: c2 03 01 00 00 00 00 00 c2 03 01 00 00 00 00 00
a0: c2 03 01 00 00 00 00 00 c2 03 01 00 00 00 00 00
b0: c2 03 01 00 00 00 00 00 c2 03 01 00 00 00 00 00
c0: c2 03 01 00 00 00 00 00 c2 03 01 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0c.7 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 System Address Decoder [8086:3cf6] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 System Address Decoder [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 f6 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 80 a5 bf 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 0c 00 00 00 20 08 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0d.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Unicast Register 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e8 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 80 01 c0 00 00 00 00 00 c0 01 00 01 00 00 00 00
50: 22 08 00 00 28 24 00 80 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 40 00 00 00 00 00 00 00 ff ff 00 00 01 00 00 00
90: 00 00 00 00 3a 07 00 00 03 00 6d 7e 2b 00 48 fe
a0: 0e 00 0b 00 00 00 00 00 14 00 0e 00 00 00 00 00
b0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 0e 00 0b 00 00 00 00 00 14 00 0e 00 00 00 00 00
d0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0d.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Unicast Register 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e8 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 80 01 c0 00 00 00 00 00 c0 01 00 01 00 00 00 00
50: 22 08 00 00 28 24 00 80 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 40 00 00 00 00 00 00 00 ff ff 00 00 01 00 00 00
90: 00 00 00 00 3a 07 00 00 03 00 66 a5 2b 00 48 fe
a0: 28 00 19 00 00 00 00 00 2e 00 1c 00 00 00 00 00
b0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 28 00 19 00 00 00 00 00 2e 00 1c 00 00 00 00 00
d0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0d.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Unicast Register 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e8 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 40 01 c0 00 00 00 00 00 00 02 00 01 00 00 00 00
50: 22 08 00 00 28 24 00 80 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 40 00 00 00 00 00 00 00 ff ff 00 00 01 00 00 00
90: 00 00 00 00 3a 07 00 00 03 00 94 e1 2b 00 48 fe
a0: 35 00 27 00 00 00 00 00 07 02 2a 00 00 00 00 00
b0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 35 00 27 00 00 00 00 00 07 02 2a 00 00 00 00 00
d0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0d.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 1 [8086:3cf5] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 1 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 f5 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 08 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 7b 00 00 f4 00 00 00 00 7d 00 00 f8 00 00 00 00
90: 00 00 00 00 00 00 00 00 7e 00 00 fc 00 00 00 00
a0: 00 00 1e 7c 00 00 00 00 40 00 1e fc 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 01 00 00 c0 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 90 24 00 08 00 00 00 08 80 00 00 40 02 00 00
f0: 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0e.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Processor Home Agent [8086:3ca0] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Processor Home Agent [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Kernel driver in use: sbridge_edac
        Kernel modules: sb_edac
00: 86 80 a0 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: e4 f3 02 00 e4 f3 10 00 04 f1 20 00 00 f0 20 00
50: 00 f0 20 00 00 f0 20 00 00 f0 20 00 00 f0 20 00
60: 00 f0 20 00 00 f0 20 00 00 f0 20 00 00 f0 20 00
70: 00 00 02 00 80 ee 0e 00 00 00 88 44 00 00 00 00
80: 02 80 00 03 98 0b 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 01 00 00 08 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0e.1 Performance counters [1101]: Intel Corporation Xeon E5/Core i7 Processor Home Agent Performance Monitoring [8086:3c46] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Processor Home Agent Performance Monitoring [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Kernel driver in use: snbep_uncore
00: 86 80 46 3c 00 00 00 00 07 00 01 11 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00

0000:1f:0f.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Registers [8086:3ca8] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Registers [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 a8 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 04 01 00 00
80: e4 f3 02 00 e4 f3 10 00 04 f1 20 00 00 f0 20 00
90: 00 f0 20 00 00 f0 20 00 00 f0 20 00 00 f0 20 00
a0: 00 f0 20 00 00 f0 20 00 00 f0 20 00 00 f0 20 00
b0: 00 00 00 00 8e 01 00 00 00 00 00 00 00 00 00 00
c0: 4c 04 01 00 00 00 00 00 00 08 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0f.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller RAS Registers [8086:3c71] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller RAS Registers [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 71 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 0d 6e 07 00 00 00 00 00
a0: f1 44 03 84 ba e6 00 00 80 0c 20 03 00 00 00 00
b0: 00 00 00 00 00 80 00 00 68 0a 00 00 00 00 00 00
c0: 2e 4d 1b 09 00 00 00 00 00 00 00 00 00 00 00 00
d0: 56 63 01 20 c0 02 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0f.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 0 [8086:3caa] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 aa 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 0d 40 0e 00 0d 50 0c 00 00 00 0f 00 00 00 00 00
90: 00 00 00 00 00 04 00 00 00 24 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0f.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 1 [8086:3cab] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 1 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 ab 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 0d 40 0e 00 0d 50 0c 00 00 00 0f 00 00 00 00 00
90: 00 00 00 00 00 04 00 00 00 24 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0f.4 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 2 [8086:3cac] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 2 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 ac 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 0d 40 0e 00 00 00 0f 00 00 00 0f 00 00 00 00 00
90: 00 00 00 00 00 04 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0f.5 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 3 [8086:3cad] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 3 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 ad 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 0d 40 0e 00 00 00 0f 00 00 00 0f 00 00 00 00 00
90: 00 00 00 00 00 04 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:0f.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 4 [8086:3cae] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 4 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 ae 3c 10 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:10.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 0 [8086:3cb0] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
        Kernel driver in use: snbep_uncore
00: 86 80 b0 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00

0000:1f:10.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 1 [8086:3cb1] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 1 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
        Kernel driver in use: snbep_uncore
00: 86 80 b1 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00

0000:1f:10.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 0 [8086:3cb2] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 b2 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 25 0b 0b 0b 0b 0b 0b 0b 00 00 00 00 05 00 00 00
90: 0d 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 80 80 1f 00 00 00 00 00 20 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:10.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 1 [8086:3cb3] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 1 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 b3 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 23 0b 0b 0b 0b 0b 0b 0b 00 00 00 00 04 00 00 00
90: 0d 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 80 80 1f 00 00 00 00 00 20 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:10.4 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 2 [8086:3cb4] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 2 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
        Kernel driver in use: snbep_uncore
00: 86 80 b4 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00

0000:1f:10.5 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 3 [8086:3cb5] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 3 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
        Kernel driver in use: snbep_uncore
00: 86 80 b5 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00

0000:1f:10.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 2 [8086:3cb6] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 2 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 b6 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 25 0b 0b 0b 25 25 0b 0b 00 00 00 00 05 00 55 00
90: 0d 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 80 80 1f 00 00 00 00 00 20 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:10.7 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 3 [8086:3cb7] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 3 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 b7 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 23 0b 0b 0b 23 23 0b 0b 00 00 00 00 04 00 44 00
90: 0d 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 80 80 1f 00 00 00 00 00 20 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:11.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DDRIO [8086:3cb8] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DDRIO [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 b8 3c 10 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:13.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 R2PCIe [8086:3ce4] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 R2PCIe [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e4 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 7a 17 7f 03 01 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:13.1 Performance counters [1101]: Intel Corporation Xeon E5/Core i7 Ring to PCI Express Performance Monitor [8086:3c43] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Ring to PCI Express Performance Monitor [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Kernel driver in use: snbep_uncore
00: 86 80 43 3c 00 00 00 00 07 00 01 11 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00

0000:1f:13.4 Performance counters [1101]: Intel Corporation Xeon E5/Core i7 QuickPath Interconnect Agent Ring Registers [8086:3ce6] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 QuickPath Interconnect Agent Ring Registers [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e6 3c 00 00 00 00 07 00 01 11 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 50 01 50 01 50 01 50 01 00 00 00 00
50: 02 21 00 00 02 21 00 00 10 01 00 00 10 01 00 00
60: 01 00 00 00 00 00 00 00 00 00 00 00 30 24 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 bd 96 00 00 00 00 00 00
90: 00 0c 3c 00 00 00 00 00 12 00 00 00 00 00 00 00
a0: 0e 08 0e 10 10 08 10 10 00 00 00 00 06 06 01 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: ff ff ff ff 00 00 00 00 00 00 00 00 00 00 00 00
d0: ff ff ff ff 00 00 00 00 00 00 00 00 64 11 11 11
e0: 64 11 11 11 04 00 00 00 00 00 1d 0c 02 00 cf 0f
f0: 03 00 3a 3a 00 00 00 00 00 00 00 00 00 00 00 00

0000:1f:13.5 Performance counters [1101]: Intel Corporation Xeon E5/Core i7 Ring to QuickPath Interconnect Link 0 Performance Monitor [8086:3c44] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Ring to QuickPath Interconnect Link 0 Performance Monitor [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Kernel driver in use: snbep_uncore
00: 86 80 44 3c 00 00 00 00 07 00 01 11 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00

0000:1f:13.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Ring to QuickPath Interconnect Link 1 Performance Monitor [8086:3c45] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Ring to QuickPath Interconnect Link 1 Performance Monitor [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Kernel driver in use: snbep_uncore
00: 86 80 45 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00

0000:20:00.0 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 DMI2 in PCI Express Mode [8086:3c01] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Interrupt: pin A routed to IRQ 25
        Bus: primary=20, secondary=2b, subordinate=2b, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMI2 in PCI Express Mode [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible-
                RootCap: CRSVisible-
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis+, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 01 3c 40 01 10 00 07 00 04 06 00 00 01 00
10: 00 00 00 00 00 00 00 00 20 2b 2b 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 00 80 00 00 06 00 00 00 41 78 7a 00
a0: 00 00 01 10 00 00 00 00 c0 07 48 00 06 00 00 00
b0: 00 00 00 00 1e 10 00 00 10 00 00 00 06 00 00 00
c0: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:01.0 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 1a [8086:3c02] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 25
        Bus: primary=20, secondary=21, subordinate=21, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 1a [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 02 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 20 21 21 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 43 78 7a 00
a0: 00 00 01 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:01.1 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 1b [8086:3c03] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 25
        Bus: primary=20, secondary=22, subordinate=22, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 1b [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 03 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 20 22 22 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 43 78 7a 00
a0: 00 00 01 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:02.0 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2a [8086:3c04] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 25
        Bus: primary=20, secondary=23, subordinate=23, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 2a [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 04 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 20 23 23 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 43 78 7a 00
a0: 00 00 01 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:02.1 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2b [8086:3c05] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 25
        Bus: primary=20, secondary=24, subordinate=24, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 2b [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 05 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 20 24 24 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 43 78 7a 00
a0: 00 00 01 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:02.2 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2c [8086:3c06] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 25
        Bus: primary=20, secondary=25, subordinate=25, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 2c [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 06 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 20 25 25 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 43 78 5a 00
a0: 00 00 01 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:02.3 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 2d [8086:3c07] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 25
        Bus: primary=20, secondary=26, subordinate=26, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 2d [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 07 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 20 26 26 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 43 78 5a 00
a0: 00 00 01 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:03.0 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3a in PCI Express Mode [8086:3c08] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 25
        Bus: primary=20, secondary=27, subordinate=27, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 3a in PCI Express Mode [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag+ RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 08 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 20 27 27 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 21 80 00 00 26 00 00 00 43 78 7a 00
a0: 00 00 01 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:03.1 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3b [8086:3c09] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 25
        Bus: primary=20, secondary=28, subordinate=28, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 3b [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 09 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 20 28 28 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 43 78 7a 00
a0: 00 00 01 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:03.2 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3c [8086:3c0a] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 25
        Bus: primary=20, secondary=29, subordinate=29, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 3c [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 0a 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 20 29 29 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 43 78 5a 00
a0: 00 00 01 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:03.3 PCI bridge [0604]: Intel Corporation Xeon E5/Core i7 IIO PCI Express Root Port 3d [8086:3c0b] (rev 07) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 25
        Bus: primary=20, secondary=2a, subordinate=2a, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: fff00000-000fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Subsystem: Hewlett-Packard Company Xeon E5/Core i7 IIO PCI Express Root Port 3d [103c:18a8]
        Capabilities: [60] MSI: Enable- Count=1/2 Maskable+ 64bit-
                Address: 00000000  Data: 0000
                Masking: 00000000  Pending: 00000000
        Capabilities: [90] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L0s unlimited, L1 <16us
                        ClockPM- Surprise+ LLActRep+ BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible+
                RootCap: CRSVisible+
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BCD, TimeoutDis+, LTR-, OBFF Not Supported ARIFwd+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
        Capabilities: [110 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [148 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UESvrt: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
        Capabilities: [250 v1] #19
        Capabilities: [280 v1] Vendor Specific Information: ID=0004 Rev=2 Len=018 <?>
        Kernel driver in use: pcieport
        Kernel modules: shpchp
00: 86 80 0b 3c 47 01 10 00 07 00 04 06 10 00 81 00
10: 00 00 00 00 00 00 00 00 20 2a 2a 00 f0 00 00 00
20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 03 00
40: 0d 60 00 00 3c 10 a8 18 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 05 90 02 01 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 10 e0 42 00 01 80 00 00 26 00 00 00 43 78 5a 00
a0: 00 00 01 10 00 00 00 00 c0 07 48 00 16 00 01 00
b0: 00 00 00 00 3e 10 00 00 00 00 00 00 0e 00 00 00
c0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:04.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 0 [8086:3c20] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMA Channel 0 [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 5
        Region 0: Memory at fbff0000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [80] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00003000
        Capabilities: [90] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ioatdma
        Kernel modules: ioatdma
00: 86 80 20 3c 06 04 10 00 07 00 80 08 10 00 80 00
10: 04 00 ff fb 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 05 01 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 0f 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 11 90 00 80 00 20 00 00 00 30 00 00 00 00 00 00
90: 10 e0 92 00 00 80 00 00 00 08 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:04.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 1 [8086:3c21] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMA Channel 1 [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 7
        Region 0: Memory at fbfe0000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [80] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00003000
        Capabilities: [90] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ioatdma
        Kernel modules: ioatdma
00: 86 80 21 3c 06 04 10 00 07 00 80 08 10 00 80 00
10: 04 00 fe fb 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 07 02 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 11 90 00 80 00 20 00 00 00 30 00 00 00 00 00 00
90: 10 e0 92 00 00 80 00 00 00 08 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:04.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 2 [8086:3c22] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMA Channel 2 [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin C routed to IRQ 10
        Region 0: Memory at fbfd0000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [80] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00003000
        Capabilities: [90] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ioatdma
        Kernel modules: ioatdma
00: 86 80 22 3c 06 04 10 00 07 00 80 08 10 00 80 00
10: 04 00 fd fb 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 0a 03 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 11 90 00 80 00 20 00 00 00 30 00 00 00 00 00 00
90: 10 e0 92 00 00 80 00 00 00 08 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:04.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 3 [8086:3c23] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMA Channel 3 [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin D routed to IRQ 10
        Region 0: Memory at fbfc0000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [80] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00003000
        Capabilities: [90] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ioatdma
        Kernel modules: ioatdma
00: 86 80 23 3c 06 04 10 00 07 00 80 08 10 00 80 00
10: 04 00 fc fb 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 0a 04 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 11 90 00 80 00 20 00 00 00 30 00 00 00 00 00 00
90: 10 e0 92 00 00 80 00 00 00 08 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:04.4 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 4 [8086:3c24] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMA Channel 4 [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 5
        Region 0: Memory at fbfb0000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [80] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00003000
        Capabilities: [90] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ioatdma
        Kernel modules: ioatdma
00: 86 80 24 3c 06 04 10 00 07 00 80 08 10 00 80 00
10: 04 00 fb fb 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 05 01 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 11 90 00 80 00 20 00 00 00 30 00 00 00 00 00 00
90: 10 e0 92 00 00 80 00 00 00 08 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:04.5 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 5 [8086:3c25] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMA Channel 5 [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 7
        Region 0: Memory at fbfa0000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [80] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00003000
        Capabilities: [90] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ioatdma
        Kernel modules: ioatdma
00: 86 80 25 3c 06 04 10 00 07 00 80 08 10 00 80 00
10: 04 00 fa fb 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 07 02 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 11 90 00 80 00 20 00 00 00 30 00 00 00 00 00 00
90: 10 e0 92 00 00 80 00 00 00 08 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:04.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 6 [8086:3c26] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMA Channel 6 [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin C routed to IRQ 10
        Region 0: Memory at fbf90000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [80] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00003000
        Capabilities: [90] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ioatdma
        Kernel modules: ioatdma
00: 86 80 26 3c 06 04 10 00 07 00 80 08 10 00 80 00
10: 04 00 f9 fb 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 0a 03 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 11 90 00 80 00 20 00 00 00 30 00 00 00 00 00 00
90: 10 e0 92 00 00 80 00 00 00 08 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:04.7 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DMA Channel 7 [8086:3c27] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DMA Channel 7 [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin D routed to IRQ 10
        Region 0: Memory at fbf80000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [80] MSI-X: Enable+ Count=1 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00003000
        Capabilities: [90] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
        Capabilities: [e0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ioatdma
        Kernel modules: ioatdma
00: 86 80 27 3c 06 04 10 00 07 00 80 08 10 00 80 00
10: 04 00 f8 fb 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 0a 04 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 11 90 00 80 00 20 00 00 00 30 00 00 00 00 00 00
90: 10 e0 92 00 00 80 00 00 00 08 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 10 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:05.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Address Map, VTd_Misc, System Management [8086:3c28] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Address Map, VTd_Misc, System Management [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
00: 86 80 28 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 92 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 c0 00 00 00 cc 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 be 00 00 f0 be
b0: 00 00 ff ff ff ff 07 00 00 00 00 00 00 00 00 00
c0: 00 00 ff ff ff ff 07 00 00 00 00 00 00 00 00 00
d0: 00 00 00 bc 00 00 00 3c 10 00 00 00 00 00 00 00
e0: 00 00 00 fc ff ff ff ff 00 00 00 00 00 00 00 00
f0: 00 00 f8 ff ff ff ff ff 00 00 00 00 00 00 00 00

0000:20:05.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Control Status and Global Errors [8086:3c2a] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Control Status and Global Errors [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 4096 bytes
                DevSta: CorrErr+ UncorrErr+ FatalErr+ UnsuppReq- AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
00: 86 80 2a 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 92 00 00 00 00 00 06 50 07 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 50 01 20 28 00 00 00 00 00 00 00 00 65 15 00 00
90: 00 00 00 00 15 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 2a 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 c4 09 96 1e
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:20:05.4 PIC [0800]: Intel Corporation Xeon E5/Core i7 I/O APIC [8086:3c2c] (rev 07) (prog-if 20 [IO(X)-APIC])
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 I/O APIC [103c:18a8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Region 0: Memory at fbf70000 (32-bit, non-prefetchable) [size=4K]
        Capabilities: [6c] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
00: 86 80 2c 3c 06 00 10 00 07 20 00 08 10 00 80 00
10: 00 00 f7 fb 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 6c 00 00 00 00 00 00 00 00 00 00 00
40: 00 84 00 00 10 e0 91 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 01 00 03 00
70: 08 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 01 00 03 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:08.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link 0 [8086:3c80] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 QPI Link 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 80 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 01 f8 96 08 00 00 18 00 00 fc 06 06 01 00 7f 00
50: 85 03 00 00 00 00 00 f3 00 00 00 00 00 00 00 00
60: 00 00 18 00 64 11 11 11 64 11 11 11 00 00 00 00
70: 81 03 00 00 80 00 20 00 00 00 01 00 00 00 ca ff
80: 2c 02 02 00 60 00 e0 00 02 00 00 00 8f 04 00 00
90: 00 00 00 00 10 02 66 11 10 02 66 11 86 00 20 00
a0: 3a 55 4c 0d c6 2e a0 10 85 45 f6 5e 44 b6 6b 00
b0: 00 00 00 00 00 00 00 00 11 bc 70 00 43 7b 1f 00
c0: 06 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 04 00 00 00 00 00 00 00 00 68 42 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 30 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:08.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link Reut 0 [8086:3c83] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 QPI Link Reut 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
        Capabilities: [100 v0] Vendor Specific Information: ID=0001 Rev=0 Len=0f0 <?>
00: 86 80 83 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:08.4 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link Reut 0 [8086:3c84] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 QPI Link Reut 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 84 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:09.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link 1 [8086:3c90] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 QPI Link 1 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 90 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 01 f8 96 08 00 00 18 00 00 fc 06 06 00 00 7f 00
50: 85 03 00 00 00 00 00 f3 00 00 00 00 00 00 00 00
60: 00 00 18 00 64 11 11 11 64 11 11 11 00 00 00 00
70: 81 03 00 00 80 00 20 00 00 00 01 00 00 00 ca ff
80: 2c 02 02 00 60 00 e0 00 02 00 00 00 8f 04 00 00
90: 00 00 00 00 10 02 66 11 10 02 66 11 86 00 20 00
a0: 82 f2 30 10 82 6b 95 13 e8 68 fa 5e 0c 8a 4c 00
b0: 00 00 00 00 00 00 00 00 8f 91 79 00 cd 14 44 00
c0: 06 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 30 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:09.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link Reut 1 [8086:3c93] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 QPI Link Reut 1 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
        Capabilities: [100 v0] Vendor Specific Information: ID=0001 Rev=0 Len=0f0 <?>
00: 86 80 93 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:09.4 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 QPI Link Reut 1 [8086:3c94] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 QPI Link Reut 1 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 94 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0a.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Power Control Unit 0 [8086:3cc0] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Power Control Unit 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 c0 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 c7 f3 7f 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 71 ae 9d 06
80: 00 00 00 00 f8 02 70 01 b0 04 2f 00 03 10 0a 00
90: 81 6c bd 15 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 17 01 64 00 0c 00 00
b0: 00 00 00 00 2b 4c ec bf 5f 12 d8 e7 32 c1 02 fe
c0: 00 00 00 00 00 00 00 00 23 00 00 00 23 00 00 00
d0: 00 00 00 00 36 ab 7f 82 ff 00 00 00 00 00 00 00
e0: 00 00 00 00 00 0a 5b 00 f8 82 5a 00 90 83 06 80
f0: 00 00 00 80 00 00 00 00 60 06 00 00 94 14 14 00

0000:3f:0a.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Power Control Unit 1 [8086:3cc1] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Power Control Unit 1 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 c1 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 32 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 cc 00 00 00
90: 00 00 00 00 1e 1e 00 00 0a 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ff ff
b0: 0e 31 00 14 00 00 00 00 1a 00 00 00 00 00 00 00
c0: 10 00 fa 00 00 b1 1d 80 a8 2f 40 06 00 00 00 00
d0: 00 00 00 00 7e 78 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0a.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Power Control Unit 2 [8086:3cc2] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Power Control Unit 2 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 c2 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 20 3f 00 80 00 00 00 00 00 00 00 00 00 00 00 00
50: a8 2f 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00
70: 10 00 00 30 00 00 00 00 00 00 00 00 00 00 00 03
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 18 01 78 00 58 02 2f 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 80 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 83 44 02 7d dd 94 58 0c 00 00 00 00
f0: 50 14 00 04 50 14 00 04 00 00 00 00 ff ff ff ff

0000:3f:0a.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Power Control Unit 3 [8086:3cd0] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Power Control Unit 3 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 d0 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 80 00 00 00 00 00 00 00 00 00 00 00
40: c0 00 00 00 c0 00 02 00 c0 4b 02 00 c0 40 02 00
50: e0 44 02 00 40 07 02 00 60 07 02 00 40 85 02 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 09 00 18 01 84 61 18 48 81 02 00 18 00 00 00 3a
90: 00 08 00 10 7e 00 00 20 00 00 00 00 00 00 00 00
a0: 00 17 01 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 3f 03 3f 01 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 20 00 00 a8 01 04 00 00 00 00 00

0000:3f:0b.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Interrupt Control Registers [8086:3ce0] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Interrupt Control Registers [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e0 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 01 00 00 00 03 00 00 80 01 00 00 00 00 00 00 00
50: 02 00 00 00 08 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0b.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Semaphore and Scratchpad Configuration Registers [8086:3ce3] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Semaphore and Scratchpad Configuration Registers [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e3 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 02 00 00 00 02 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 e3 06 c0 00
60: 30 02 03 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ba
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 b2 09 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: c0 00 00 00 c0 00 02 00 c0 4b 02 00 c0 40 02 00
c0: c0 44 02 00 40 07 02 00 60 07 02 00 40 85 02 00
d0: 20 3f 00 80 00 00 00 00 40 1f 00 01 00 00 00 00
e0: ff ff ff ff ff ff ff ff 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0c.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Unicast Register 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e8 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: c0 00 80 01 00 00 00 00 00 01 c0 01 00 00 00 00
50: 11 00 00 00 28 24 00 80 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 40 00 00 00 00 00 00 00 ff ff 00 00 01 00 00 00
90: 00 00 00 00 3a 07 00 00 03 00 10 18 2b 00 48 fe
a0: 04 00 01 00 00 00 00 00 07 00 07 00 00 00 00 00
b0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 04 00 01 00 00 00 00 00 07 00 07 00 00 00 00 00
d0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0c.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Unicast Register 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e8 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: c0 00 80 01 00 00 00 00 00 01 c0 01 00 00 00 00
50: 11 00 00 00 28 24 00 80 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 40 00 00 00 00 00 00 00 ff ff 00 00 01 00 00 00
90: 00 00 00 00 3a 07 00 00 03 00 5e e0 2b 00 48 fe
a0: 12 00 1b 00 00 00 00 00 15 00 21 00 00 00 00 00
b0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 12 00 1b 00 00 00 00 00 15 00 21 00 00 00 00 00
d0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0c.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Unicast Register 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e8 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: c0 00 80 01 00 00 00 00 00 01 c0 01 00 00 00 00
50: 11 00 00 00 28 24 00 80 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 40 00 00 00 00 00 00 00 ff ff 00 00 01 00 00 00
90: 00 00 00 00 3a 07 00 00 03 00 22 b9 2b 00 48 fe
a0: 20 00 3a 00 00 00 00 00 23 00 00 02 00 00 00 00
b0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 20 00 3a 00 00 00 00 00 23 00 00 02 00 00 00 00
d0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0c.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 0 [8086:3cf4] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 f4 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 30 33 33 33 33 33 33 00 00 00 00 00 02 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: c3 83 00 00 00 00 00 00 c3 03 01 00 09 09 09 09
90: c2 03 01 00 00 00 00 00 c2 03 01 00 00 00 00 00
a0: c2 03 01 00 00 00 00 00 c2 03 01 00 00 00 00 00
b0: c2 03 01 00 00 00 00 00 c2 03 01 00 00 00 00 00
c0: c2 03 01 00 00 00 00 00 c2 03 01 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0c.7 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 System Address Decoder [8086:3cf6] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 System Address Decoder [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 f6 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 80 a5 bf 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 0c 00 00 00 20 08 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0d.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Unicast Register 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e8 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: c0 00 80 01 00 00 00 00 00 01 c0 01 00 00 00 00
50: 00 00 00 00 85 20 00 80 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 40 00 00 00 00 00 00 00 ff ff 00 00 01 00 00 00
90: 00 00 00 00 3a 07 00 00 03 00 19 fa 2b 00 48 fe
a0: 0b 00 0e 00 00 00 00 00 0e 00 14 00 00 00 00 00
b0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 0b 00 0e 00 00 00 00 00 0e 00 14 00 00 00 00 00
d0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0d.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Unicast Register 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e8 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: c0 00 80 01 00 00 00 00 00 01 c0 01 00 00 00 00
50: 00 00 00 00 85 20 00 80 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 40 00 00 00 00 00 00 00 ff ff 00 00 01 00 00 00
90: 00 00 00 00 3a 07 00 00 03 00 fd d2 2b 00 48 fe
a0: 19 00 28 00 00 00 00 00 1c 00 2e 00 00 00 00 00
b0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 19 00 28 00 00 00 00 00 1c 00 2e 00 00 00 00 00
d0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0d.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Unicast Register 0 [8086:3ce8] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Unicast Register 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e8 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: c0 00 40 01 00 00 00 00 00 01 00 02 00 00 00 00
50: 00 00 00 00 85 20 00 80 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 40 00 00 00 00 00 00 00 ff ff 00 00 01 00 00 00
90: 00 00 00 00 3a 07 00 00 03 00 5a ad 2b 00 48 fe
a0: 27 00 35 00 00 00 00 00 2a 00 07 02 00 00 00 00
b0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 27 00 35 00 00 00 00 00 2a 00 07 02 00 00 00 00
d0: 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0d.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 1 [8086:3cf5] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller System Address Decoder 1 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 f5 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 08 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 7b 00 00 f4 00 00 00 00 7d 00 00 f8 00 00 00 00
90: 00 00 00 00 00 00 00 00 7e 00 00 fc 00 00 00 00
a0: 00 00 1e 7c 00 00 00 00 40 00 1e fc 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 01 00 00 c0 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 90 24 00 08 00 00 00 08 80 00 00 40 02 00 00
f0: 00 12 00 00 01 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0e.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Processor Home Agent [8086:3ca0] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Processor Home Agent [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Kernel modules: sb_edac
00: 86 80 a0 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: e4 f3 30 00 04 f1 40 00 00 f0 40 00 00 f0 40 00
50: 00 f0 40 00 00 f0 40 00 00 f0 40 00 00 f0 40 00
60: 00 f0 40 00 00 f0 40 00 00 f0 40 00 00 f0 40 00
70: 00 00 02 00 60 ee ee 00 00 00 88 44 00 00 00 00
80: 02 80 00 03 98 0b 00 00 00 00 00 00 00 00 00 00
90: 10 00 00 20 00 01 00 00 08 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0e.1 Performance counters [1101]: Intel Corporation Xeon E5/Core i7 Processor Home Agent Performance Monitoring [8086:3c46] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Processor Home Agent Performance Monitoring [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Kernel driver in use: snbep_uncore
00: 86 80 46 3c 00 00 00 00 07 00 01 11 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00

0000:3f:0f.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Registers [8086:3ca8] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Registers [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 a8 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 04 01 00 00
80: e4 f3 30 00 04 f1 40 00 00 f0 40 00 00 f0 40 00
90: 00 f0 40 00 00 f0 40 00 00 f0 40 00 00 f0 40 00
a0: 00 f0 40 00 00 f0 40 00 00 f0 40 00 00 f0 40 00
b0: 00 00 00 00 8e 01 00 00 00 00 00 00 00 00 00 00
c0: 4c 04 01 00 00 00 00 00 00 08 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0f.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller RAS Registers [8086:3c71] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller RAS Registers [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 71 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 31 fa 06 00 00 00 00 00
a0: f1 44 03 04 41 00 00 00 80 0c 20 03 00 00 00 00
b0: 00 00 00 00 00 80 00 00 68 0a 00 00 00 00 00 00
c0: 41 6a 1b 09 00 00 00 00 00 00 00 00 00 00 00 00
d0: 56 63 01 20 c0 02 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0f.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 0 [8086:3caa] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 aa 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 0d 40 0e 00 0d 50 0c 00 00 00 0f 00 00 00 00 00
90: 00 84 00 00 00 a4 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0f.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 1 [8086:3cab] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 1 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 ab 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 0d 40 0e 00 0d 50 0c 00 00 00 0f 00 00 00 00 00
90: 00 84 00 00 00 a4 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0f.4 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 2 [8086:3cac] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 2 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 ac 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 0d 40 0e 00 00 00 0f 00 00 00 0f 00 00 00 00 00
90: 00 84 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0f.5 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 3 [8086:3cad] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 3 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 ad 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 0d 40 0e 00 00 00 0f 00 00 00 0f 00 00 00 00 00
90: 00 84 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:0f.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 4 [8086:3cae] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Target Address Decoder 4 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 ae 3c 10 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:10.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 0 [8086:3cb0] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
        Kernel driver in use: snbep_uncore
00: 86 80 b0 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00

0000:3f:10.1 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 1 [8086:3cb1] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 1 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
        Kernel driver in use: snbep_uncore
00: 86 80 b1 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00

0000:3f:10.2 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 0 [8086:3cb2] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 0 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 b2 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 25 0b 0b 0b 0b 0b 0b 0b 00 00 00 00 05 00 00 00
90: 0d 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 80 80 1f 00 00 00 00 00 20 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:10.3 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 1 [8086:3cb3] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 1 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 b3 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 23 0b 0b 0b 0b 0b 0b 0b 00 00 00 00 04 00 00 00
90: 0d 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 80 80 1f 00 00 00 00 00 20 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:10.4 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 2 [8086:3cb4] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 2 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
        Kernel driver in use: snbep_uncore
00: 86 80 b4 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00

0000:3f:10.5 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 3 [8086:3cb5] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller Channel 0-3 Thermal Control 3 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
        Kernel driver in use: snbep_uncore
00: 86 80 b5 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00

0000:3f:10.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 2 [8086:3cb6] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 2 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 b6 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 25 0b 0b 0b 25 25 0b 0b 00 00 00 00 05 00 55 00
90: 0d 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 80 80 1f 00 00 00 00 00 20 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:10.7 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 3 [8086:3cb7] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Integrated Memory Controller ERROR Registers 3 [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [40] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
00: 86 80 b7 3c 00 00 10 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 23 0b 0b 0b 23 23 0b 0b 00 00 00 00 04 00 44 00
90: 0d 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 80 80 1f 00 00 00 00 00 20 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:11.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 DDRIO [8086:3cb8] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 DDRIO [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 b8 3c 10 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00
40: 10 00 91 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:13.0 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 R2PCIe [8086:3ce4] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 R2PCIe [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e4 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 c4 03 00 00 01 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 08 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:13.1 Performance counters [1101]: Intel Corporation Xeon E5/Core i7 Ring to PCI Express Performance Monitor [8086:3c43] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Ring to PCI Express Performance Monitor [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Kernel driver in use: snbep_uncore
00: 86 80 43 3c 00 00 00 00 07 00 01 11 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00

0000:3f:13.4 Performance counters [1101]: Intel Corporation Xeon E5/Core i7 QuickPath Interconnect Agent Ring Registers [8086:3ce6] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 QuickPath Interconnect Agent Ring Registers [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 e6 3c 00 00 00 00 07 00 01 11 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 50 01 50 01 50 01 50 01 00 00 00 00
50: 02 21 00 00 02 21 00 00 10 01 00 00 10 01 00 00
60: 01 00 00 00 00 00 00 00 00 00 00 00 30 24 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 bd 96 00 00 00 00 00 00
90: 00 0c 3c 00 00 00 00 00 12 00 00 00 00 00 00 00
a0: 0e 08 0e 10 10 08 10 10 00 00 00 00 06 06 01 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: ff ff ff ff 00 00 00 00 00 00 00 00 00 00 00 00
d0: ff ff ff ff 00 00 00 00 00 00 00 00 63 11 11 11
e0: 63 11 11 11 04 00 00 00 00 00 40 0c 02 00 cf 0f
f0: 03 00 3a 3a 00 00 00 00 00 00 00 00 00 00 00 00

0000:3f:13.5 Performance counters [1101]: Intel Corporation Xeon E5/Core i7 Ring to QuickPath Interconnect Link 0 Performance Monitor [8086:3c44] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Ring to QuickPath Interconnect Link 0 Performance Monitor [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Kernel driver in use: snbep_uncore
00: 86 80 44 3c 00 00 00 00 07 00 01 11 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00

0000:3f:13.6 System peripheral [0880]: Intel Corporation Xeon E5/Core i7 Ring to QuickPath Interconnect Link 1 Performance Monitor [8086:3c45] (rev 07)
        Subsystem: Hewlett-Packard Company Xeon E5/Core i7 Ring to QuickPath Interconnect Link 1 Performance Monitor [103c:18a8]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Kernel driver in use: snbep_uncore
00: 86 80 45 3c 00 00 00 00 07 00 80 08 10 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 a8 18
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00

------=_Part_195_834613010.1557388371426--
