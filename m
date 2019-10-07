Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRGJ5XWAKGQENUGE4IY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id CD647CE8DF
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 18:16:04 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id o92sf9334257edb.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 09:16:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570464964; cv=pass;
        d=google.com; s=arc-20160816;
        b=PXhAD6jP1gFG9WJdTsfxCMMd394J3Ou6Zq4GcLkskOmH0AcrCQ0uMpKqIR1VobOJfg
         VOJcKLSaPLcQ2Ayg6lorDPFrqJo1BRoUbIc1L8yC9G+LsIiqCJLvaaBPYym3jna0kefs
         ry5pF3uD5xxYo9roBY57b5Wgn49b3nPhF4zZuYvUXXBqVrjZ+eqpe4+vqOJl/zgf7kLV
         2G12ZrNUROlbjrHpxp1zHMbnffSz7x5FB0FkaJy6rvoZaPRPwxC0BoU0gghygpWo6SeC
         OJkuan2I3hnpZU33o/qrWRb4IB1RPADG/G6td29q8qMM8miMFAeaEfLTjGrkMfxj6KfV
         ImAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=MEcNxypGgmmDiAoQkVuXOS3uGUvx87dMkdcQ5hNfJCk=;
        b=zfeAT/tPvCKD1gD2E2qcDFcMrQDBR0HX92nBhS7R62fhbR33sG+K9hauSzyvWrvKNS
         wUpsavHNpWfkimGmPb9XsO/AQBKSAo8/QnDlxcnimpNj9fytrgGxxVZWyWeutGFsdsmJ
         Z75wcKQFMItJqxHp70LiUjISZEppWb3V+163wt01QSE4V1xNhJ5ZtPeaS+Ak0QA8Anyy
         QkgRIWtZ6++5UndQQJoyiR+/dmAI0QtD5sf1rUhtZ27KYvsLy7ltxjEoaZtYVczk5QF6
         EnP8K1KKEz5YmJ6JkKw6Odbnuo0bZnKGW1kW5Vi5E/lYbzvCwG5HTRIGXr7YwyvBrAb5
         GEfQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MEcNxypGgmmDiAoQkVuXOS3uGUvx87dMkdcQ5hNfJCk=;
        b=CR9JkJ/psiRIH+t8pURmhaGj3bFlqJFBnQLNFBCpc91wx0ac2/VLD+MKICfZRf9hTM
         V4KwfCdXuUdILldZd1r/pFo7AHxdwVDgbzWYhtA5SDIoVGt8HtGo9Z6RYHf/uzgRwGKS
         CSlwKtOIfu8WbUDz8SXVZHZ6+84oZ7ui3E6YOUKRYtRb8496rygUAWiH1QtcmsZfkBPV
         LxAsdwB5C+7EhSSjy5vL4FE5yn88SE1RJpNCpZcNryth79Wqemac5QLt/QXoYyMnIDqz
         0alcgRFl5akfoYKXUyW1FX1VHnh6jfjGzI8xTawUuObDN/t1tS1UnR13q3wCmwbdzmMh
         uY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MEcNxypGgmmDiAoQkVuXOS3uGUvx87dMkdcQ5hNfJCk=;
        b=bzfS6POOKtBsrFpvkN02qymNM6HgtOqVi3XAACyTPrlELEOs0ZYL1U1/se7qRM5mqn
         6VC6Oaj1QamvC9mKfDJKn7lWXOr/qbwygu2bHvyd1zxJBvoOeSmaSOi0w9kzwe8GQVbf
         +pprWmlddCTrgR4Wu4pRK+/9M55ZZeRq+weCZyA7WdwBX3HK+/FizcZqsyRgxEJC58jh
         pK9od5TpGYZ27GfJlDrxQNl18C/nO5/vuJRsWcXkcXmv1w4SIkTF/hVL8j2Yu8J5zqVV
         WDBkoApobzKNjiMT/Jp0EaQfkLZK6TAkdqZ/MYUgSUEpnOQPTj556F0gv6qGtwfNru2N
         BkTw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUyr5fvUjLCy5X4ksR//hcaGuCi9/QO7CGmkUi4vFeOX/X4K4sv
	SRLMGP2boqEzr41f5oalBiE=
X-Google-Smtp-Source: APXvYqyP3t0pvNheuwEt2uAS+Y3koEDg2QSb77wjT2q5GSxP8WYDdh4V2MSARmLcHImELte1tTfIAQ==
X-Received: by 2002:a05:6402:1a4c:: with SMTP id bf12mr30064699edb.277.1570464964496;
        Mon, 07 Oct 2019 09:16:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d98d:: with SMTP id u13ls94910eds.12.gmail; Mon, 07 Oct
 2019 09:16:03 -0700 (PDT)
