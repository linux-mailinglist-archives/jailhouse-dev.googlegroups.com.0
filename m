Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCGH5XWAKGQEHOIRPWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 16277CE8BE
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 18:10:49 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id q185sf3653491ljb.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 09:10:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570464648; cv=pass;
        d=google.com; s=arc-20160816;
        b=IOxHrgYA3xaKzVCfETpdih2HaP0mMa9J+mqfK70/s3d+9NHPCqp4n99nCgG/iUKrcJ
         0uZi5jsRGAlFYdFH0VYNPg2l6kGDZnfGApS3tSWk/qrw/I4L6ZNKiwoJRMUL+BsIOGZN
         hRsDVIFnOH9KaeaGem+cKSTRxKgdJ+GuXp1wEsFpkOYvRraLU0OIcSxlk/+udZJjjNid
         YqrS63n/h0dBGgneryB+SbBfTXsoHxnJKYca6tgu+s1WFp/CqNYDsCLUba3zfFMS3+Au
         HMHMrbhreQt2baLtAY6sazbST93/91AKLGijZQpoZ2+v7V5XXFw/g3VtNRSmIaJ7rNW+
         G/RA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=y4l3Kyb8pncr6rHI1U9uCwoG8Lmt/fk2GabERBDZvYQ=;
        b=rIekMQoV4VwAAofMZ846MRBvlB2NZWWPprdEkIatlHytrR2arbVvAhU9BGMJ4W7xBK
         BL95R5mQ5dXa6DwwlcS12SS78CwuqaPuU/jSE9HJUsu23UMBz4uNQ8uPlIun+4eArHDt
         4nMehveyVu3yeFNqjyHzD2IAkQmaMqMaTQ8DgdvQf+EsKbUCogp4HSUd9atSAqZwNY/Y
         +jMTjWOTQxrMunVNyhK4+kZYYSpYt/FjWjZFz+hMKU6PBTvLZKELOoI596Iqmx1z36+d
         P+VtMuNMUE/fM3wQFP84g5JRGbQ766M+NeCg4UKTxSfFAF87osfHTkGpQmLYaLEJjVna
         h2Vg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=y4l3Kyb8pncr6rHI1U9uCwoG8Lmt/fk2GabERBDZvYQ=;
        b=MssJ9fYsvSIwBf1uWI6jw3JboazyCfuTfsEdS1eXyGo6SeaTFyJ6McG8qgvo3XpRQg
         Fw3blkutPEOWc05fmTUgtGYLCOcN+j3/znES03FcZa9TGyKRYzj9j78B6n3mGvKsoHB8
         1f5NPmEHYxqwcLMgrveXwVLokhaWA73KZNN4VoWKNkHuIwxwfHfdtXE+Lv13YTR+AUNh
         Z9Wn81IG2CQv0MXhwi3TKNut2Ug2SPXi6A0W/WeirXLmnXQXnd7Jv64pHWwtdbk6cO9k
         9eLctnSEjg3C3z/dvVO6WQw4rtVXBhOS5Sex6cLxa1Dl398BXyuwxu6dDS5qhiEuKvUV
         HcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=y4l3Kyb8pncr6rHI1U9uCwoG8Lmt/fk2GabERBDZvYQ=;
        b=BzHFeMKxI3hHrgomAs/xCaFgLqbJ4Hp3WR07/W0Eg5Q7jujJc+2W2Hw45z1lXaLC3J
         PGnYkH79JimiifwJhwuSwDs7iURTidsv3lVvSnpkyYQVparJfnvYWfXE7T5W29iJ24fG
         exam/IuaX1jv+XmG+tjD8Y3GPHMFYQppWp0hoSiQMufKeg8Ld/lD7pejuDH6Ytlci9P6
         Q5FVYpmXSTrqVS34Hr0kPR8tjYnQR4GzKcsOc2MuOJNKqYdDrqAqANfNoN9tHaI9A9Kf
         AERZc5kU+kQiJCawiqIvQw7jqwt7/Pza0zmoEaVADBzdaBHV9oo9+r4LoONMAQK1Mpyr
         bAuQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUZR9P/5d4GnpgXpLckE+EyRATam1buN5BVfKoh1S0Jia9EzPms
	u3enecPYD6fzUwBZiZJirKs=
X-Google-Smtp-Source: APXvYqxbNwI3HGBkVACHyaI6zPrpyirh5NGY/GMDqTWM+3xDTm26B9Em98fZMOoWXVKPyiSAAex+bg==
X-Received: by 2002:a2e:4704:: with SMTP id u4mr19427706lja.203.1570464648578;
        Mon, 07 Oct 2019 09:10:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8915:: with SMTP id d21ls80946lji.0.gmail; Mon, 07 Oct
 2019 09:10:47 -0700 (PDT)
