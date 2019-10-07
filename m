Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLWI5XWAKGQE7JLUWGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id B01BCCE8D0
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 18:13:34 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id s19sf39273wmj.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 09:13:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570464814; cv=pass;
        d=google.com; s=arc-20160816;
        b=eTZsNcywX5sjaOUgB+49JydDSQBbnROX4QsyKIyixFfnM+sQ0tXpUeRKQRnKNvpcKp
         Bymdlcsu2zC34oElLOOreyPTs97Z4DgA6g5+7so98j0rGimTlQUSwb/CTbPIWUTkmx3m
         CcIKvzfjG7/AVAZ7ESOS8dAvVfvNDNO/hQd3osL16lx4kKOyXNPcmZIQ+gA9zffq7EvJ
         Get88PMBvDuxLvFqvv8N0+kVhQ4B+33ZmYceI2aiIzLQzE9QdWTzh8QBNKXDoLNPodMh
         6PWKcm2fbPhaNcJgl9cDRwF3eLHKPfmGiM+0OYuamc7+qywP09FnG8flYb2H264f4dvC
         4r5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=dtVZlILbmWBDwc4LJqqrYWnBr9zzKHw3//Gf24t9Wdg=;
        b=UiWwVSmKS+ivQg3f6L1NEuXzM8G9xKvsdICFT9mYFGaukY1dEa7CPl9BrHj05LBNOf
         fGpv5zW6oNeBYKsPwy3bTBjCKi05rKpKjjnxi90MGyVxUiHvt9Bejd4htw3/OtrwFreu
         K9nqIpjWdQKxHe4WZoW3nC2CLEXgDoACH8OuzHYHChQgTIrkbOY7XDAMR+GqfRpetFyu
         7Rin53iA3GMMUd1ZKBuOl9mMQRC1lOkSnReq6qGVqhkQ0t0gbUN2DA4N7xArAexyRs2E
         UOZaAqQfGBEDLd+skeOX6fhXVwZaUasTKTKcGRu7VwMYWivCc18dhO9Nf4JpTRAcSEta
         +grw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dtVZlILbmWBDwc4LJqqrYWnBr9zzKHw3//Gf24t9Wdg=;
        b=bu0c1Fnbb/LcK3rNn2HKT8b2qgp3zid3RPH6UY2dnFPPCqDHTZVHhveSLE3dR9C3Qp
         hgcWTmoI6oF+A0laoYGrTGXGO6aBlIGNhanvUHj553YRO/CZEVfk87kDh59xgYrtc2FG
         XHd4X0NRROpGBJUztC8dXJKgNG+evDVggpr/+yADpt8DXhFay9pvxfWSjM2NxPqkuqIJ
         rZcV5kUyjLLnTIrpZKMGENbEAmvrSDBj4Mi2oyZl56uektcNxrVSR3y+emIS0Za/R2x5
         Q28tsiTYOBBmUzb909Tb17ASKbi9XunyI7TPQ2FzDtWlPKOLPLfVjBo98RgRobvbWb4r
         lQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=dtVZlILbmWBDwc4LJqqrYWnBr9zzKHw3//Gf24t9Wdg=;
        b=Z1uLyi+xQN1EJiteMV/G5kMRUbeEMIICR0CWQHiefNK8dOHGhPAoWDJqrd/SL18sQl
         Qe8JMdsYZupra4gLy4nV4kFTfmN8vE2T/iEXgcdszsvcwxOWJvQGZfmsxh3uqNlGr49U
         xgvPVwfTOjkYhU25lPJiGE0XnmA4kJRi2IH1uuCqr0pvRql9u+4s5WW2vQDFrZCP25Wt
         E9h1y9l1KwA4MI20UIypqGJfaYe3kOJlvPvaw4ijv2nCy4eI2R6ck9byjcx4e2BwSoKo
         nsSB3m5SFS3fmf74PIloThyXRQJ0S9Qe5XHpzM02uT+6d+NkL2ewSQuTf+MPVw2UKT5I
         IAaQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVeXBEgqmBLm2lphWvv8e9WZEXCTU0eunKyAPf2IoX/ZT6xoCqg
	RREfga7bk1zfYI7LFOomj74=
X-Google-Smtp-Source: APXvYqx4+1ycTTj6nqtEjr37UW4F/AUs5KxHCPJEtcIyEKjtoRQSvumJNeZUpHt/1HEaPH1/oc3DSg==
X-Received: by 2002:adf:ce05:: with SMTP id p5mr23805100wrn.48.1570464814431;
        Mon, 07 Oct 2019 09:13:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9dc8:: with SMTP id g191ls12532wme.2.gmail; Mon, 07 Oct
 2019 09:13:33 -0700 (PDT)
