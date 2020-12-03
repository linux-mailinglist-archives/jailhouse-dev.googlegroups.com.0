Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBF4QUL7AKGQEJC7SS6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 415F92CCF98
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Dec 2020 07:39:20 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id b185sf142584lfg.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 02 Dec 2020 22:39:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606977559; cv=pass;
        d=google.com; s=arc-20160816;
        b=PhUlDjI6t6qVkLjFz84q5m4g2eu5vGKl6hAnEcBcgzJyNsHs1HogsPej+dL9l6T/WR
         2T7G/65FIZWH9/f1eFXaPv6ZiY4dxajFxEWJgFkk7nuCT75xOpv88t3vFSlG7V0VWyEl
         f8qs4fLdXXnkkXIRfCxvbHSroeXaATWTahA3Gygo76AacApFkL/g4OA47Lq4U78fnby5
         IbUhx/+cyiN0dQ5JSGDYbbspCnuvQ3gKZcYaUEcbnjnALeogRVNNpUGy6UaTCK/4VABU
         IFoqCl6kojlOLJ/KvP6qGpFvbpuxqw30o4L4bHGDZo58KQI+fRFU9K+AkuNAPU4k9x7V
         H9Qw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=oT45aE/7VsGOTA7tpw17D5Ho6oIyNCg39ufDoBBn+h4=;
        b=ia/LxxPW+9G7etAUcUEovyuORZeGEVIBxNwoBTmUDGThZt4gKHEj3ZmM/RazRrxatg
         f1/H0bHLyvjlmVBScfYmzC3RL/jf2zXl4K7JKQUJMkRpJq4V5WPhx6c9TIaZnm6+Alh1
         gDRexX9VO+wTPJL8Hw/xDqtmlKuJQfI9VNSHM00kLx5hCjfgoWims7bS32rwkvgzO+Wz
         naGpCOhaFsk/RsLX/i+Y5yLV5J6+iGS78/JaygDWU/k7fEaQjgYG2OlEwY288CRJ8PGq
         c7CuUNIznbT2LQaedOZmARzSjK/mRNem/uIKQz6cVD9cJBJPHpTnm5Xvm+dpRW/9TBuU
         EEiA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oT45aE/7VsGOTA7tpw17D5Ho6oIyNCg39ufDoBBn+h4=;
        b=GcZ4ur6wkRzkiy/xpDJLakzJ0LAzj6cMCJfmu3qVSiTPJLbSQ0BDtrAtvkW+00Fxbj
         cCjEn9MgGcIqWk67Xa8W6ohI8bsaGSUxN6VZp8JAcu4YybvUUmpPK54vbRF8W/fiPJDC
         hXakuQfUrwfr7Jo28ObUs28HUANEXQnDKrF/CRk/BG9z90dG6vXPXJGaMstv4Fuvij1c
         llm2ywEF60rW6+9NBbqk9bZHEB3Pie7KL3wFweq5vdN70KCbs0/9h7r2a2GuFoJmmZpJ
         Fz/7UQkL8lOas9C4NFQ017u7z0RHRsSYGvhe+OfJ25Vlk6k/8kd19yxAKW7KFFZ8sfiv
         DvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=oT45aE/7VsGOTA7tpw17D5Ho6oIyNCg39ufDoBBn+h4=;
        b=BdB/ps3J6V7B/ZtTc/slSg1K7W4CmVfc4PxquwplR6J8LJBeYhNJptzZeCs5IQMUkI
         RHsLo/duUj/hzM6JoneGBJTq9idEbeZ53CinO1OyRJ4rMoDFuXo15wT79kTsjUIWK5LJ
         194wG6H2a+dh6+sb1jvtJjycEo/EIjsdAr/d5EtJqOWTK+k6GC8GMwYvSD3cEFLdUXMi
         fHAhK+11vC+Mt34I02/CVaO/uzJx9q1Ma23v5pbib+vjbE6P7QGKVWSbJze4QivSy3Zo
         keKSbjVC3ItehvF8kSrnoUvPtS2OfJqZ88joQBK/KIDVqpdW5wClwLx/8IS9eswLkE31
         QZiw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530+zBBSWDI+lEcweZ3wY45Mg/gAP08BQhtK7ibwc3xRAiQ4BE1/
	eH6qzpnA3Q514uTH16aF+r8=
