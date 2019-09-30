Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZO6ZDWAKGQECFNGPDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBA5C2549
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 18:37:58 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id v13sf4734062wrq.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 09:37:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569861477; cv=pass;
        d=google.com; s=arc-20160816;
        b=lAWUi0La5Br85E7nwaMbvTR3ScraG8DGNDx2VwhHSi1xDaoWNDMQ/Kk3PqxAEPM2B0
         jsj8jmdWOwjWx9c7H45awTJ6Xty9nrfL+Uj2qa4nGcbpb7mSdjlp9PSabuXKmvHO1s5g
         tgZ2CqfaVfD/W9GazLwBXjXWhI1Mkn4Ex15lAVHxwt8MEga6w+7dBoKdWQv1EshsmVZD
         +sBefuJpxNnDUbkYNj5EasHlJf389s65ezC0A3vLyZgV801IzYCtlomhKiwok5LrC1RH
         0kl1u6oll/kLngcx3+Q3StoyMooLENsXf0iXZrZv/3vgUzd+3L//e8FcpaC3bZgAx4/M
         SXVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=gMBP2eIRh18JJbfpZ1o3KMHhnsQdSVyFAk6ltyy9rQQ=;
        b=MEO8C0gJL/RIpNGARvgBGCus1sbiEJb57B1AdVyojg6XnWpqW7md1wOuZaSRUXoThi
         REx5CIlwqutpK9U9m3zkETFW0srEF+Lqa89CQiBIYE/AY5XX9Yu7M0SOF8REx8Uju2r5
         wl8IvLRqLfYxlM9Qd/k8IDWF9Ftj2sdtHV0rEeLafzahjmZN2cnLZYJmjvLd3v4orZmU
         M3z1u+fmbxF44RnX9D/KcWMmPIhMvUJImBD3ow3tGmIdl7b0f5XzC1U7P+Q2aTYwTrje
         l/F5nTsERA19IS/2WsN9qdSn53fKXPQsHX8J6x4Oh6iRTEerXRC+68ina1cbHflCYxo+
         YkJA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gMBP2eIRh18JJbfpZ1o3KMHhnsQdSVyFAk6ltyy9rQQ=;
        b=SiGd89RWlezSZa588NFQzQzHeY9/XuuVWW37YTpIX8AkjvTVn9P5rPeBhS6d8v0/SA
         fjudcvuozn826l2dRgHk905+SOeyvTEmrR/1TBAr8rLZoVvGi/DCFKkCA0Iebvet95xo
         D+ztLbHx4H1MoDR+6Get1qLz2QVylLJPxz068AeilfRqeg4LIoZ/ExYgzUvrPXzsv6Mn
         Bi79fMVa1jjSnN3i5+Ubc+Z3CRfxNf4BKMogxnwA7aCoa9mey+LqWcGqQtVhXSYFEPT1
         AWUVNHdNOVnba8knyKFEewdB4KXhUlPLOkNi85EMy0GbY5yt1z4zbjEX473aIv7iAVxJ
         Xgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gMBP2eIRh18JJbfpZ1o3KMHhnsQdSVyFAk6ltyy9rQQ=;
        b=cy2YFPXmZ0nNsBexgQ7gW6Ka/bfMqWwX+rdtBvNmUo8C18nDyEIRz0itD/Uz6jUJ7T
         65eQA2MPV2K1+LaLmagpY8dJgERD2tGPoRelL6SDDKWnBFLU/QmqHsJIZiP6zt0FfojF
         +CBKCNcLjWJstIxYIGQLvuSXnGBaDRYxah2JYuoJd5C7CXNI1VX3oXF7ODXrdZNRMelz
         oHcFYWwzNtJtW2veMNYDEDoy/88kVi8qUwkk79PmW8zXd8GjVh23KFf/M8lSlaH9BYuf
         elORQoV+CGVxRBB7cRz5DgYFfLsfEQvwqvqyQCPLK/0+fo25KNG9wOio0Q9NTHlpfCYn
         OlzA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWvnu/d2dwhauqhnpXxWPZcyT8QeP2c14Z8soTYdXqvWvPUM54h
	S8wcVIgxxckQCiqaPKtXRuA=
