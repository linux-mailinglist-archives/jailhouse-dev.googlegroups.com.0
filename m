Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRB7F5Y3TAKGQEXSTDTEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ACE16633
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 17:06:36 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id c24sf736625edb.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 08:06:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557241596; cv=pass;
        d=google.com; s=arc-20160816;
        b=I9i79pwcUbmP3t5T50hjuXRiGTnO0HWNwCnFbwLrYI7WjAHuF9JwGd7bpz/nsH8EPC
         S5plB5J7MoAizLa9LW5nu3hUwkXbwCLeHwL4t2nKxUp4jHaj0uos0rUYVF37YRMYy1tD
         69sA1aa4z8pso9dbIiNFI1+ERBOb7VGgBGqq5EMZ6LHho/JoY4fsDofTlpbPyun8oFPS
         HVpu4DNWFV2MUdPWGxwR8r2W8ibzDMFBfpM9hlVj1eQemYrCM8SoDVq1VBqD4wYoaAsi
         hjAMlY1Mx4gXiPkAxPKqYSmc2d+tzFMAA2zzVyJEOUSubddPzY7Cs3wFi8MMDolx4sqt
         Xcog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:sender:dkim-signature;
        bh=L4zYKchiAQIdBp0RYaWFHVOgPpY2hB0IkWdPA96Cxoo=;
        b=PW9KgTW3kgiKXl4+6zSldcKwqgtl1HoVSsokCCTe4//LVh1y3C8EkOkf+eTe2QyGmg
         fk3ldnlUDkgNF2SzttElz9S2+xlksuqT9VtaylU7g3uYBUDcpxdGeL1fk4bKXo1v3X2j
         CbXo5wvp8iCj1aUOTKW3106xLNzH1W6VHYWeqqJj6YCL4ERSgtrqslDmhveit03AIbZI
         J/P/8QerSRxaUl0X8OG2jrSL8Qi1Ov64QzcjkjzCsV2MrGH1UUCUHsTB2PQN7wFYtkBQ
         mMW3iwHLQeQt0AMrGEHvophpZ9ipvoDZj/XwgaiMV+WmBBxTR6Gu9Jdc9L7ikFZCsidZ
         NxZA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L4zYKchiAQIdBp0RYaWFHVOgPpY2hB0IkWdPA96Cxoo=;
        b=iQ7nKBYGkk8wc7YY9veixh8rgUVf3CIeNZw5J8HH7E7L14UjeuuaHqQ9L32VZUqSnt
         pROf+Qtny7TI1PidTbn7kVXPhJtiD21EZtoppA8r8vyq3WdTNEQjBiR92xkyVaKnShSs
         1leFxIk2YlyhCaJoHTeUXm0g1Tmj2BR4h0KU6ErXAg/aOBu98ndzB6c761dwCLvbZHNl
         sE/BWLFThmiE3xg88pmfsv5N/RIWFcrwHXFYsPVZDsFQirKLzdhSa6YK8V64EqL7ltPo
         CArbahH8i6E0pj7Mu7LYJWDSJ73lviRxQgMoo/y7dOZAztDEiMxj5dabeboiDKDaTXRT
         Qt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=L4zYKchiAQIdBp0RYaWFHVOgPpY2hB0IkWdPA96Cxoo=;
        b=KmtHwTxMiI6oJHRcp3GloBmnA0s+MgwBIadeBTuoak1j/hGQOBahoH955xfYFG2UpD
         aRpm2FaQ+4hFGkLcGwYqBzGaJwz5WQOGACtJeXF3T4H5AHfIlWPf9bnA1W1e0CDku0sP
         Ez7vMEaYJxbQC8kZNxSJJpu9/zU7ykGywjmok7ovjGcX980N1aw93IDMv8bAMb+G4r+Q
         +f4Ffx0cL7qfTN4whGLaF98mFbJGQvbNfZxN2oDS8+6GzjVn9qKI5BXW5Suw0IixSXh1
         jgxotHjQ9jj6AKIHrM+pi7ibU68nnViGj1ibhbcVD7gjOhlrPGvKSQiYrb6IY41Flo1i
         ybOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVuMKrLTkwJf7wscgPJP/6fyRdPh/Hv5zLqAWLPBMdyV/gj4om9
	wxmEhBTnaYbPmKxfwqb/gis=