X-Received: by 2002:a2e:864a:: with SMTP id i10mr16294481ljj.245.1570464647801;
        Mon, 07 Oct 2019 09:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570464647; cv=none;
        d=google.com; s=arc-20160816;
        b=pzEFklkwtVX8l+jhN07Sc6JagHYhen128yqPxCtliIPwZzJQEsYmpy8NkZxZhs315F
         iseIAB25U68OHrBlEz1Vh1W5sMRHrOtyvAsDi3c7B6rCcoQFd7a1r4wlO6aIraGXimyZ
         cL+AUiJSYXEJIHDXFv2delSh/pajNIrLJHW1NI+DaEaWCauV4uRcbzwjMU+gp3Qhyg35
         VX5/puf7fMNeVEK4ULTPwOOiOIdL65wtysvkYQ+kx7hrQkp1kclzyWwvOlPtMYIVhJus
         c5veEh9/+4sCCspgkFdy05sJg6xcmLu8rm3neu7/AGVIkEhvN1dvIUQ/lnwL4TqNEY3f
         c/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=pp9JHZSRePhVyctcqGoTSfHNeRpzJ/xI0Hy409aiu/Q=;
        b=KEPNL69mPf+VQK6UrJ4I6/yLpjl33K8I2egmN5H/Mw7GLglddaiDC3lsbw/3wf3Fc0
         fThAIRMtTWc55qKine2Onl/368mbjJoz/H2NvJlZ5HQ92/sqZNhi7slA5okSurTiEywK
         jG/liZ/d4LVjP+pCDyCe/qHmEbH+C8YzWosSx2j7ahf1XOl+Mu2CKxPpk0Nw+l2cynmq
         DS/GxmoA4fI6AZAX8vxt6BXopRG4BbnQxo7fvQrQgnixlZwi7RKK3yoGBnnLTQif2jjC
         H9Vtw3LB8sry4Zf3p4uC/Xo0xhpT4MVx4zJrRQ28Gm/6p5LBM0Tsi/5btkOSi1QS9ElT
         ANSg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z4si1101824lfe.4.2019.10.07.09.10.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 09:10:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x97GAkVP028438
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Oct 2019 18:10:47 +0200
Received: from [139.23.77.210] ([139.23.77.210])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x97GAk3O017694;
	Mon, 7 Oct 2019 18:10:46 +0200
Subject: Re: [PATCH v3 06/14] pyjailhouse: sysfs_parser: introduce new class
 IORegionTree
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>, ralf.ramsauer@othr.de,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <20190930191323.32266-7-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <81b3858e-05d3-abce-0f43-940656627592@siemens.com>
Date: Mon, 7 Oct 2019 18:10:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930191323.32266-7-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 30.09.19 21:13, Andrej Utz wrote:
> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> 
> Do this step by step. First of all, let's create a new routine that is able to
> parse a line from /proc/iomem or /proc/ioports. Both files share the same
> layout, so we can use a common parser.
> 
> Passing the destination type of the entry to the parser allows to share code.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  pyjailhouse/sysfs_parser.py | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index b0a9bf44..a179461d 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -824,6 +824,17 @@ class IOAPIC:
>          return (self.iommu << 16) | self.bdf
>  
>  
> +class IORegionTree:
> +    @staticmethod
> +    def parse_io_line(line, TargetClass):
> +        region, type = line.split(' : ', 1)

(region, type)

> +        level = int(region.count(' ') / 2) + 1
> +        type = type.strip()
> +        region = [r.strip() for r in region.split('-', 1)]
> +
> +        return level, TargetClass(int(region[0], 16), int(region[1], 16), type)

Doesn't the style checker complain about a long line here?

However, this looks a bit nicer now.

> +
> +
>  class IOMemRegionTree:
>      def __init__(self, region, level):
>          self.region = region
> @@ -864,14 +875,6 @@ class IOMemRegionTree:
>  
>          return [before_kernel, kernel_region, after_kernel]
>  
> -    @staticmethod
> -    def parse_iomem_line(line):
> -        a = line.split(':', 1)
> -        level = int(a[0].count(' ') / 2) + 1
> -        region = a[0].split('-', 1)
> -        a[1] = a[1].strip()
> -        return level, MemRegion(int(region[0], 16), int(region[1], 16), a[1])
> -
>      @staticmethod
>      def parse_iomem_file():
>          root = IOMemRegionTree(None, 0)
> @@ -879,7 +882,7 @@ class IOMemRegionTree:
>          lastlevel = 0
>          lastnode = root
>          for line in f:
> -            (level, r) = IOMemRegionTree.parse_iomem_line(line)
> +            level, r = IORegionTree.parse_io_line(line, MemRegion)

Style again.

>              t = IOMemRegionTree(r, level)
>              if (t.level > lastlevel):
>                  t.parent = lastnode
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/81b3858e-05d3-abce-0f43-940656627592%40siemens.com.
