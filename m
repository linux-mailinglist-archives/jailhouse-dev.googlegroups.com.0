Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQ4WVT2AKGQEUM5IUUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id E261219F3F3
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Apr 2020 12:58:11 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id l13sf4766564wme.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Apr 2020 03:58:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586170691; cv=pass;
        d=google.com; s=arc-20160816;
        b=dgIxsfTeaBp/ONcvw0pFbqbyAstXEHMvGdqRsrWlMtizn+3bNqC5RhM5R25keOqGyE
         qN5LFGHAql9tkqr64tJ5Vk516+dX3DwLLHK5sXszOPogHidbdHao75uURTIanYurXKd0
         OpyjAEdO6zi4Yg7lvu8JzPMAPO2NhiUbYKae6MgsGvbYiE+z3zYCk+BJ78nEKP4tsw72
         V3xFo4csnn4riv7u6ltSI+SweiBlf745NNM810aK1VX8UFq1oaLLP8hawee+3p3FE+W2
         rHRLqy65NPhIkLcgmZ3163Qerq9dN5SAY1B5k23kKAC+9a6aNYEldzxm+IjCFeYLr80+
         VNhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:cc:references:to
         :subject:sender:dkim-signature;
        bh=rcMyvJErqyKoHTsMPEs7CkmGEVTENtRxNxljzEls8aE=;
        b=nkAWtxhBsF6ide53NR/2hijv8ezJHRKwNnnzN8Vaze2aRhMoDU4bQu6aEhKxOQIrM7
         5QQwi+aetzgdqo7pCWbMhdRVIhxwjyxlJ84KCRXpOBEj7J0AtxAiIm21Pz5PqQ1lsVxr
         S3RHpVVAdXvi+cgVOkqNYBIl4D4Dh0krWMDDqz9UO+ByclPgE2qeWQsC7E0cDZUDiCuw
         XjpzOta0TFlAstkb85flormEAbjb47yxZ46muQJSeF5pXqK6Qw5GU/4nP9jGZep9w1xx
         SwA0FostXJPuMA0rWDT8swzyQhz7zsBI7ysANsqUOn+1IDAJ8BzTgKgV3ITiJ2evyYss
         QJMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rcMyvJErqyKoHTsMPEs7CkmGEVTENtRxNxljzEls8aE=;
        b=NXYQAkwP0xfSi5iEq5rh1OHwTpSl0RaEXLw4EYNqzzqYo/Yu9IbRLv9I58dDEpnjuZ
         UphsdqehooTsP7+jA/cO4ZSAeyWqclqbXelDhX24OPJlb67e28h5onj/NVZoSy7c9byb
         Fpr75nFcGSGzpqM2GcSJ7iL9fBI7W5kHapwaeN8JUmgzd0wzWo6WI/7b4xE26sq/6k7O
         o+xAMRV+RjZVLK+5e4cNdZUiArfqu4qauJFG69FIp2QrCSVgN6tZFdr3+h1QvAtRssKI
         f1mdxE14B+jytJ7SYLz3ltOQlEEHRJAlq+DrKUXFAC0MSixb+g8R0mukNE0odIZufpnc
         GuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rcMyvJErqyKoHTsMPEs7CkmGEVTENtRxNxljzEls8aE=;
        b=TIepcL96w4Q2l+ckSxgNDp+LxRH7Y94QTCrCdVAfNUd7jP9gpIvTI65AWdaJQm1hEa
         xY7/cJIURc8LFm8A9FwpI0U2auI4DT+rnDmdWh4cMXjlN88BleDYCCGTIrbRE1ZeDE+3
         xFCxuRfXXKhCqb6nUyEFmgrQw/ka7NXsArEcZmNOhXPVyfLrA8Yxx9nmjUzxlKtXyuup
         uLPPlGskKjH9iXOozhOIYkiP3f6T5bxGWNiYWQcFZXczuC1eAuWk/6DO5sLJx9a4JphP
         galSQ5hZ86Bqw+YpH7AYuwh/627ztnq7/XSjsnBpkhd+7FeJYc+jAFnbTLeFB/lY1ziB
         CAZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubJGxPQma5KFJ3PE72ArEI2yDyhUM4lceD7YgUrmZuitoOnNxCZ
	sZmwTvx+p8O3maYoqF+kMzA=
X-Google-Smtp-Source: APiQypJ0sKJ3ukZzm0CHLjx3LFwl/96s21RU7HH9NbXOOfIXiOv+zeSLUBdDjNiEWI2+TBwJiNay0Q==
X-Received: by 2002:adf:ee8d:: with SMTP id b13mr5012258wro.251.1586170691572;
        Mon, 06 Apr 2020 03:58:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7d97:: with SMTP id y145ls7714083wmc.2.gmail; Mon, 06
 Apr 2020 03:58:10 -0700 (PDT)