X-Google-Smtp-Source: APXvYqxNXlVaKRh3PqkLtvJ0w2lh6H8Qqg85TKZF3zUCBS2xO3IcWH9CbGoEoVJQ6o07g2ZbEP7LBg==
X-Received: by 2002:a17:906:1385:: with SMTP id f5mr25138194ejc.193.1557241596234;
        Tue, 07 May 2019 08:06:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1f51:: with SMTP id d17ls3511919ejk.11.gmail; Tue,
 07 May 2019 08:06:35 -0700 (PDT)
X-Received: by 2002:a17:906:e2c2:: with SMTP id gr2mr25260728ejb.45.1557241595726;
        Tue, 07 May 2019 08:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557241595; cv=none;
        d=google.com; s=arc-20160816;
        b=I5JPBRTwRf3cIEDwZeULGgsyMtmuIB/GcC5HOE6YdYVeVoH1NsiCCdHkppjayRIWKu
         iFbcrq6KVpGUwBu0U2e4luY0fwe7HP8Ue1yNU5gItlg1ONAtiV0q+R5o62RASnStu34h
         4BRNLPut/LbbISqJjJIHITfS4G82zZ+LoLVG414hdMczOkmWQgn8ZRRNssd5Pm4eCHfm
         ADy9gt/d1YDOtGcyM3mQ0PqjS3E0Ff3qUSx+gnv+SRDH8+0ggP+LKVfSGrRrJBMis/Kq
         a5E1tv43Gd+witdqjVh4jcYb8gVZ34ifUJFyqCrKqjFyvkunGR40g7cO7f7mO5H8NaCb
         Xbhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=aROwSLJ8eiiJ25YA7xA4RGcNpVRsAb61b5SEIS8D5FY=;
        b=k+QGFR2ssJS42jROrST3k1TMyCMF07GBX3h8fBJQAKsU97TyIRNSBYRB9SjTbw53KP
         SG2V+By2sOJLe7WzWwmlIG+ak+7IF9yPPXSj1xhcJqioWhYSByLbILHzE07RQMTwC5XZ
         RUMdAE9UgHbl/Ovh3KGC/2HmqoBpHNkfl79wbBInfqaam7GOd1U8ysdmPHq3WMKCDEY4
         +Bj30VRhEIFbGo2YKsh0sG/wPg1WpGZ7iNFmqu0Uq6+pRrFLFaE9wn5R+YbPb8gXwxub
         1p2xnX8gDu/tvT9/bvizvYg8u0VOrmB1SYElK4/Dto1cKuvo3MjncCDCFe9j88To6W9d
         G/8g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id u16si473081eda.2.2019.05.07.08.06.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 08:06:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x47F6Zn8007574
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 May 2019 17:06:35 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.0.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x47F6ZvC010370;
	Tue, 7 May 2019 17:06:35 +0200
Date: Tue, 7 May 2019 17:06:34 +0200
From: Henning Schild <henning.schild@siemens.com>
To: =?UTF-8?B?SGFra8Sx?= Kurumahmut <hkurumahmut84@hotmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH] Scripts: Fix for Parsing DMAR Region under Reserved
 Section
Message-ID: <20190507170634.7f1c97fb@md1za8fc.ad001.siemens.net>
In-Reply-To: <668d10f2-2880-4edb-8050-1dae941693bb@googlegroups.com>
References: <62e83024-118e-4109-ab5e-330bec67389f@googlegroups.com>
	<20190506104344.33303fdc@md1za8fc.ad001.siemens.net>
	<8a5e41f1-5533-42de-89a3-9ac5437751e5@googlegroups.com>
	<668d10f2-2880-4edb-8050-1dae941693bb@googlegroups.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Am Mon, 6 May 2019 12:26:42 -0700
schrieb Hakk=C4=B1 Kurumahmut <hkurumahmut84@hotmail.com>:

> Hi Henning,
>=20
> I have write new patch but I have not test it more. But it is more
> suitable for your advices.
>=20

That one looks very good and you can propose it with "git format-patch
--subject prefix PATCHv2" after a few more things. Again comments inline

> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 46c95fc2..985c1129 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -22,6 +22,7 @@ import struct
>  import os
>  import fnmatch
> =20
> +# root_dir =3D "/home/ubuntu/repos/siemens/jailhouse/data/"
>  root_dir =3D "/"

Do you already know about "jailhouse-config-collect" and the "-r"
switch for the config creator?

Needless to say that this should not become part of the patch. The same
applies to some whitespace diff and the debug prints.

