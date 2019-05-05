Return-Path: <jailhouse-dev+bncBCL6VUP7RYARBG6DXTTAKGQEFDLCP6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F0E1419C
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 19:47:09 +0200 (CEST)
Received: by mail-oi1-x239.google.com with SMTP id 17sf1911015oix.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 10:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kp/i6/dpGBUfQvT05S4MlmHj5OYQJN4tRV61TLrH2Dg=;
        b=MeYUJX//ENAdxYjn69wlVmJQyIrtD878RTjgqkQspWyyzrmcY29Ix2s3JTjQawi3of
         8JXaAhEINe1otAZgKvKfmCW61fBgO5QfHBKK00/vTUpzUA2UmjwRd1xdogtr7tAaC7Eh
         dals6L/C/klf/aSlDFEUsubKMLIo6WirpIPzWpfWl4mOiMWsI1aEP0QrYIXggfdS2+mX
         LlkwPCk59VX4UdLx7saFElbyi+gI4eFB4tjC7SGRSCe/La5n6w7Yri525xjM3+Wm1cZd
         UNdvfX7aIavxQzfv4sEUzLrWrYqqCqTydJQiAsEEmwLDZaofPa00MENYUouIOhg1hsaj
         EPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kp/i6/dpGBUfQvT05S4MlmHj5OYQJN4tRV61TLrH2Dg=;
        b=rAWcER/gPC5jg1cNX6xp1yQH+0zH0akGOaLrtlCcRSrEnJtbqXt62VyJMEkH1+ZGpc
         Q4nFpFa154SobECi70dNkLBNVmL5PZmbeZyHs1KzifGi5BkrzYRrqOcCimAueCFVORj0
         9nin3g4iKBzK11e41pzBADepdNS2Hdy6QKxh4GsUWmw/kyKs+UZi/7D/cEOt0AOLQD99
         7rzro7qR/7JUk9y8TqUrA/6PzfuW0EieF9vK0kmc9nkI2uM9QrgctjcsZtF0Na38HvS2
         KU6UIEmE+MWADUuTlWOYlKSXXSu3LJPx6eXe5IKibOSZDb+DlovWiqsUAcG2GQOJPcD3
         yGjQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUEu+4uOCXr9R9bh7iBl/vGCVAiieVyRFLtixcq+4b56bfqDysW
	ckYqaG6P/L5/bznvXA7VT18=
X-Google-Smtp-Source: APXvYqy9W0gdoeWodxMU7VzvUCrgM1c+obt0OuUb0H/uOFrrxnh3NsVmvEnl2JPCBSfMvtmEZNh4Xw==
X-Received: by 2002:aca:470e:: with SMTP id u14mr5825724oia.127.1557078427605;
        Sun, 05 May 2019 10:47:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:76d2:: with SMTP id p18ls1734640otl.13.gmail; Sun, 05
 May 2019 10:47:07 -0700 (PDT)
X-Received: by 2002:a9d:7a89:: with SMTP id l9mr15425214otn.3.1557078426782;
        Sun, 05 May 2019 10:47:06 -0700 (PDT)
Date: Sun, 5 May 2019 10:47:05 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d68b0dd3-c4da-4c86-b70c-31973e03d29b@googlegroups.com>
In-Reply-To: <0288d0e8-0cc2-9dfd-3c01-f34a8ba981f6@web.de>
References: <16e3b6ef-37e1-4734-aba4-247bcbbc18e0@googlegroups.com>
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
 <3cb885a7-8b66-42b4-adf2-6fc98375efa9@googlegroups.com>
 <26834bed-4a78-4bac-b093-d8f9e2646e72@googlegroups.com>
 <0288d0e8-0cc2-9dfd-3c01-f34a8ba981f6@web.de>
Subject: Re: JAILHOUSE hangs with exception when trying to enable the root
 cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1581_530039529.1557078426016"
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

------=_Part_1581_530039529.1557078426016
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

