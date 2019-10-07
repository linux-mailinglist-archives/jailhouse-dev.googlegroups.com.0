Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHWN5XWAKGQEFM223TI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE08CE912
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 18:23:58 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id c23sf9357591edb.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 09:23:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570465438; cv=pass;
        d=google.com; s=arc-20160816;
        b=Vac+uZeRDHaWgT95Y1aNnpkRdob1ZRtMShkbbrCKT9m6hWp43hUtywbGWZ8qN2hVb3
         hhnQBikv/ee04NQbhJ+PdKBE56/JZJrvy/vduYE3B9+S5roOb3KKCOi/fXFN2O6Vx8Zu
         v5h+FnvgSV3PqNcN9iU7NsANAzMGqspZhV12wwTgxqv5Ik+wb9zV3s3DK19kFtgKoQBD
         XrJAxGRxqs9mlxx5vbOAvKK0QbaOSl24mR0McBGmaxBmWVH5EEpsHXeOVm4gXgj7F7GX
         Tr+oJxoxwivYGcwOWcongC6Wk5zRGuu6WrlMYgR9PhJeCMLb9F+8GM78BNWCcU2gid6j
         eltA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=LpkyoYx2SIOmNbn1Sj0kgtYBAwE7AWzywPs3R0XnjzY=;
        b=zC6Bhgd/LhmOODfpzFLTS5cWpf/dpUsfOOg41xuN25AlHKKmX3DPUSmaco5cYwlTCB
         UcKJr+YAMLZeRFMjBWFa96+tJJA/B8FYcFMXs5WYisOKYgF+j0KtGAAAIai7xCIXePLr
         tplfgm+z97vcgme/dPMmqAfqoQv0JIdylTmTVAlATlrg+ydswCo+J3c1BkOjftDibW+R
         bA4EqNe7V82wjPJg1BPXbjXaGUhSxTVj8be8FbAE7qel8ndlkvffiNhumI3+I4IO2Qid
         +tkG5n8pJ7fL2DPV/PcVpiZOB06rf5TkY/S2WmpXK3pASizbraxDdgxQYLO0C6myKwuh
         e4Bw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LpkyoYx2SIOmNbn1Sj0kgtYBAwE7AWzywPs3R0XnjzY=;
        b=L0OzwKb4JBkoi7xo0MjoDgg5VOl2aXTwsFNuFbJHu+ofsboOYegWsFAnQs89Mhzmw6
         M96rQ0LU/l+RnPhjis3LImvlM2Hxy5wnFWMHYNcnwoV9VZzy5l46TErapMHiTyN3DTjF
         8ykdgvyz+C6w+zulmrxlO0bBQgi4F37N9dGYhDicy2G2k86tkfd9Fn99gM0SG8GfQ2EL
         LiIWyM/8GsSI4UR+trPd4ngY+kL3oGsAF6KRq/6NxR6zoU5yR2osTx/GyqrmEEk1lbnh
         OVu52kIvJ1g4KaI2eEg+Ma7ec6T2M6qxZcjBi9OY+IWTDzfSCs9ruPjwvo/L7Kk5xLf1
         MFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=LpkyoYx2SIOmNbn1Sj0kgtYBAwE7AWzywPs3R0XnjzY=;
        b=hXIfJOeShvRqOzg9HetbKPF+jl6b2w5aE6hYhg3CGRvQZgfP/pQP0wJB/beeH1ja1A
         Kqocf3/ft0EAuSpo7bsaoUlqWUkzk8NOnJMby9t1yKax6MSBOcTaE/5d7VyT7kDea9+M
         dkEnOXvdWhL+YiMlEQpzv9LZ7lZftnu9XYnbEWgRH0dZw4a18IdHkfpDpSrlo/bCknoR
         kv6ER1iVJqYKsY4yaaSry1Zx6ZX1rpRr932xXo6p0/rra0LtEbEmEXQ5/zN8XxzfE1xg
         IbNXOy/EnfD4n9gRHl7N2O1z7CaxndJgZRMSxFi+9+upjSKY5TFjXbfGL71o0MFRtQ64
         mT7w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWVzi8sJiG8c4322UzLaYaZba4ZD7+B6/NvJYY1F069fCsaePWs
	TZzdtUvNhooG/KcRvttVvJE=
X-Google-Smtp-Source: APXvYqxMw50HwqpuFTTpcxTCLYY3Fh27dtuUJ7tfwiq2wzYKn8yXk/p4Dzl+mS65OHEu04AOXnPQ+A==
X-Received: by 2002:a17:906:3083:: with SMTP id 3mr24198887ejv.259.1570465438676;
        Mon, 07 Oct 2019 09:23:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:1114:: with SMTP id qu20ls129755ejb.7.gmail; Mon, 07
 Oct 2019 09:23:57 -0700 (PDT)
