Return-Path: <jailhouse-dev+bncBDCN3RNB2MDRB2G6Z7TAKGQEVPXS6LA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B77B18789
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 11:14:17 +0200 (CEST)
Received: by mail-ot1-x33d.google.com with SMTP id e3sf298114otk.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 02:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lSxNkfk9GeFmTM7+Nyx4/3oGreF+VjQVqowfvordZdE=;
        b=RlDVJsGKlr9cFFDAc9bB0Bn3Byuy9ioQ1+40FsoRr/ZmMFKKYntJevbzuu8hIUx+FS
         /qVkulFyS1nc9gT1+r0KfjHPY8n272hV0c6BKNE2+zrK5XGQyxWKr3oEWc6shg8w57Va
         UR0/38rt5ApQDaiQAkBHHpYmWfcUt1J/ppOPxedsntMf5vJKVdh8ikEl96GJ+ZQ4K3Vj
         zYhGKRc2ExOdWanf3/18ZjX/mpvqYGmTMWPi0Hmx4IUMs9HbRat2lOAPHh/I7FbD+XgW
         r+MgMfsZ9O0+ugknNkq54uW00a2O0dwGuWJJx0L2j2qosBCkFcmFUH8JMcFnJAZTBzx+
         afXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lSxNkfk9GeFmTM7+Nyx4/3oGreF+VjQVqowfvordZdE=;
        b=UKWyeLfaSD6At5jyCm+tcc9/GVmsfbTiKuomYgOoMLWnE2wT584CZsnMviKpWoKJ2z
         Ynq5L1HllVCB5T5PuYEhj++KrPu5uzPZX7HJi7VJAUcDb3tuBb6G7uK6ckShaLYNZyKC
         VaTiSYiJZkVlyn++6Usl5VM1/hvHPxuUCyk7ceSg6+CMQTAl9sOYHXYJnwYQOlOXK990
         fkwmLmn1KNwwmgH6AV6gEMTpVOTdUvqyzpHyOBzzntNbwI9OupJakmJVuHa/NNuETt8x
         Big8BlfYolpfiZXyLCaJ8Nze01s/J+L/v9mOvK/G09eun1ptymajxzflJD+iiR7CxdUw
         7Yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=lSxNkfk9GeFmTM7+Nyx4/3oGreF+VjQVqowfvordZdE=;
        b=LeCjTn8u3htJ5ySjYVWx2BN5/5ZZHRifYcOLQpRnaGuBn0IKaVlegIyahZEtutoOj9
         JtD1IKlceMAA/agMGAcTwJfV5/LmGQl7O6VhoeLlAUUPeKYGz8aao7LaOkTmMNpA90jH
         SOpkBYi+PZSC8T9t/+PruxN7i/vdUYRCckDTLYK0sNptHDb39M9nFe3Zv7JFd4W/VRYQ
         7wLGmOi5fSvOre44vB5R1O49BaJFctxIA26Wy1uxCfRX804q91i2mK6js4MANwdn2X2R
         2ucJNGdnfsa7jdmUDtkQnaaalAZU7iZO3k09hiZyzpj1zSJJXMSPk/p+JZrWOYCuGCMv
         dloA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVto33TomLRfTcKWQhfC/XjDz97wTFj81tXxnAxNMKB9xlVWCpx
	sxbvkWIS/43Bjk/gt+UqHc0=
X-Google-Smtp-Source: APXvYqz3Jxxin+g9qSfijUDRopd8V79JYpIDBWa/Lx1ucJcarebUcLPmMiB1KNfMs1QzZGqlA2Lm6g==
X-Received: by 2002:a05:6830:138d:: with SMTP id d13mr1427608otq.272.1557393256315;
        Thu, 09 May 2019 02:14:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:e38f:: with SMTP id a137ls276222oih.3.gmail; Thu, 09 May
 2019 02:14:15 -0700 (PDT)
X-Received: by 2002:aca:b505:: with SMTP id e5mr830193oif.136.1557393255613;
        Thu, 09 May 2019 02:14:15 -0700 (PDT)
Date: Thu, 9 May 2019 02:14:14 -0700 (PDT)
From: jeanne.romefort@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <02568569-7d1b-4bb5-8a1e-a5cbee5a77ee@googlegroups.com>
In-Reply-To: <71f64f49-1bcd-4ab0-947a-0bcabc2ac1e6@googlegroups.com>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
 <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
 <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
 <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
 <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
 <c238d436-5995-4c44-8a19-bc26654671d5@googlegroups.com>
 <5c94104f-c27d-9074-1990-61fa9e9d05c1@siemens.com>
 <cda9daa8-fbe8-46fb-aaba-75ebd38e141e@googlegroups.com>
 <71f64f49-1bcd-4ab0-947a-0bcabc2ac1e6@googlegroups.com>
