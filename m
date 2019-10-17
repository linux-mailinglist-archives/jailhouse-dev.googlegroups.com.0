Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZXKUHWQKGQEYI3QXXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 372B0DAF24
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 16:06:31 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id i10sf1012644wrb.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 07:06:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571321190; cv=pass;
        d=google.com; s=arc-20160816;
        b=VHRJ7vt39MZbil1+0i56pQOYig3E0s9xSD0WcCsDzpYBPObgVSsDjaNP5bwYBOSeWx
         8uwHOrXRuknrY+tInh8IVtPmL3B4xb+QSKfRMSbR7AX69R+PZxGWFENC/wbizarzOXyV
         /gyONoxPTM+7J7F59aliCMBauscspyLUAIdOfOhubLDL/39afomw1GB1ZxBhfA6PzNWj
         SZLNNrKQ4SPURPfHoVIJzxk2o6iMCWkyq9pjXZ5tYbDMcCQqnSvfFOw4QjvWl2WWfQGs
         KUS0w95F9d/DGMF21bbTlchJc1nih7j+sxMr4s99VfSaWKkH+Ku9ZcbTEOzkBJeIgljH
         BgVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=xTxLZUEOaXn0BZAGrKjdZ77SlUDbeLikpjeiOIzAnGI=;
        b=KoqgAJmd59vV2TBtxcKDxXCWqHKGZaYR1pkppDtdKdrWP7ULF8hbMS0A073O67krY4
         CKGqS7Z0loROH2/zo32b6oXTDo4oohKcz9w/YWH4NzgBxqNNLwVKwXwgOh/HVdOvDjAS
         4bFE00P8Fg+bvZYj+wp5dry0uAA8/MbQys1u1bsnkFa1uzPpMk1uwcea1Pdu2ozBlxPn
         Xjq7mDcpZaHOptxkL1pJlMSOvp5RGuV2czZSTITlRX0HE6cFv6mSnmjOFMIQa+YRL/fV
         xM3pL11OTopqDSMjOOzzKbYNsY1YZEQ8vhEioltfXEh0XskAhf6Ntet7B/H/O55lchxq
         Z29Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xTxLZUEOaXn0BZAGrKjdZ77SlUDbeLikpjeiOIzAnGI=;
        b=Tx/uJMHFBjt8ayoU3ccEkAsHA/CSC5XxLdqYJ32SUK3XjYzcX8BfK/Euahq76bLvFg
         aff5HhJBYuZjPa/XMhEFzuCx00EBZpgSca1Acv74fQQQ4N19HhPNbsLug9v62JTTkhAM
         Hhb2n19dKbzGHFDhMYGzkH120fCkiRK0JmFrS8DURJonzI9WaOvBnqEOCO2LkmXWSnAa
         vkkdyZCCMFGsl13lmJnEnGDxKYqGvh9h6QWDBl52Me5eHJ7XsCx4BIiHtIcFAloRgU9N
         L1n+U63q3XfxSRPlUkFcFFhAN5czvOhcwt5iWMnUJpKtDSvdW7Yg2NY6wZLt+ngWYkYS
         pTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=xTxLZUEOaXn0BZAGrKjdZ77SlUDbeLikpjeiOIzAnGI=;
        b=bUCnegebxWBGW5ydVN0kLQKgaWnuX20t0Gl6mvLkKAGss+C6IHPNp7HN5LjceXcZQS
         xgPOu184KFB8X2J5bEq0+xygmYR1/2OWr2zstwrmDJTZekmk/VrZZKUD+QykVvqR+bag
         pp1NerJZhsOKmsXy6y+9svTWqCzU6v/TJHdthDGeLY53xJcvhkLsyqMjk27DsQDiJp7j
         yxKRdj41Ji4geybQBpcufVp6NR/w581DWcVGkBmLfBikrAl3CmI2hTv/sXfamxDMs5J7
         Hi8yK524AYkD/ricBlaDHupD7JeEbA/Fd4neo35+6Zixo2llDkKtWIxPrw/FawDK2NWy
         9nhQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWbBXPGrV693XPzibOCB8r1E+cmJ7DjVujZ0RVsjboahxmkem7/
	lS4MhWPrSJHJ5yxOA+4QjY8=