X-Received: by 2002:a17:907:20c1:: with SMTP id qq1mr24391553ejb.87.1570465437453;
        Mon, 07 Oct 2019 09:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570465437; cv=none;
        d=google.com; s=arc-20160816;
        b=m1Q0fvfU0JzyG73oCwGQTUNZw60R6TBwbZLb6+GExyjZiChHnMxUy4af1qGlXo5ZyX
         zb275/ogoovet+kGPNY1u0VWtu/n78xcgYqnegXvU0UrOyYVwcYWDxGXHUBcD+f2jVLs
         Kj7jcUBnnMj21ILuEEYWJlidHkCqTjuN/nmfHBUmUIDS8wmgwGoQFN7mIIdWvATYkULX
         XA1NMbGWwTCK9FVv5r298BaibRg0fX/bE1RIFO13+hg1uptiwuqCWimbdq8XaolZDUyj
         t9/RPgdQSBQL+7Fvxa6q1JeelkPdI9D33aLiT8NfShOxUhfDOK5XlGUXQpyHtu98pkw0
         F/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=YEjyuafKUoCKl9JHdZWm41EYWWgTJszFJJ5bydp+yco=;
        b=H9a3hREVLO/Zl7FqfcDjdQi/ePp1RnK3ty07VdWmCVozRr5I+xcLhy2dH4QWuLKd9F
         sb/704YMXX9hsCG9psZQB81OVoUWY1OzBGg6kajIDPQ89I1rnlWZB6kwTns93YYmN7Ye
         s1gIkEZddyNcSVP+UYz7XX5A1bftPsM64C5wDFzM6O9bbApiL/xGnLNhQrJTsj1ydZju
         NhLb33gNJxMzeqqEUE/ih9h2wt/G2hLHvaHOIZ/hbHWEO0n02L1ZQpDbfQt60kSbmx1A
         hNi/JHKrea4LRndRYOPNr8f/pvjjXk4/5iKbLp9W859ywnoJHQufWHWnOheqnpOt7Rqr
         4htw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id d14si1149063edb.4.2019.10.07.09.23.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 09:23:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x97GNunQ001625
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Oct 2019 18:23:57 +0200
Received: from [139.23.77.210] ([139.23.77.210])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x97GNu1m009311;
	Mon, 7 Oct 2019 18:23:56 +0200
Subject: Re: [PATCH v3 09/14] pyjailhouse: sysfs_parser: entirely separate IO
 parsers
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <20190930193857.2866-1-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1e561df2-a136-2fd1-0c28-d51e026a0704@siemens.com>
Date: Mon, 7 Oct 2019 18:23:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930193857.2866-1-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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
> Everything is in place, we can separate IOMemRegionTree from IORegionTree.
> Let's give IORegionTree its own constructor.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  pyjailhouse/sysfs_parser.py | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index cbd6069d..50ca62fc 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -825,6 +825,12 @@ class IOAPIC:
>  
>  
>  class IORegionTree:
> +    def __init__(self, region, level):
> +        self.region = region
> +        self.level = level
> +        self.parent = None
> +        self.children = []
> +
>      @staticmethod
>      def parse_io_line(line, TargetClass):
>          region, type = line.split(' : ', 1)
> @@ -836,13 +842,13 @@ class IORegionTree:
>  
>      @staticmethod
>      def parse_io_file(filename, TargetClass):
> -        root = IOMemRegionTree(None, 0)
> +        root = IORegionTree(None, 0)
>          f = input_open(filename)
>          lastlevel = 0
>          lastnode = root
>          for line in f:
>              level, r = IORegionTree.parse_io_line(line, TargetClass)
> -            t = IOMemRegionTree(r, level)
> +            t = IORegionTree(r, level)
>              if t.level > lastlevel:
>                  t.parent = lastnode
>              if t.level == lastlevel:
> @@ -862,12 +868,6 @@ class IORegionTree:
>  
>  
>  class IOMemRegionTree:
> -    def __init__(self, region, level):
> -        self.region = region
> -        self.level = level
> -        self.parent = None
> -        self.children = []
> -

Is IOMemRegionTree now only defining a namespace, no longer an object?
Looks a bit weird as such.

>      @staticmethod
>      def regions_split_by_kernel(tree):
>          kernel = [x for x in tree.children if
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1e561df2-a136-2fd1-0c28-d51e026a0704%40siemens.com.