>  def set_root_dir(dir):
> @@ -58,6 +59,7 @@
> inputs['files_intel'].add('/sys/firmware/acpi/tables/DMAR')
> inputs['files_amd'].add('/sys/firmware/acpi/tables/IVRS')=20
> =20
> +
>  def check_input_listed(name, optional=3DFalse):
>      set =3D inputs['files_opt']
>      if optional is False:
> @@ -94,14 +96,15 @@ def input_listdir(dir, wildcards):
> =20
> =20
>  def parse_iomem(pcidevices):
> -    regions =3D IOMemRegionTree.parse_iomem_tree(
> +    dmar_regions =3D []

this is already done inside the function and can be skipped

> +    (regions, dmar_regions) =3D IOMemRegionTree.parse_iomem_tree(
>          IOMemRegionTree.parse_iomem_file())
> =20
>      rom_region =3D MemRegion(0xc0000, 0xdffff, 'ROMs')
>      add_rom_region =3D False
> =20
>      ret =3D []
> -    dmar_regions =3D []
> +   =20
>      for r in regions:
>          append_r =3D True
>          # filter the list for MSI-X pages
> @@ -249,9 +252,14 @@ def parse_dmar(pcidevices, ioapics,
> dmar_regions): if d.iommu is None:
>                          d.iommu =3D len(units) - 1
>              offset +=3D 16 - offset
> +            print('DRHD: struct_len: %d offset: %2d -> flags: %d
> segment: %d base: 0x%x ' % (struct_len, offset, flags, segment,
> base)) + while offset < struct_len:
>                  (scope_type, scope_len, id, bus, dev, fn) =3D\
>                      parse_dmar_devscope(f)
> +
> +                print('DevScope: offset: %2d ->  scope_type: %d
> scope_len: %d id: %d bus: %d dev: %d fn: %d' % (offset, scope_type,
> scope_len, id, bus, dev, fn)) + # PCI Endpoint Device
>                  if scope_type =3D=3D 1:
>                      assert not (flags & 1)
> @@ -290,11 +298,15 @@ def parse_dmar(pcidevices, ioapics,
> dmar_regions): offset +=3D 8 - offset
>              (base, limit) =3D struct.unpack('<QQ', f.read(16))
>              offset +=3D 16
> +            print('RMRR: struct_len: %d offset: %2d ->  base: 0x%x
> limit: %d ' % (struct_len, offset, base, limit))=20
>              comments =3D []
>              while offset < struct_len:
>                  (scope_type, scope_len, id, bus, dev, fn) =3D\
>                      parse_dmar_devscope(f)
> +               =20
> +                print('DevScope: offset: %2d ->  scope_type: %d
> scope_len: %d id: %d bus: %d dev: %d fn: %d' % (offset, scope_type,
> scope_len, id, bus, dev, fn)) + if scope_type =3D=3D 1:
>                      comments.append('PCI device: %02x:%02x.%x' %
>                                      (bus, dev, fn))
> @@ -860,21 +872,21 @@ class IOMemRegionTree:
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
> -
> regions.extend(IOMemRegionTree.find_hpet_regions(tree))
> +
> regions.extend(IOMemRegionTree.find_regions_by_name(tree, string))=20
>          return regions
> =20
> @@ -882,6 +894,7 @@ class IOMemRegionTree:
>      @staticmethod
>      def parse_iomem_tree(tree):
>          regions =3D []
> +        dmar_regions =3D []
> =20
>          for tree in tree.children:
>              r =3D tree.region
> @@ -901,20 +914,23 @@ class IOMemRegionTree:
>              ):
>                  continue
> =20
> -            # generally blacklisted, unless we find an HPET behind it
> +            # generally blacklisted, with a few exceptions
>              if (s.lower() =3D=3D 'reserved'):
> -
> regions.extend(IOMemRegionTree.find_hpet_regions(tree))
> +
> regions.extend(IOMemRegionTree.find_regions_by_name(tree, 'HPET'))
> +
> dmar_regions.extend(IOMemRegionTree.find_regions_by_name(tree,
> 'dmar')) continue=20
>              # if the tree continues recurse further down ...
>              if (len(tree.children) > 0):
> -
> regions.extend(IOMemRegionTree.parse_iomem_tree(tree))
> +                (temp_regions, temp_dmar_regions) =3D
> IOMemRegionTree.parse_iomem_tree(tree)
> +                regions.extend(temp_regions)
> +                dmar_regions.extend(temp_dmar_regions)

Exactly the pattern i was about to suggest when i saw one previous
mail ;)

Looks all good to me and should be turned into a v2.

Henning

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
>=20
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20190507170634.7f1c97fb%40md1za8fc.ad001.siemens.net.
For more options, visit https://groups.google.com/d/optout.