X-Google-Smtp-Source: APXvYqxtu4DQ05LePOY6WxZRAra+N7A5l2rhNOxxMoGn7eF62cMeRBHhznvt5ru0a8jBZCAJRTZChA==
X-Received: by 2002:a7b:caea:: with SMTP id t10mr3238985wml.38.1571321190845;
        Thu, 17 Oct 2019 07:06:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ce09:: with SMTP id p9ls1070170wrn.11.gmail; Thu, 17 Oct
 2019 07:06:29 -0700 (PDT)
X-Received: by 2002:a5d:5271:: with SMTP id l17mr3301742wrc.19.1571321189920;
        Thu, 17 Oct 2019 07:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571321189; cv=none;
        d=google.com; s=arc-20160816;
        b=Z6yUrWkvakQtX06n+TE5pMu2KA8AEwhWtwWT+Q7bAqwgPZSsL2NPxQdgjoIZEmVDOZ
         d02znIQV+fSRKeYZepUJiHLYKMeacCFDmmYhcJW13JdqcMuYqg38yJx0Dr4KR84+GwXS
         x4CELXV7VPC8me5LeHarEBHixVjlgc9IJybMvWT4pKvl4RHFM+8VT4mfpt+spnVUMen1
         aak6n4fphWOFr//E4TPQPAmHf1YaVsrEYv+QkgwXoMPXqgXWy7ZNoYZa+7Fn+GB5HZZi
         5XvCc8R4VUSyWI9nuVx3+yAm7ahzBi43XJAFE8ZDCKs2Fadl5z5OnKQWPUtCX2rrsvi+
         GQlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=R8zJwJHpnrv/DMnzx7OrS8HYst46fV6Aa2aIfTlyTLk=;
        b=hMQRKRDH7kdH97K7kjzVrnnFE66x7P5858sgWpElE8WdCvVW2/UlNqit4ig36DBILF
         nJ24uHIRYK2sungbXok0/tbYNDbEJPWNRzk2HooHdlLg2Ld6LXt1cTp4GPSjwoTf8iBu
         /D3O2uq46WrTWr3MnPzDNf91EpqV/N+znzcdHIwZrjDUS16Z5vHzkcPW9btixfh2Lsto
         om5O8Yjq1pDfbZrjlpsxo0im5f2TNR2haqEegLZIzUEPsp9NUQvKCrnna1E/Q4ZLWvWp
         p8z7vjv1Jai4yS4vHoOx/MGQu220U9AgjlGq8NsRLwmsFh1W94LZK76i8KB65eGRXZp6
         /PNQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id o10si169805wrm.5.2019.10.17.07.06.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 07:06:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x9HE6TRP003048
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Oct 2019 16:06:29 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x9HE6Tdo009872;
	Thu, 17 Oct 2019 16:06:29 +0200
Subject: Re: [PATCH v4 00/13] pyjailhouse: x86: Implement config generator for
 port I/O
To: Henning Schild <henning.schild@siemens.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>,
        Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
 <20191017145100.0e923e14@md1za8fc.ad001.siemens.net>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e8b8d432-cd25-86e0-8e6c-e6324ea3b340@siemens.com>
Date: Thu, 17 Oct 2019 16:06:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191017145100.0e923e14@md1za8fc.ad001.siemens.net>
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

On 17.10.19 14:51, Henning Schild wrote:
> Hi,
> 
> that is a long standing "issue" and we once had a chinese student
> working on that as well. He never finished though ...
> 
> I did not look into all details but the insight that the existing code
> for memory can be reused for ports was in there ... inside the kernel
> it is also "the same".
> 
> I only wonder whether IORegionTree.parse_io_file can get away with just
> one argument, which file to take can be derived from the target class.
> Or the other way around.

Sounds like a reasonable cleanup. But we can also do that on top. I've
merged the series to next to give this some exposure.

Will send a few tiny cleanups soon that pylint reported (well, it
reports a lot, so these are only partial cleanups).

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e8b8d432-cd25-86e0-8e6c-e6324ea3b340%40siemens.com.
