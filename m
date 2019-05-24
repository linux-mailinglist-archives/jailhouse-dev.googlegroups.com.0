Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKOLT7TQKGQEZYF5OKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBC329823
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 May 2019 14:38:01 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id r18sf3156251wra.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 24 May 2019 05:38:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558701481; cv=pass;
        d=google.com; s=arc-20160816;
        b=MFuaPUTGc5T9jrVkzGAjboK+3bUHnfk9lKmjYyIo6oZzmKFDO4pmIl7DxbhqFJtq/L
         gQsQoO1WaAPW5MmATGUJe7ESurNTmwx4YoSghhxDeGt8NvWN7ookIY5jbwhL0e16DrEG
         h33niBDlmrJsqcRrKSc60pVnyCVtti6s3nA3/fV2+/9GzFZLeQy86ojWXqPxQL/N9Ar3
         2LVpxOBWSuONKiqGd9q/KF7zr2LyRWxux3xzBYwpL3oo2gaxBLwBf9exg17TEvktvZNI
         JIzYSG3guitRuchqzG5cz6I0l980hpB7+mirTkQl6l1eCEUXgDcyAl9ycAQltzSgtxzj
         vUfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Qt2rABuKQM5BuSppxAx+nQKMva+1QfG//CiXeEkwL6U=;
        b=qMDJb3y4rECG3XaPq6qizuHfKNj2QCR7ZvfQcptg1q7a8utZ+9dgvw7gQ9tGduTyU+
         5U//WTwZTo1aDsVigz52RFIeInjiNAijkVHqybOMft1Tg3JsdsSTpTjWUkv4yH/aMpQs
         jQGWCVf9L2dO1Or0/0GmZb0FHE+Gw5VwChdQFCtPHg9RTrOdz4SZVAtSXEChmOg7YdlB
         w0nM/inkTWBlRBMhQUV+vdLaeMTogijn9R6kQzzfZaJGB315BN8Z71DxfbTQRSNCW/ST
         30yddAummhEs76J4miPHbF5WbZoABwqwb7ogOYQPiGeF7HawPjzmatBzNPBfOYe+773U
         jjHw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Qt2rABuKQM5BuSppxAx+nQKMva+1QfG//CiXeEkwL6U=;
        b=MK1NyBHVxkLOxnM/kFtxfVMgRF3VM/k1x2SrGrjEVdSXldhz2wyiV+Fb7ASKXIJrP9
         PByCK1Jub2Cd7+WlbABWoDbyAPVp49xxyCrNek7hbHZG4TNDPHc6B/247TFMAGr2uO2N
         goSc2L+itePLQxiv1YU+ADopwVCI01ZyjmQtMm0dWnAHrEH0nLT5LYLOWlzYzd2N9KyD
         EoHHdI6IUndLNJFBIqXNZrEGmW0n5f9bbJ3lREGFlNE7TUePWcgnAZv7m8VZ4U1nfVau
         YRu82ToquBF61VGdKnBSNGjeHlACTGn2IEO/l+p0jZEalq8V3OmV9RICILKbLbPPlVxQ
         nXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Qt2rABuKQM5BuSppxAx+nQKMva+1QfG//CiXeEkwL6U=;
        b=YLhQTkr5EaFhlo73CgfdoYSXFndaHC+luZG06Qw/j9TCpiizEW9YkIzPt0X2TaMTAG
         I0ZoFsIp7NG2+pPm1a7wKOnC/H1ul/9HZDJMDDyj6TJSAmKYg9Z8rd09x6NxKEk+JtdV
         9Rg1/d1/zGMA4gwH/7LR59k/Xoml+CI2ACvedkZLkvwxeCGtN9lAK2GDhr6PFvtK51xx
         JtVth1yI9BW72pbJfnIe6pvSlvNEWqtrwfCizcVKEWA1QpQehctsCt2/6SvZRZiA2QZM
         G0bcEpwP1AMnP8olmDhZYle/tEETa6ExJ80Ii8vT/u6/IhH6ZWW7SsduYdsFQy/5a+VR
         NKew==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVYA5wW2D2I3pGM7CLXzFc44/4jpKgeZTvI5uGpfAiJYnswbaas
	vJBLq7MPqTLSSprcSc8/r8E=
