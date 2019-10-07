Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB26P5XWAKGQEX6C2CNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 835CECE937
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 18:29:32 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id b90sf3681240ljf.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 09:29:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570465772; cv=pass;
        d=google.com; s=arc-20160816;
        b=IRoKXnLYu9r0TJhrth9OeU/ULBJ9aoRV3z0tlWvrbAvrkJ3fHQCWBzYgLcDgqgq77/
         AygrbqS6ubYcdfMBfJVk+yR3NpqxXMF1b0OOKdCL1Vm2yqUgktbuQ8w3WZPLTOwhknIx
         SrnRhtGjoYsb2BJkfBtcUvGamcNFFEGrHPQwpH1K+Bf5rv3B8XH1MRBdOCCdF4oRVbeu
         JZLejiw/dZynLuHtICsnibGt+iiES/wRqFXuo0b3dttOGUWJEWlQLexkHR0M5+z++ech
         OgjaefIO4dp/phNtUHJvO1rXFIWNAhtw7Qw0wN6+HF35mk1+04463wdciswNTjB7RBmv
         v++w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=Jbcyyiuio8dn4PQXOKR2LYuX5n592lvuRbC7MU7zfSA=;
        b=bhfqheBQBhZYGqni2U2yBAH3ffJqPgAbv0ILLkH2M6aAYUmPSgg3cPsZI3mik3IFt8
         4T1rd4ZCTfqyLfKGVTuFe2eYnIpKnFS23x2MkRzVwL32u2OVpWR9oN3CbCfUc8m8gQUR
         738ALD6/E9ZmHSCmIPOT/0oVzH1gxs2hj0rsDSW+PNIUqfQelcoZElm9mqArYPP2iuRA
         MZQhsrC9akt7Sb3e2/RBwoJ0SOB/RXBnoPymiN+Bptd3Rn+ShMxl9nA2Tr3D2Jfrp3M6
         YfNWioGZIsdo+xn3rKlUVEuWZfh01WKT+uFnNRFJxSy7iLj27mpCwiz8iCB0UUFjcT9g
         nr2g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Jbcyyiuio8dn4PQXOKR2LYuX5n592lvuRbC7MU7zfSA=;
        b=W79dEGjr0sQKxSk9+64XqGWuaBKu/YWDI+SgHjgCXXA8WMPIARGBeA6eXM9feJz9C8
         QVCeNi2WcyxNxUkmyiiah63ltywX2rsMa8/ZNV/3t/A4SkhWmJ/CfHAegwRhuy4vrjFj
         ZJT1OtB8dBw+h9UQZ8PZreN2BmLpyUhXsMFHzI+2Bc5w4YfqLsTSaBkXlrrq+pNhdLxE
         W2ZgFo5biTjtfbJRapx3Df6OgsWazpyaoOFtl/MKuUfks/KyiMC4hk9wjS0yvSYygfCe
         xQnOyCyyl5VFoRrFbhE2/fjKzSJdGUkiUmJp/5kkvbqyam4dN8TMqhYZTwii7DpBCxTF
         Xnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Jbcyyiuio8dn4PQXOKR2LYuX5n592lvuRbC7MU7zfSA=;
        b=T08f1HPAgfzSWSl3WgAMoCdUjgKoqH9cu2idQ70/x86ZKswVmFUu11salRysJWdpXI
         39j+6Dg471XtBGpUz80NcsUGpl7YRLfLg99cjX4j2wrnchX0WTcK59wjgHROpXGgNnQm
         +nSi7dii5BHIc8DJK7ybyQzf9CZdkupeCHFiXx77XOqWIN3+df3bqIByrGYignS7vJjn
         6vHxufNjJInAhynt1U5ytrAlNVd5pWEfn16+9nAcIBZ+My5LhAfLdHKfC4BJ4Qn4cVS2
         m3K1bjYQN7Jxxyw7iJbde+ziEc666Q+WjovBPBJJgmE4dxZ8r+QDGcL7wVl1SjRiBWqC
         7HJA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVrWJ1FBu6ZmOL6H/JirnNHq4DVlBvILyUTV88zz4/Y7ksVIPpW
	25Rs44BpaVT3IoGBil92O9A=
X-Google-Smtp-Source: APXvYqxe7nV6wtNtgsDoxx3+V0JpV0htBV9F2aZRpHj4wYMdOhrEg6YDU2XeFxk9yrdmzikQDoXIjA==
X-Received: by 2002:a19:6748:: with SMTP id e8mr724460lfj.136.1570465772114;
        Mon, 07 Oct 2019 09:29:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9246:: with SMTP id v6ls87100ljg.6.gmail; Mon, 07 Oct
 2019 09:29:31 -0700 (PDT)