X-Received: by 2002:a50:9438:: with SMTP id p53mr29799804eda.291.1570464963655;
        Mon, 07 Oct 2019 09:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570464963; cv=none;
        d=google.com; s=arc-20160816;
        b=TLATJJkCvSUmu3eixBaqf4bovtjRP2s2ot1CCkDD2I9QzQKrrf2a8Hi1Lv2hWB9QqH
         S1phCJnXiHNV42RzXOZIJwgzEIhxz02CRR1h+7h3CbhxpJEOvrOHc2n0vy5HnaeGNJlq
         RGSOaFlI5qv6xCSlrho7KLyU98Z2/bFcylGU4wQLTFIm+JRVtAkZKDNRQdu2ufhsV76v
         43h0aO0SlNgDsmsUVSziaCEoLDhB5+0FrzixmYTdU0buQBbClxAnOgnDVSx+oLwOxRuv
         ULt9meaTbGLiphFwRrx9csXuuyF+k4w3oomJmyvSMgGUdSipFP7ykJQ2qZFCrgDplGK5
         Aeiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=i+jYz6kxVKHLvW03G/jqDbL86kmAkKcNfGJbJ48vzjQ=;
        b=FXd38HidO/bgnbJ8Ij2oTHqthkftZfkDFmJENGLntV83Oi+6uE1H6eX83lJbat5UB2
         i7Qc9LAzS+02yQyYCDZbVsaJp8zVrTyLcFfM88hBcAU2sSpLbxaova5lCQ81gqKmhFDT
         njuHCIRPdivCRZX+75tNR4Hv6c5dnUeI/BN/PjbSoPLtnE7gPPd71Ls7ewhmjxOv+5HP
         AWsXbWqNfAHfR214QPlSboIlmDS5CccwAVoKuoJh3lwQtO8gyqMruGSXeT/UvKpEk62Y
         dB12eZyPaAlgpq8I0jag5QskpXDr0UWSWI/KGXE0ormki5mfUh2mtI4/84ZyGPYMBIlz
         DKjA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id c31si995923edb.0.2019.10.07.09.16.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 09:16:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x97GG3jJ018474
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Oct 2019 18:16:03 +0200
Received: from [139.23.77.210] ([139.23.77.210])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x97GG2Ys026299;
	Mon, 7 Oct 2019 18:16:02 +0200
Subject: Re: [PATCH v3 08/14] pyjailhouse: sysfs_parser: make
 regions_split_by_kernel static
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>, ralf.ramsauer@othr.de,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <20190930191323.32266-9-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <fed9b1c5-397f-8370-9c11-36e866ec63a8@siemens.com>
Date: Mon, 7 Oct 2019 18:16:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190930191323.32266-9-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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
> No need to access our own tree, make this method static. This allows us to
> fully seperate IORegionTree from IOMemRegionTree soon.

separate

> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  pyjailhouse/sysfs_parser.py | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index b72be367..cbd6069d 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -868,14 +868,15 @@ class IOMemRegionTree:
>          self.parent = None
>          self.children = []
>  
> -    def regions_split_by_kernel(self):
> -        kernel = [x for x in self.children if
> +    @staticmethod
> +    def regions_split_by_kernel(tree):
> +        kernel = [x for x in tree.children if
>                    x.region.typestr.startswith('Kernel ')]
>  
>          if len(kernel) == 0:
> -            return [self.region]
> +            return [tree.region]
>  
> -        r = self.region
> +        r = tree.region
>          s = r.typestr
>  
>          kernel_start = kernel[0].region.start
> @@ -937,8 +938,8 @@ class IOMemRegionTree:
>              # System RAM on the first level will be added completely,
>              # if they don't contain the kernel itself, if they do,
>              # we split them
> -            if (tree.level == 1 and s == 'System RAM'):
> -                regions.extend(tree.regions_split_by_kernel())
> +            if tree.level == 1 and s == 'System RAM':

Missed in earlier cleanup?

> +                regions.extend(IOMemRegionTree.regions_split_by_kernel(tree))
>                  continue
>  
>              # blacklisted on all levels, covers both APIC and IOAPIC
> 

Looks good otherwise.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fed9b1c5-397f-8370-9c11-36e866ec63a8%40siemens.com.