X-Google-Smtp-Source: APXvYqyL6jmM2jBvGPcHdoUQgqf2A7S5GevtI8soHObm2pDS7g+63YRv7vtrzEtuYyGWAC0MZwFHwA==
X-Received: by 2002:a7b:c301:: with SMTP id k1mr522755wmj.43.1558701481195;
        Fri, 24 May 2019 05:38:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:c586:: with SMTP id v128ls2767967wmf.1.gmail; Fri, 24
 May 2019 05:38:00 -0700 (PDT)
X-Received: by 2002:a1c:9d0f:: with SMTP id g15mr15832581wme.97.1558701480626;
        Fri, 24 May 2019 05:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558701480; cv=none;
        d=google.com; s=arc-20160816;
        b=YdGeX6IzpmvW6CzfOyzDA7NBkSp+s8mtxDPfXgFYzP65eJGxQ0ScoqoGn3KibtCn7F
         UOP+m+JzSKYfEKDFLcXXClIl12XTkPBfeX0QVVl100Eoarq8iOmu1kBiIyFgPfurZnOe
         nKCDD4Lt/VhfwRUbp8do3SMv61qpDWPfn/ApV/ldX8pbnO6Bg8IckfWo0NMCwdZ+4Umo
         xUwRadUrNBGJVXOAVV7x6tovOpgv9qaYbNh5TIYGA4MOxUUNz5J1OuzH0BZ2RLMjvEEI
         x+uEVXtwrANs8OQEdLoNfLyY1lH+OtwLETiEQMb9er+2NigbtzGsG8MVAYoyLr1VLHmx
         C1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=4YtqE+ZNlBowkU96bDGDOFaqdg8gmHQWOLpS6NGXU1w=;
        b=jBmjZBUVgEtrJwRgylMf1GiLDIsfj68MPMPWVlbNuxlOEvtPWRaNvH/jETYhnRXLlZ
         I4vRpLT0zv4vJ//cyC6ZgHxPyaslYrQ8mzsk/9RxLYU0qeOELCcWhlx0i7zP5brR5Tnx
         UT6gXeTZZTpaucK79bfjtjECxmNHNz3XeAcnZBJ58E260P5st0XC1cWPTgs8j3zReQD6
         RqUz6sqScxXkHrupUgqHkP5RbQETvrUUCV2zJ7XA6AhYn2SpAFDAEaPBIHKJNIfVOdWr
         PtGRSDotT2Yu0+EWETR77/kDpSgxkBxSDkxshxtlu7GnIsEsgLxSV1kPPBxyFoOSQesF
         v/XA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id f83si133715wme.2.2019.05.24.05.38.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 05:38:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x4OCc0UN031388
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 May 2019 14:38:00 +0200
Received: from [167.87.47.159] ([167.87.47.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x4OCbxoR006347;
	Fri, 24 May 2019 14:38:00 +0200
Subject: Re: [PATCH 5/5] ci, Documentation: Add TI's K3 specific configs
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com,
        lokeshvutla@ti.com
References: <20190523211623.9718-1-nikhil.nd@ti.com>
 <20190523211623.9718-6-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6fa30cc8-3c2d-4df6-c7e0-dbd398d157ce@siemens.com>
Date: Fri, 24 May 2019 14:37:59 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190523211623.9718-6-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 23.05.19 23:16, 'Nikhil Devshatwar' via Jailhouse wrote:
> From: Lokesh Vutla <lokeshvutla@ti.com>
> 
> Before building jailhouse for TI's K3 platforms,
> ci/jailhouse-config-k3.h needs to be copied to
> include/jailhouse/config.h
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   ci/jailhouse-config-k3.h | 2 ++
>   1 file changed, 2 insertions(+)
>   create mode 100644 ci/jailhouse-config-k3.h
> 
> diff --git a/ci/jailhouse-config-k3.h b/ci/jailhouse-config-k3.h
> new file mode 100644
> index 00000000..65e02f08
> --- /dev/null
> +++ b/ci/jailhouse-config-k3.h
> @@ -0,0 +1,2 @@
> +#define CONFIG_TRACE_ERROR		1
> +#define CONFIG_TI_16550_MDR_QUIRK	1
> 

We only track in ci/ what we enabled for ci. In any case, when following Ralf's 
proposal for patch 4, this should be obsolete.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6fa30cc8-3c2d-4df6-c7e0-dbd398d157ce%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