X-Google-Smtp-Source: APXvYqw05Gop5UoS7E7XEpIVh4sohBbRyyBaMTyUOURsNlvCJ+ZQMJurlCe+3ldQdPAH1ap9wbnn+w==
X-Received: by 2002:adf:f011:: with SMTP id j17mr14503206wro.131.1569861477887;
        Mon, 30 Sep 2019 09:37:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a78e:: with SMTP id q136ls32810wme.1.gmail; Mon, 30 Sep
 2019 09:37:57 -0700 (PDT)
X-Received: by 2002:a1c:28d4:: with SMTP id o203mr90770wmo.142.1569861477276;
        Mon, 30 Sep 2019 09:37:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569861477; cv=none;
        d=google.com; s=arc-20160816;
        b=jMub48Dsosn8Th8n71K/0mG/Hr4fCrd4R2pFuGtC/uW7U8Sr3qj03WypDs1ZpkBUZq
         zL6OjU2UViQl56J7O1mMN29MIi+HmbS2OJuYi81apAQJA6VfwTqcdCcD8zxoNSYFOv4B
         6oXTq6jyRPyK+F2xnb3tfpHClH7hxTGBfA4HqbduXyDJDhDLZNEVIPbKUdog4FV7Kob2
         o5i5Svg1YT3PTifugmlWuL+VAhT3jErFSefGJ0rRaM6DnUiYleXmhX8Ac286g+yOZwm5
         adZRvqEJRhg7TnOpgj6d9795V0jOeJlM+LVMzjhg353aX3wnMWuuiuiS09eusOq4XJ/r
         VnWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=sMrzrgzsDWnOdg4Hh2ZLUyCB3BGsc9OzVwe+TKlDSg0=;
        b=1LN1+y2Ag2VEcKMXv8PoE5hRct+OkOskOe6epuf/058tXkqAvDPiToWXr//yIaZjSW
         ulKBvLit6zxz67pf9Cibtpdeu93HiFOChiEh4R+yj7IWPxevyaCZzyTJ0pnwCjBXVwjh
         td8YE+FAditFkAZzx92qOQ3CRUqe1TATKB+PdvS08bilu4BDLl1bMOIbiVXYjfcpmB00
         58vGWHKT2EqJkSAphcz06r2nB8ft119T0EfGGHWUfDgfdHkpCbxYqYWu596TtqbLpTIz
         AbQWzbaLzN5tDeXZGhHZbs+KrMtByfdD19zJNVG2gX/FFIgf/1tsOvgCBQ2cX5thQe+e
         7C9w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id r1si727069wrn.2.2019.09.30.09.37.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 09:37:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x8UGbuT8019901
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 18:37:56 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x8UGbuMf000623
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 18:37:56 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] inmates: Add support for %% format
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <0283aa06-b5cd-3a4b-1292-71a93f0155ba@siemens.com>
Date: Mon, 30 Sep 2019 18:37:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Needed for warning-free output of the "%" character.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/lib/printk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/inmates/lib/printk.c b/inmates/lib/printk.c
index fd157bbf..29cbc3f6 100644
--- a/inmates/lib/printk.c
+++ b/inmates/lib/printk.c
@@ -294,6 +294,9 @@ static void __vprintk(const char *fmt, va_list ap)
 					p = hex2str(v, p, 0);
 				p = align(p, p0, width, fill);
 				break;
+			case '%':
+				*p++ = c;
+				break;
 			default:
 				*p++ = '%';
 				*p++ = c;
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0283aa06-b5cd-3a4b-1292-71a93f0155ba%40siemens.com.