X-Received: by 2002:a7b:c088:: with SMTP id r8mr87523wmh.44.1570464813689;
        Mon, 07 Oct 2019 09:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570464813; cv=none;
        d=google.com; s=arc-20160816;
        b=YJDTE44j1S8msiExAj5EHUsr5we3bJXl7hLE/lNOnKg7wsc1kUez/YEDLgEuhcO/Vy
         4/q6daqxT9hT134YdoUQBc+x9BlrTCvddqVNRV8jWcIcjWq9o7iMQAMQ+ixxs4+qm05C
         1lv5mU3NsBeuzmS6cMJ5L9I5nRi4QUdeULLWzYXw/xaOvSFsUMyzG0Uksbzvht5Syrjh
         3lrXlet9duJl//uCIQh3Yd7q7WDjPxO+Xdu1c17+PsUwFlWJmU1lMIOKzqnYUrxMFwUu
         kQ2rrHyIu5YQTE9JgxGnXlx9Xa0YddVUqqcEQ36yBNLDa7yAZE6wWc2junSesPIiknp/
         IvfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=WylxgtCUk20G/xJQ2MTaTLRZ0Skkz8m6w+doOGfGu4w=;
        b=pylCJuawE7fHzQ7pXDp38J8Mjt9Sq2jF51AyfgQY0HHtAZoYjUK/EiXX+EXsSb5LVq
         ZfCOLUMR92q9l+xZAkMntfP04+MxlaIsSh02rTd8qUmFgVQDF7j2QdwdCOL/zxttS1ql
         FCLAk+qavHXVvbQ3OWC/ZyA7oDdbfKuOMubD5HUuea5l6F5i7U0Ch4admwjQ2kCZsrb5
         sAhqwbsyJNKZd8Xdb8qvGHEmqR6TXfV0oy+nk7jqWeN/T+K/95NYXQeEC0gZpeO3b9yx
         sRZPXqn0hh/fZQ6qYsGInX1zvQcyY3Y7LsX+nGyzXmfHoZo8RGHsUIMRHqXNMZwopOmK
         l3OA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id x8si4920wmk.2.2019.10.07.09.13.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 09:13:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x97GDX2F032046
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Oct 2019 18:13:33 +0200
Received: from [139.23.77.210] ([139.23.77.210])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x97GDXFS021928;
	Mon, 7 Oct 2019 18:13:33 +0200
Subject: Re: [PATCH v3 07/14] pyjailhouse: sysfs_parser: move parse_iomem_file
 to the new parser
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>, ralf.ramsauer@othr.de,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <20190930191323.32266-8-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <555f58d6-8497-3cbd-dc33-5731df8ca2af@siemens.com>
Date: Mon, 7 Oct 2019 18:13:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930191323.32266-8-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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
> Move the next part to the new class: the whole file parser.
> 
> For the moment, this leaves an ugly one-liner in parse_iomem_file, but let's
> keep it for the moment -- we'll clean that up later.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  pyjailhouse/sysfs_parser.py | 50 ++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 23 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index a179461d..b72be367 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -834,6 +834,32 @@ class IORegionTree:
>  
>          return level, TargetClass(int(region[0], 16), int(region[1], 16), type)
>  
> +    @staticmethod
> +    def parse_io_file(filename, TargetClass):
> +        root = IOMemRegionTree(None, 0)
> +        f = input_open(filename)
> +        lastlevel = 0
> +        lastnode = root
> +        for line in f:
> +            level, r = IORegionTree.parse_io_line(line, TargetClass)

Style.

> +            t = IOMemRegionTree(r, level)
> +            if t.level > lastlevel:
> +                t.parent = lastnode
> +            if t.level == lastlevel:
> +                t.parent = lastnode.parent
> +            if t.level < lastlevel:
> +                p = lastnode.parent
> +                while t.level < p.level:
> +                    p = p.parent
> +                t.parent = p.parent
> +
> +            t.parent.children.append(t)
> +            lastnode = t
> +            lastlevel = t.level
> +        f.close()
> +
> +        return root
> +
>  
>  class IOMemRegionTree:
>      def __init__(self, region, level):
> @@ -877,29 +903,7 @@ class IOMemRegionTree:
>  
>      @staticmethod
>      def parse_iomem_file():
> -        root = IOMemRegionTree(None, 0)
> -        f = input_open('/proc/iomem')
> -        lastlevel = 0
> -        lastnode = root
> -        for line in f:
> -            level, r = IORegionTree.parse_io_line(line, MemRegion)
> -            t = IOMemRegionTree(r, level)
> -            if (t.level > lastlevel):
> -                t.parent = lastnode
> -            if (t.level == lastlevel):
> -                t.parent = lastnode.parent
> -            if (t.level < lastlevel):
> -                p = lastnode.parent
> -                while(t.level < p.level):
> -                    p = p.parent
> -                t.parent = p.parent
> -
> -            t.parent.children.append(t)
> -            lastnode = t
> -            lastlevel = t.level
> -        f.close()
> -
> -        return root
> +        return IORegionTree.parse_io_file('/proc/iomem', MemRegion)
>  
>      # find specific regions in tree
>      @staticmethod
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/555f58d6-8497-3cbd-dc33-5731df8ca2af%40siemens.com.