Subject: Re: Unsupported DMAR Device Scope Structure
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_219_2049835578.1557393255047"
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

------=_Part_219_2049835578.1557393255047
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 9 mai 2019 09:52:51 UTC+2, jeanne....@gmail.com a =C3=A9crit=C2=A0=
:
> Le mardi 7 mai 2019 23:14:41 UTC+2, Hakk=C4=B1 Kurumahmut a =C3=A9crit=C2=
=A0:
> > Hi Jan, Jeanne
> >=20
> > @Jeanne
> >=20
> > I prepared a solution about the problem. Please apply two patch for jai=
lhouse/next branch. Or download attached file sysfs_parser.py.
> >=20
> > I also sent sysconfig.c for your platform. When you use the new script,=
 you will produce a similar file.
> >=20
> > Please test it.
> >=20
> > Could you send us below command outputs?
> >=20
> > sudo lspci -D
> > sudo lspci -Dtvvv
> > sudo lspci -Dkvvvnnxxx
> >=20
> >=20
> > @Jan
> >=20
> > I have a question about the patch. assign_iommu_info and append_comment=
_info methods is running for PCI-PCI bridge primary and secondary bus,dev,f=
n.=20
> >=20
> > I'm not sure it should work for the primary bus,dev,fn.
> >=20
> > Example Device Scope:
> >=20
> > 01 0A 00 00 00 00 1C 07 00 00=20
> > 01 0A 00 00 00 00 1C 07 00 02=20
> > 01 0A 00 00 00 00 1C 07 00 04
> >=20
> > It is running order
> >=20
> > 1.) 00:1C.07
> > 2.) sec-bus:00.00
> > 3.) 00:1C.07
> > 4.) sec-bus:00.02=20
> > 5.) 00:1C.07
> > 6.) sec-bus:00.04=20
> >=20
> > May be it is run for only secondary buses.
> >=20
> > 1.) sec-bus:00.00
> > 2.) sec-bus:00.02=20
> > 3.) sec-bus:00.04=20
> >=20
> >=20
> > -----------------------------------------------------------------------=
----
> > [PATCH 1/2]
> >=20
> > From aa9e7f0e25317d2f516da68b4163f9f08fc6c76d Mon Sep 17 00:00:00 2001
> > From: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
> > Date: Tue, 7 May 2019 19:37:59 +0300
> > Subject: [PATCH 1/2] Scripts: Fix for Parsing DMAR Region under Reserve=
d
> >  Section
> >=20
> >  While kernel command parameters are intel_iommu=3Don  intremap=3Don at
> >  some machines, cat /proc/iomem shows DMAR region under reserved sectio=
n.
> >  This patch must be done for config creation to complete because of
> >  generating DMAR region not found error although it exist. If this patc=
h is
> >  not apply, an error is throw by "config create" command whether
> >  intel_iommu On or Off because "reserved" regions are currently exclude=
d from
> >  the generated config although DMAR region exists. Thus, DMAR under res=
erved
> >  section must be parsed by parser.
> >=20
> > Signed-off-by: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
> > ---
> >  pyjailhouse/sysfs_parser.py | 23 +++++++++++++----------
> >  1 file changed, 13 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> > index 46c95fc2..4f5da12e 100644
> > --- a/pyjailhouse/sysfs_parser.py
> > +++ b/pyjailhouse/sysfs_parser.py
> > @@ -94,14 +94,13 @@ def input_listdir(dir, wildcards):
> > =20
> > =20
> >  def parse_iomem(pcidevices):
> > -    regions =3D IOMemRegionTree.parse_iomem_tree(
> > +    (regions, dmar_regions) =3D IOMemRegionTree.parse_iomem_tree(
> >          IOMemRegionTree.parse_iomem_file())
> > =20
> >      rom_region =3D MemRegion(0xc0000, 0xdffff, 'ROMs')
> >      add_rom_region =3D False
> > =20
> >      ret =3D []
> > -    dmar_regions =3D []
> >      for r in regions:
> >          append_r =3D True
> >          # filter the list for MSI-X pages
> > @@ -860,21 +859,21 @@ class IOMemRegionTree:
> > =20
> >          return root
> > =20
> > -    # find HPET regions in tree
> > +    # find specific regions in tree
> >      @staticmethod
> > -    def find_hpet_regions(tree):
> > +    def find_regions_by_name(tree, string):
> >          regions =3D []
> > =20
> >          for tree in tree.children:
> >              r =3D tree.region
> >              s =3D r.typestr
> > =20
> > -            if (s.find('HPET') >=3D 0):
> > +            if (s.find(string) >=3D 0):
> >                  regions.append(r)
> > =20
> >              # if the tree continues recurse further down ...
> >              if (len(tree.children) > 0):
> > -                regions.extend(IOMemRegionTree.find_hpet_regions(tree)=
)
> > +                regions.extend(IOMemRegionTree.find_regions_by_name(tr=
ee, string))
> > =20
> >          return regions
> > =20
> > @@ -882,6 +881,7 @@ class IOMemRegionTree:
> >      @staticmethod
> >      def parse_iomem_tree(tree):
> >          regions =3D []
> > +        dmar_regions =3D []
> > =20
> >          for tree in tree.children:
> >              r =3D tree.region
> > @@ -901,20 +901,23 @@ class IOMemRegionTree:
> >              ):
> >                  continue
> > =20
> > -            # generally blacklisted, unless we find an HPET behind it
> > +            # generally blacklisted, with a few exceptions
> >              if (s.lower() =3D=3D 'reserved'):
> > -                regions.extend(IOMemRegionTree.find_hpet_regions(tree)=
)
> > +                regions.extend(IOMemRegionTree.find_regions_by_name(tr=
ee, 'HPET'))
> > +                dmar_regions.extend(IOMemRegionTree.find_regions_by_na=
me(tree, 'dmar'))
> >                  continue
> > =20
> >              # if the tree continues recurse further down ...
> >              if (len(tree.children) > 0):
> > -                regions.extend(IOMemRegionTree.parse_iomem_tree(tree))
> > +                (temp_regions, temp_dmar_regions) =3D IOMemRegionTree.=
parse_iomem_tree(tree)
> > +                regions.extend(temp_regions)
> > +                dmar_regions.extend(temp_dmar_regions)
> >                  continue
> > =20
> >              # add all remaining leaves
> >              regions.append(r)
> > =20
> > -        return regions
> > +        return regions, dmar_regions
> > =20
> > =20
> >  class IOMMUConfig:
> > --=20
> > 2.17.1
> >=20
> >=20
> > -----------------------------------------------------------------------=
----
> > [PATCH 2/2]
> >=20
> > From d7f925b10f32a37b4595255afe8690abf50a4a3d Mon Sep 17 00:00:00 2001
> > From: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
> > Date: Tue, 7 May 2019 23:25:14 +0300
> > Subject: [PATCH 2/2] Scrits: Fix for Unsupported DMAR Device Scope Stru=
cture
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=3DUTF-8
> > Content-Transfer-Encoding: 8bit
> >=20
> >  Currently DMAR parser does not support parsing secondary path info for=
 PCI-PCI bridge that is "PCI Endpoint Device" type.