X-Google-Smtp-Source: ABdhPJxWYcn2o+AN44UkdDK6FRH0vCRSVJ/dgkrVY7k/Z31Ksignx6+QFkiczrMkX/5Tsl8pHDrldQ==
X-Received: by 2002:a2e:8e33:: with SMTP id r19mr631390ljk.102.1606977559758;
        Wed, 02 Dec 2020 22:39:19 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9895:: with SMTP id b21ls771316ljj.6.gmail; Wed, 02 Dec
 2020 22:39:18 -0800 (PST)
X-Received: by 2002:a2e:6c14:: with SMTP id h20mr624611ljc.450.1606977558381;
        Wed, 02 Dec 2020 22:39:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606977558; cv=none;
        d=google.com; s=arc-20160816;
        b=wzc4DWz+es84mk+PAgN4uqnrdmEZL3J6ncpJeo9md9cTFBYFCXBlUaGiZQEVoKa3RX
         6Dy/tto4Z/erGiloT3JUCJFj/plY2quET9/G2sjnsmiurvJCL8FkU3IN9KU30XgHkNAk
         0iUdpRCeUdDUhI6nbvGkcV9z91KnfP8xxKF4sCKTI+t/pLbfU2yUIO3nGF6RXY7vNtiw
         Bi92NHRFY6ZOL5Qi+xpe5SjAiows8/hbPQoAPAdT/9SJriGOREJYSUoJrkw6Qbb/THL6
         BZd86HE+tGymZC+XvSa/SNjpbcLMS2lP0cyzaRxNaTUhGMas6M4aH/ARQaWjX2BFka8B
         /Fkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=q9QBR2I8atZ8TzUr7R53lV67QymZtAt0MKAaZqKT8Tc=;
        b=mSIlT15iFbgZi2MaPUDYLhPRrpSuJN9oU/okuYOSv0VQOx9iWPk55vohNDcuDomzIV
         5ctkq0xAKd/KsupmNj0SSlxs0hlMQjWQpE4NEXfeKFxoRsXTmLRuXAFfzj8NBrJ1DDhr
         mXmcJDlyCWdRQUEQaGWKFn0CjtfcJSWbGKCy43zOJSBMsuktJvrQ6BsshDXj9SNgytsM
         AYpttXyi9vNY7prLVcYVTLPmD29QrtICes8ROqhMgFZphJvvWXPErfhJZmWHu7TnToiF
         rNU/CiwVbxJjy96iP0bgycvI4nW3HFfTY7QkPWmvj+DWXx+3aUWOUPooes8UfrARMVYT
         vgIw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id f9si6990lfl.3.2020.12.02.22.39.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 22:39:18 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0B36dHZb029768
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Dec 2020 07:39:17 +0100
Received: from [167.87.33.175] ([167.87.33.175])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0B36dGCJ020546;
	Thu, 3 Dec 2020 07:39:17 +0100
Subject: Re: [PATCH v2 1/2] configs: ls1046a-rdb: add cell configure files
To: Jiafei Pan <Jiafei.Pan@nxp.com>, jailhouse-dev@googlegroups.com
References: <20201202020918.27120-1-Jiafei.Pan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f9072054-c4bb-a4b3-a186-5b82a2b48b07@siemens.com>
Date: Thu, 3 Dec 2020 07:39:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201202020918.27120-1-Jiafei.Pan@nxp.com>
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

On 02.12.20 03:09, Jiafei Pan wrote:
> Add root cell, inmate cell, ivshmem demo cell and Linux demo cell
> configure files for NXP ls1046a RDB platform.
> 
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> ---
> Change in v2:
> 	- Removed some annotated code
> 
>  configs/arm64/ls1046a-rdb-inmate-demo.c  |  67 +++
>  configs/arm64/ls1046a-rdb-ivshmem-demo.c | 139 ++++++

Only realized now: Why separate inmate vs. ivshmem demo configs? Other
targets have them merged.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f9072054-c4bb-a4b3-a186-5b82a2b48b07%40siemens.com.