X-Received: by 2002:a05:600c:2214:: with SMTP id z20mr5265023wml.189.1586170690761;
        Mon, 06 Apr 2020 03:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586170690; cv=none;
        d=google.com; s=arc-20160816;
        b=t3oDjFoC1bj03ZyYpatEiQenRdcGiLcWE2wfFgGqaJ23TJQwDVfPr4xp6zamI2nV2V
         o76B0lwPVBvn+cW8nn/h4+S5p+7k3BnQqmQItIw3KKhNWdP/4ATJ1GkgGylzdyhK8MBz
         UjajoXnm1dpthQ5smSDrdV9V9iWBDieUDSaVQ2r4PwF9REwAIV25VddaZbVrtmvcroDK
         xp3IwSY+chy2koOdO0Rpn0vj7nHWbUjvwZcCxQI2SxRdPOSuOPbHplyioHLVq5U12kZo
         xtCFpqgjx+V/ZMRqBj6GSk/qpTIaZHk/2Wz/qsqEfAK5LYLNj+MfedQPpqHnkI6FI6+8
         wMtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject;
        bh=MzqSPrh0tzvZ5JYKMn59wpxlGN17MTX42ZKLp76ZZ2I=;
        b=GO8hGY/UGIhqXUpKAeOFmu1Zz935dgEuLApSqg8PooxBnruUHewGMHkJyTijber6cz
         2zlWoXdRPZ9uoOayqf011aMRunuUNgT51WJRHoOMd+BEnx2jPQTsRj/KVhTBhRT6n+ZP
         D8unk6mpFvc7PEdQfWRN8sFpPZ7ZVfUwEPPnpBSQPtXZ2zVFwS3KY3hVnJPafPZj9UwW
         7KjerDokc+EjbpOzJe0IniLb7/b1EM8bmVxCGmKd7QoZC5Mcvp823t6TXK1s/qkJ/X+h
         Sf5F+eMtS70VjVVQhKatZhXK788v9wjUgzY45tcdVXc8yf78KqmlxsrLQxEFAHHPt7Ld
         9vuA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id y201si983081wmc.0.2020.04.06.03.58.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Apr 2020 03:58:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 036Aw9fA017915
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Apr 2020 12:58:09 +0200
Received: from [139.22.38.89] ([139.22.38.89])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 036Aw9Qe001017;
	Mon, 6 Apr 2020 12:58:09 +0200
Subject: Re: Questions about x86 P-states during CPU handoff from root to
 inmate
To: Michael Hinton <michael.g.hinton@gmail.com>
References: <5cd0fb26-8c4f-482c-9ac9-6f6b1d234f03@googlegroups.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ffd61dbc-355d-70b2-2d67-9f84718ea81d@siemens.com>
Date: Mon, 6 Apr 2020 12:58:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5cd0fb26-8c4f-482c-9ac9-6f6b1d234f03@googlegroups.com>
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

On 04.04.20 05:44, Michael Hinton wrote:
> Hello,
> 
> I currently have a very simple application (no RTOS) running on a 
> single-core x86 inmate that is unaware of P-states. I am also running 
> with Hardware P-states (HWP) disabled on the Linux command line. When 
> the root cell gives control of the core over to the inmate, it's unclear 
> to me what happens to the P-state of that core. If it has an idle 
> P-state, and then is handed off to inmate, will it still be at the same 
> P-state? Or will it get reset to the full-throttle P0 P-state?

Jailhouse so far does nothing about power management, including 
P-states. That's a to-do to handle that properly (reset, moderate access 
etc.). Actually, access control will likely come first with the 
introduction of MSR control (manageable whitelists of MSRs).

> 
> In my testing, my inmate appears to be running full throttle at the base 
> frequency, meaning that the P-state gets reset to P0 somehow. But I'm 
> not sure how to verify this beyond calculating the frequency with aperf 
> and mperf, which I'm doing.

What may happen here is that Linux reset the P-state when offline the 
CPU for the handover.

> 
> I guess I could dive into the Linux source code to see what the 
> intel_pstate driver is doing, but I am a bit nervous that I might not 
> understand it. So I'm hoping someone here knows how this handoff works. 
> Maybe there is some kind of watchdog timer that needs to be actively 
> reset by the intel_pstate driver to keep a core at a P-state other than P0.

This necessary diving into the power management details of the various 
targets (even Intel is not just one thing) is the reason for not having 
anythings so far.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ffd61dbc-355d-70b2-2d67-9f84718ea81d%40siemens.com.
