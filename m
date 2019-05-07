Return-Path: <jailhouse-dev+bncBCL6VUP7RYARBIGYY3TAKGQEVJTISNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AC516758
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 18:02:42 +0200 (CEST)
Received: by mail-ot1-x33b.google.com with SMTP id o13sf9428049otk.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 09:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HJ/ts/w6Cn2PpW9NVPGoKgL61wa7riieb2rfcMFsc7A=;
        b=HrscrMQE6wllj4FowcApr63oLAmiyt+Ncpuqn1Eg/jr5d6eQFiM9reqW/hFuzLWbHl
         d0YA0fgRpmuRzwAk49qnRUmomOFKq7chFC+hUMSvLx+Nuskd5s7cscFQkuJI8Gn1R4Vm
         wN/rXeQB9A2fXtjMymLMbIfbTOnjyGFpSqKGJKOaIvfmPv5pVSrAGOcpSHf/I5OO8HPg
         bgq+NBjLJDBojd2CF3iR4Ph+k3oLJcKtd0gffy8rBb398X1I68AiydtXTlnBMZEgmfMr
         L6SKUdoYT9hhdWHfEBCnhgIspuDrl+/OgYEMVbBdAQcA+FfES8mvV/GE3ib5zXoSuONa
         a/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=HJ/ts/w6Cn2PpW9NVPGoKgL61wa7riieb2rfcMFsc7A=;
        b=XWcARg8zYSutaNp2HgaUaREIIwpBHRS4FfiVXo0fREU4O66j0ud8TJDPLHHcGA096M
         aLD1Jv7xjgIrulzRiFJSisxD7vXCwa81jKyAx49rnDhcf6y20kHGiAmCSnCS19yIRRJ6
         rwyA5jzKY76F4q41sgNdQ7+7xz6fG6IAZ8erR8azOYeMOwBJroSE2lcVIdHFJoLYP8DJ
         klvhXB9dE3eV/PSOUPPqKHPVKhJeLyk10+0rMUPF5H2rPW8wVa03ILX+dYAJCY3KqGAO
         7MsNqS+4LeW8hmp0542gOr2dvoQiC1k5gwglM/p4DF1XRTTPmcvvXy2qahgBB6EVjbWf
         ONTQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVFpHyIKLc59Od9oeMG3AlTebQ7wES3ho65LuBPasRCG/NyCfZL
	vPE1axpY88rzDEzyTPWl1OI=
X-Google-Smtp-Source: APXvYqwUUibBUU4zDiOs2aBC9NIu4W+lBSBnK+QXQa2xHGOYWVQfAJeKSfFfjMq98smioR4RTCCvBg==
X-Received: by 2002:a9d:6e96:: with SMTP id a22mr4941821otr.203.1557244961306;
        Tue, 07 May 2019 09:02:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:be41:: with SMTP id o62ls2415567oif.1.gmail; Tue, 07 May
 2019 09:02:40 -0700 (PDT)
X-Received: by 2002:aca:ec81:: with SMTP id k123mr700596oih.45.1557244960336;
        Tue, 07 May 2019 09:02:40 -0700 (PDT)
Date: Tue, 7 May 2019 09:02:39 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ca983998-f4b0-4341-9264-091d0fcee183@googlegroups.com>
In-Reply-To: <20190507170634.7f1c97fb@md1za8fc.ad001.siemens.net>
References: <62e83024-118e-4109-ab5e-330bec67389f@googlegroups.com>
 <20190506104344.33303fdc@md1za8fc.ad001.siemens.net>
 <8a5e41f1-5533-42de-89a3-9ac5437751e5@googlegroups.com>
 <668d10f2-2880-4edb-8050-1dae941693bb@googlegroups.com>
 <20190507170634.7f1c97fb@md1za8fc.ad001.siemens.net>
Subject: Re: [PATCH] Scripts: Fix for Parsing DMAR Region under Reserved
 Section
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2835_838450.1557244959732"
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

------=_Part_2835_838450.1557244959732
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

7 May=C4=B1s 2019 Sal=C4=B1 18:06:36 UTC+3 tarihinde Henning Schild yazd=C4=
=B1:
> Am Mon, 6 May 2019 12:26:42 -0700
> schrieb Hakk=C4=B1 Kurumahmut <hkurumahmut84@hotmail.com>:
>=20
> > Hi Henning,
> >=20
> > I have write new patch but I have not test it more. But it is more
> > suitable for your advices.
> >=20
>=20
> That one looks very good and you can propose it with "git format-patch
> --subject prefix PATCHv2" after a few more things. Again comments inline
>=20
> > diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> > index 46c95fc2..985c1129 100644
> > --- a/pyjailhouse/sysfs_parser.py
> > +++ b/pyjailhouse/sysfs_parser.py
> > @@ -22,6 +22,7 @@ import struct
> >  import os
> >  import fnmatch
> > =20
> > +# root_dir =3D "/home/ubuntu/repos/siemens/jailhouse/data/"
> >  root_dir =3D "/"
>=20
> Do you already know about "jailhouse-config-collect" and the "-r" switch =
for the config creator?

Thanks useful information.
=20
> Needless to say that this should not become part of the patch. The same a=
pplies to some whitespace diff and the debug prints.