> >  For example: 8086:1d1e Patsburg PCI Express Root Port 8
> >=20
> >  If the =E2=80=98Path=E2=80=99 field length is more than 2 bytes (N > 1=
), the Device Scope
> >  Entry identifies a device behind one or more system software visible P=
CI-
> >  PCI bridges. Bus rebalancing actions by system software modifying bus
> >  assignments of the device=E2=80=99s parent bridge impacts the bus numb=
er portion
> >  of device=E2=80=99s requester-id.
> >=20
> >  Please read VT-d Specification Chapter 8.3.1
> >=20
> > Signed-off-by: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
> > ---
> >  pyjailhouse/sysfs_parser.py | 113 ++++++++++++++++++++++--------------
> >  1 file changed, 70 insertions(+), 43 deletions(-)
> >=20
> > diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> > index 4f5da12e..9e5c08d1 100644
> > --- a/pyjailhouse/sysfs_parser.py
> > +++ b/pyjailhouse/sysfs_parser.py
> > @@ -194,12 +194,45 @@ def parse_madt():
> >      return ioapics
> > =20
> > =20
> > -def parse_dmar_devscope(f):
> > -    (scope_type, scope_len, id, bus, dev, fn) =3D \
> > -        struct.unpack('<BBxxBBBB', f.read(8))
> > -    if scope_len !=3D 8:
> > -        raise RuntimeError('Unsupported DMAR Device Scope Structure')
> > -    return (scope_type, scope_len, id, bus, dev, fn)
> > +def assign_iommu_info(flags, pcidevices, units, ioapics, scope_type, i=
d, bus, dev, fn):
> > +    # PCI Endpoint Device
> > +    if scope_type =3D=3D 1:
> > +        assert not (flags & 1)
> > +        for d in pcidevices:
> > +            if d.bus =3D=3D bus and d.dev =3D=3D dev and d.fn =3D=3D f=
n:
> > +                d.iommu =3D len(units) - 1
> > +                break
> > +    # PCI Sub-hierarchy
> > +    elif scope_type =3D=3D 2:
> > +        assert not (flags & 1)
> > +        for d in pcidevices:
> > +            if d.bus =3D=3D bus and d.dev =3D=3D dev and d.fn =3D=3D f=
n:
> > +                (secondbus, subordinate) =3D \
> > +                    PCIPCIBridge.get_2nd_busses(d)
> > +                for d2 in pcidevices:
> > +                    if (
> > +                        d2.bus >=3D secondbus and
> > +                        d2.bus <=3D subordinate
> > +                    ):
> > +                        d2.iommu =3D len(units) - 1
> > +                break
> > +    # IOAPIC
> > +    elif scope_type =3D=3D 3:
> > +        ioapic =3D next(chip for chip in ioapics if chip.id =3D=3D id)
> > +        bdf =3D (bus << 8) | (dev << 3) | fn
> > +        for chip in ioapics:
> > +            if chip.bdf =3D=3D bdf:
> > +                raise RuntimeError('IOAPICs with identical BDF')
> > +        ioapic.bdf =3D bdf
> > +        ioapic.iommu =3D len(units) - 1
> > +
> > +
> > +def append_comment_info(comments, scope_type, bus, dev, fn):
> > +    if scope_type =3D=3D 1:
> > +        comments.append('PCI device: %02x:%02x.%x' %
> > +                        (bus, dev, fn))
> > +    else:
> > +        comments.append('DMAR parser could not decode device path')
> > =20
> > =20
> >  # parsing of DMAR ACPI Table
> > @@ -249,38 +282,22 @@ def parse_dmar(pcidevices, ioapics, dmar_regions)=
:
> >                          d.iommu =3D len(units) - 1
> >              offset +=3D 16 - offset
> >              while offset < struct_len:
> > -                (scope_type, scope_len, id, bus, dev, fn) =3D\
> > -                    parse_dmar_devscope(f)
> > -                # PCI Endpoint Device
> > -                if scope_type =3D=3D 1:
> > -                    assert not (flags & 1)
> > -                    for d in pcidevices:
> > -                        if d.bus =3D=3D bus and d.dev =3D=3D dev and d=
.fn =3D=3D fn:
> > -                            d.iommu =3D len(units) - 1
> > -                            break
> > -                # PCI Sub-hierarchy
> > -                elif scope_type =3D=3D 2:
> > -                    assert not (flags & 1)
> > +                (scope_type, scope_len) =3D struct.unpack('<BB', f.rea=
d(2))
> > +
> > +                N =3D (int)((scope_len - 6) / 2) - 1
> > +
> > +                (id, starting_bus, starting_dev, starting_fn) =3D stru=
ct.unpack('<xxBBBB', f.read(6))
> > +
> > +                assign_iommu_info(flags, pcidevices, units, ioapics, s=
cope_type, id, starting_bus, starting_dev, starting_fn)
> > +
> > +                while N !=3D 0:
> > +                    N-=3D1
> > +                    (secondary_dev, secondary_fn) =3D struct.unpack('<=
BB', f.read(2))
> >                      for d in pcidevices:
> > -                        if d.bus =3D=3D bus and d.dev =3D=3D dev and d=
.fn =3D=3D fn:
> > -                            (secondbus, subordinate) =3D \
> > -                                PCIPCIBridge.get_2nd_busses(d)
> > -                            for d2 in pcidevices:
> > -                                if (
> > -                                    d2.bus >=3D secondbus and
> > -                                    d2.bus <=3D subordinate
> > -                                ):
> > -                                    d2.iommu =3D len(units) - 1
> > +                        if d.bus =3D=3D starting_bus and d.dev =3D=3D =
starting_dev and d.fn =3D=3D starting_fn:
> > +                            (secondbus, subordinate) =3D PCIPCIBridge.=
get_2nd_busses(d)
> >                              break
> > -                # IOAPIC
> > -                elif scope_type =3D=3D 3:
> > -                    ioapic =3D next(chip for chip in ioapics if chip.i=
d =3D=3D id)
> > -                    bdf =3D (bus << 8) | (dev << 3) | fn
> > -                    for chip in ioapics:
> > -                        if chip.bdf =3D=3D bdf:
> > -                            raise RuntimeError('IOAPICs with identical=
 BDF')
> > -                    ioapic.bdf =3D bdf
> > -                    ioapic.iommu =3D len(units) - 1
> > +                    assign_iommu_info(flags, pcidevices, units, ioapic=
s, scope_type, id, secondbus, secondary_dev, secondary_fn)
> >                  offset +=3D scope_len
> > =20
> >          # Reserved Memory Region Reporting Structure
> > @@ -292,13 +309,23 @@ def parse_dmar(pcidevices, ioapics, dmar_regions)=
:
> > =20
> >              comments =3D []
> >              while offset < struct_len:
> > -                (scope_type, scope_len, id, bus, dev, fn) =3D\
> > -                    parse_dmar_devscope(f)
> > -                if scope_type =3D=3D 1:
> > -                    comments.append('PCI device: %02x:%02x.%x' %
> > -                                    (bus, dev, fn))
> > -                else:
> > -                    comments.append('DMAR parser could not decode devi=
ce path')
> > +                (scope_type, scope_len) =3D struct.unpack('<BB', f.rea=
d(2))
> > +
> > +                N =3D (int)((scope_len - 6) / 2) - 1
> > +
> > +                (id, starting_bus, starting_dev, starting_fn) =3D stru=
ct.unpack('<xxBBBB', f.read(6))
> > +
> > +                append_comment_info(comments, scope_type, starting_bus=
, starting_dev, starting_fn)
> > +
> > +                while N !=3D 0:
> > +                    N-=3D1
> > +                    (secondary_dev, secondary_fn) =3D struct.unpack('<=
BB', f.read(2))
> > +                    for d in pcidevices:
> > +                        if d.bus =3D=3D starting_bus and d.dev =3D=3D =
starting_dev and d.fn =3D=3D starting_fn:
> > +                            (secondbus, subordinate) =3D PCIPCIBridge.=
get_2nd_busses(d)
> > +                            break
> > +
> > +                    append_comment_info(comments, scope_type, secondbu=
s, secondary_dev, secondary_fn)
> >                  offset +=3D scope_len
> > =20
> >              reg =3D MemRegion(base, limit, 'ACPI DMAR RMRR', comments)
> > --=20
> > 2.17.1
> >=20
> > -----------------------------------------------------------------------=
----
> >=20
> >=20
> > Thanks.
> >=20
> > HAKKI
>=20
> Hello everyone,=20
>=20
> Thanks for the help now I pass the hradware check ! Unfortunately the ena=
bling of the rootCell is not working yet. With Halli's configuration everyt=
hing is juste freezing without giving any error. When I use my generated fi=
le (that is similar to Hakki's one) I got this error :
>=20
>=20
> [] Irq 16 : nobody cared (try booting with the "irqpoll" option)=20
> [] Handlers :
> [] [<ffffffff81622fa0>] usb_hcd_irq
> [] [<ffffffffc025c360>] ilo_isr [hpilo]
> [] Disabling IRQ # 16
> [] NMI watchdog: BUG: soft lockup - CPU#7 stuck for 22s! [kworkers/...]
> [] NMI watchdog: BUG: soft lockup - CPU#6 stuck for 22s! [kworkers/...]
> [] NMI watchdog: BUG: soft lockup - CPU#8 stuck for 22s! [kworkers/...]
> [] NMI watchdog: BUG: soft lockup - CPU#9 stuck for 22s! [kworkers/...]
> [] NMI watchdog: BUG: soft lockup - CPU#11 stuck for 22s! [kworkers/...]
> [] NMI watchdog: BUG: soft lockup - CPU#12 stuck for 22s! [kworkers/...]
> [] NMI watchdog: BUG: soft lockup - CPU#13 stuck for 22s! [kworkers/...]
> [] NMI watchdog: BUG: soft lockup - CPU#14 stuck for 22s! [kworkers/...]
> [] NMI watchdog: BUG: soft lockup - CPU#15 stuck for 22s! [kworkers/...]
> [] NMI watchdog: BUG: soft lockup - CPU#17 stuck for 22s! [kworkers/...]
>=20
> etc...
>=20
> I don't know why there is this error. Do you have an idea ?=20
>=20
>=20
>=20
> @Hakki you can find in attachment the lspci command lines you requested
>=20
> again : thanks for your help

Hello again,=20

Actually my error is a kernel panic that is shutting down all the CPUs with=
 NMI

best regards,

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/02568569-7d1b-4bb5-8a1e-a5cbee5a77ee%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_219_2049835578.1557393255047--