X-Received: by 2002:a2e:8802:: with SMTP id x2mr14112512ljh.113.1570465771279;
        Mon, 07 Oct 2019 09:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570465771; cv=none;
        d=google.com; s=arc-20160816;
        b=zoPH3EuOYBDLnG4SwzHt0meoWOMmxN2KqCLYG+FFtYtygoCjmKB3zIdF31O4UnzRff
         qG8icbS3aJk2eKijYmNizbKdL5WNzaej3B0cNIjXZPrSmUSrQusx3SsoGfZ1KW+HfKyU
         +jdOk6xyvI4rCF4XZrk1T1p6zXgrwlTvkiZdJf+QeR70mqdKTN37xH2p68UGROMnVqj7
         oeKjVVRI6SixXbfxmTgxJ+Si238nxa8X7TQ1ULbkW/TAros16wmpfO0c0HxuKqEAfGYA
         8VlZYY7F/myFz3EgqPpWoA0cMDZLqqh0JjmQTPbssYRmOpqKVsaQSoEnUatnPMtfbvTZ
         I9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=n3TjRVTO69hPj8j9QvOZ7cudh0U1myf9O83mcj+4yaQ=;
        b=DAQtxjxXQQq04umozotHi9mGhqq7+QLgqKZB1MlxmJdxrjgTYZcwtoecxYZ4YkWaV2
         0qUXvWc6oAtKJuE5YvcafYJRTVC+tUXCXAReAlvk/saOxqUOZfQu3KtQ4rOi+owh/SO4
         G9UfFP5Qbw6A3J2/1SxUsnEQ5OaM+7cTdxVeRS8rqSf8zuxKXRS2TV8/N3Oml3Cueavn
         nIWSh2bnmH9gs3Ew5JYbLljicTf4lHic7MURP0HC3iAMIisfjCoOgBHrEReZ05i4Derf
         p4wmXfBpl4l7dZMNJ0ZJiruaoTTgCCRVRzlIhqEead0uDU2vEwi/ijJY84rwn0IRlSO0
         4BTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id y6si945926lji.0.2019.10.07.09.29.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 09:29:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x97GTUIV025285
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Oct 2019 18:29:30 +0200
Received: from [139.23.77.210] ([139.23.77.210])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x97GTUIk019327;
	Mon, 7 Oct 2019 18:29:30 +0200
Subject: Re: [PATCH v3 11/14] pyjailhouse: sysfs_parser: move
 find_regions_by_name to IORegionTree
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <20190930193857.2866-1-andrej.utz@st.oth-regensburg.de>
 <20190930193857.2866-3-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8a2c4fd1-fa38-b0bb-1665-64ddb1bf5255@siemens.com>
Date: Mon, 7 Oct 2019 18:29:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930193857.2866-3-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
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

On 30.09.19 21:38, Andrej Utz wrote:
> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> 
> We will reuse that function, move it to IORegionTree.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  pyjailhouse/sysfs_parser.py | 42 +++++++++++++++++--------------------
>  1 file changed, 19 insertions(+), 23 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index d2b36876..3027f82e 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -831,6 +831,23 @@ class IORegionTree:
>          self.parent = None
>          self.children = []
>  
> +    # find specific regions in tree
> +    def find_regions_by_name(self, name):
> +        regions = []
> +
> +        for tree in self.children:
> +            r = tree.region
> +            s = r.typestr
> +
> +            if s.find(name) >= 0:

I just wonder if we intentionally matched on anything inside s. Or if we
should match on the beginning.

> +                regions.append(r)
> +
> +            # if the tree continues recurse further down ...
> +            if len(tree.children) > 0:
> +                regions.extend(tree.find_regions_by_name(name))
> +
> +        return regions
> +
>      @staticmethod
>      def parse_io_line(line, TargetClass):
>          region, type = line.split(' : ', 1)
> @@ -902,25 +919,6 @@ class IOMemRegionTree:
>  
>          return [before_kernel, kernel_region, after_kernel]
>  
> -    # find specific regions in tree
> -    @staticmethod
> -    def find_regions_by_name(tree, name):
> -        regions = []
> -
> -        for tree in tree.children:
> -            r = tree.region
> -            s = r.typestr
> -
> -            if s.find(name) >= 0:
> -                regions.append(r)
> -
> -            # if the tree continues recurse further down ...
> -            if len(tree.children) > 0:
> -                regions.extend(
> -                    IOMemRegionTree.find_regions_by_name(tree, name))
> -
> -        return regions
> -
>      # recurse down the tree
>      @staticmethod
>      def parse_iomem_tree(tree):
> @@ -944,10 +942,8 @@ class IOMemRegionTree:
>  
>              # generally blacklisted, with a few exceptions
>              if s.lower() == 'reserved':
> -                regions.extend(
> -                    IOMemRegionTree.find_regions_by_name(tree, 'HPET'))
> -                dmar_regions.extend(
> -                    IOMemRegionTree.find_regions_by_name(tree, 'dmar'))
> +                regions.extend(tree.find_regions_by_name('HPET'))
> +                dmar_regions.extend(tree.find_regions_by_name('dmar'))
>                  continue
>  
>              # if the tree continues recurse further down ...
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8a2c4fd1-fa38-b0bb-1665-64ddb1bf5255%40siemens.com.