This is the draft code written to get your opinion. After testing, the reco=
mmended code was at the bottom of the mail. we can proceed through it.
=20
> >  def set_root_dir(dir):
> > @@ -58,6 +59,7 @@
> > inputs['files_intel'].add('/sys/firmware/acpi/tables/DMAR')
> > inputs['files_amd'].add('/sys/firmware/acpi/tables/IVRS')=20
> > =20
> > +
> >  def check_input_listed(name, optional=3DFalse):
> >      set =3D inputs['files_opt']
> >      if optional is False:
> > @@ -94,14 +96,15 @@ def input_listdir(dir, wildcards):
> > =20
> > =20
> >  def parse_iomem(pcidevices):
> > -    regions =3D IOMemRegionTree.parse_iomem_tree(
> > +    dmar_regions =3D []
>=20
> this is already done inside the function and can be skipped
>=20
> > +    (regions, dmar_regions) =3D IOMemRegionTree.parse_iomem_tree(
> >          IOMemRegionTree.parse_iomem_file())
> > =20
> >      rom_region =3D MemRegion(0xc0000, 0xdffff, 'ROMs')
> >      add_rom_region =3D False
> > =20
> >      ret =3D []
> > -    dmar_regions =3D []
> > +   =20
> >      for r in regions:
> >          append_r =3D True
> >          # filter the list for MSI-X pages
> > @@ -249,9 +252,14 @@ def parse_dmar(pcidevices, ioapics,
> > dmar_regions): if d.iommu is None:
> >                          d.iommu =3D len(units) - 1
> >              offset +=3D 16 - offset
> > +            print('DRHD: struct_len: %d offset: %2d -> flags: %d
> > segment: %d base: 0x%x ' % (struct_len, offset, flags, segment,
> > base)) + while offset < struct_len:
> >                  (scope_type, scope_len, id, bus, dev, fn) =3D\
> >                      parse_dmar_devscope(f)
> > +
> > +                print('DevScope: offset: %2d ->  scope_type: %d
> > scope_len: %d id: %d bus: %d dev: %d fn: %d' % (offset, scope_type,
> > scope_len, id, bus, dev, fn)) + # PCI Endpoint Device
> >                  if scope_type =3D=3D 1:
> >                      assert not (flags & 1)
> > @@ -290,11 +298,15 @@ def parse_dmar(pcidevices, ioapics,
> > dmar_regions): offset +=3D 8 - offset
> >              (base, limit) =3D struct.unpack('<QQ', f.read(16))
> >              offset +=3D 16
> > +            print('RMRR: struct_len: %d offset: %2d ->  base: 0x%x
> > limit: %d ' % (struct_len, offset, base, limit))=20
> >              comments =3D []
> >              while offset < struct_len:
> >                  (scope_type, scope_len, id, bus, dev, fn) =3D\
> >                      parse_dmar_devscope(f)
> > +               =20
> > +                print('DevScope: offset: %2d ->  scope_type: %d
> > scope_len: %d id: %d bus: %d dev: %d fn: %d' % (offset, scope_type,
> > scope_len, id, bus, dev, fn)) + if scope_type =3D=3D 1:
> >                      comments.append('PCI device: %02x:%02x.%x' %
> >                                      (bus, dev, fn))
> > @@ -860,21 +872,21 @@ class IOMemRegionTree:
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
> > -
> > regions.extend(IOMemRegionTree.find_hpet_regions(tree))
> > +
> > regions.extend(IOMemRegionTree.find_regions_by_name(tree, string))=20
> >          return regions
> > =20
> > @@ -882,6 +894,7 @@ class IOMemRegionTree:
> >      @staticmethod
> >      def parse_iomem_tree(tree):
> >          regions =3D []
> > +        dmar_regions =3D []
> > =20
> >          for tree in tree.children:
> >              r =3D tree.region
> > @@ -901,20 +914,23 @@ class IOMemRegionTree:
> >              ):
> >                  continue
> > =20
> > -            # generally blacklisted, unless we find an HPET behind it
> > +            # generally blacklisted, with a few exceptions
> >              if (s.lower() =3D=3D 'reserved'):
> > -
> > regions.extend(IOMemRegionTree.find_hpet_regions(tree))
> > +
> > regions.extend(IOMemRegionTree.find_regions_by_name(tree, 'HPET'))
> > +
> > dmar_regions.extend(IOMemRegionTree.find_regions_by_name(tree,
> > 'dmar')) continue=20
> >              # if the tree continues recurse further down ...
> >              if (len(tree.children) > 0):
> > -
> > regions.extend(IOMemRegionTree.parse_iomem_tree(tree))
> > +                (temp_regions, temp_dmar_regions) =3D
> > IOMemRegionTree.parse_iomem_tree(tree)
> > +                regions.extend(temp_regions)
> > +                dmar_regions.extend(temp_dmar_regions)
>=20
> Exactly the pattern i was about to suggest when i saw one previous
> mail ;)
>=20
> Looks all good to me and should be turned into a v2.
>=20
> Henning
>=20
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
> >=20
> >

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ca983998-f4b0-4341-9264-091d0fcee183%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_2835_838450.1557244959732--