5 May=C4=B1s 2019 Pazar 18:24:06 UTC+3 tarihinde Jan Kiszka yazd=C4=B1:
> On 29.04.19 23:04, Hakk=C4=B1 Kurumahmut wrote:
> > Hi Jan,
> >
> > I have write new patch that is attached below: (for jailhouse master br=
anch)
> >
> > It is not touch to tree only update dmar_regions variable.
> >
> >
> > git diff
> > diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> > index 46c95fc2..70fe8869 100644
> > --- a/pyjailhouse/sysfs_parser.py
> > +++ b/pyjailhouse/sysfs_parser.py
> > @@ -94,14 +94,13 @@ def input_listdir(dir, wildcards):
> >
> >
> >   def parse_iomem(pcidevices):
> > -    regions =3D IOMemRegionTree.parse_iomem_tree(
> > -        IOMemRegionTree.parse_iomem_file())
> > +    dmar_regions =3D []
> > +    regions =3D IOMemRegionTree.parse_iomem_tree(IOMemRegionTree.parse=
_iomem_file(), dmar_regions)
> >
> >       rom_region =3D MemRegion(0xc0000, 0xdffff, 'ROMs')
> >       add_rom_region =3D False
> >
> >       ret =3D []
> > -    dmar_regions =3D []
> >       for r in regions:
> >           append_r =3D True
> >           # filter the list for MSI-X pages
> > @@ -878,9 +877,27 @@ class IOMemRegionTree:
> >
> >           return regions
> >
> > +    # find DMAR regions in tree
> > +    @staticmethod
> > +    def find_dmar_regions(tree):
> > +        regions =3D []
> > +
> > +        for tree in tree.children:
> > +            r =3D tree.region
> > +            s =3D r.typestr
> > +
> > +            if (s.find('dmar') >=3D 0):
> > +                regions.append(r)
> > +
> > +            # if the tree continues recurse further down ...
> > +            if (len(tree.children) > 0):
> > +                regions.extend(IOMemRegionTree.find_dmar_regions(tree)=
)
> > +
> > +        return regions
> > +
> >       # recurse down the tree
> >       @staticmethod
> > -    def parse_iomem_tree(tree):
> > +    def parse_iomem_tree(tree, dmar_regions):
> >           regions =3D []
> >
> >           for tree in tree.children:
> > @@ -904,11 +921,12 @@ class IOMemRegionTree:
> >               # generally blacklisted, unless we find an HPET behind it
> >               if (s.lower() =3D=3D 'reserved'):
> >                   regions.extend(IOMemRegionTree.find_hpet_regions(tree=
))
> > +                dmar_regions.extend(IOMemRegionTree.find_dmar_regions(=
tree))
> >                   continue
> >
> >               # if the tree continues recurse further down ...
> >               if (len(tree.children) > 0):
> > -                regions.extend(IOMemRegionTree.parse_iomem_tree(tree))
> > +                regions.extend(IOMemRegionTree.parse_iomem_tree(tree, =
dmar_regions))
> >                   continue
> >
> >               # add all remaining leaves
> >
>=20
> OK, sorry, now I get the point and the difference to your previous patch
> version. Generally, this makes sense and does not widen the access incorr=
ectly.
> Can you send this as proper patch (subject, description, signed-off)?

Yes, I can do. I will prepare suitable e-mail to group. but you should know=
 that this is my first Python code. :)

=20
> I would further refactor things at this chance (additional patch) and mov=
e the dmar filtering we have in parse_iomem also into parse_iomem_tree. Tha=
t avoids the back and forth with first adding the region and then filtering=
 it out again.
> Now that we fill dmar_regions withing parse_iomem_tree, this makes even m=
ore sense.
>=20
> One style thing regarding the interface of parse_iomem_tree: I'm no pytho=
n guru to say what is best, but it feels imbalanced that general regions ar=
e returned, dmar regions are simply filled internally by passing the collec=
ted list into the parser. Shouldn't parse_iomem_tree better return a tuple =
of new general regions and new dmar regions, and the caller will do the res=
pective appending?

I agree with you that all general regions (e.g. DMAR or HPET) should be gen=
erated from output of parse_iomem_file() method.

> Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_1581_530039529.1557078426016--
