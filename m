Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMWEQDXAKGQEZHY2T2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DB0EE099
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Nov 2019 14:05:54 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id 2sf3832637wmd.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Nov 2019 05:05:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1572872754; cv=pass;
        d=google.com; s=arc-20160816;
        b=0SqvXb5znQBBgk1OmpESQiB8ob/KEpMXOpo2s6bA416B8hZL2EYp8daE/s1D9/9vYG
         pSdxkpml96K19MqV4ukU9ASm6AvhFTGGU8XiIEZ/rwryobDXK7g+ZVKDhBZmQeNpLrTb
         sxy3oBhoVKubm0YxVZGG+cP75a1cp4exHLl4ftOsK9i1s0Uz1ne1yAs2xfA9fdBI1pK2
         O75MXCz6nVE/z9KuEFMQOcL2S45YUcNbNgrtt0kCg4hFgqGitbZFopfzeikXA7vyBIe9
         tEFPQWMgO5eZA8K7uOqTYt0iG9mX1Pf0MWfi1oEeprTCu+Xqgm2d+alJ+dBl8BUDP/+p
         5kmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=/yj9ul/0yKLCV8xWUc6R/+4EAnCN9pUNERUqrnyvs0w=;
        b=H3c3DIXiilOcKr8rlrEBo6HeJ3cafCIAfYgcYHePJRGrsS4Bventi9QwFZm5hTcrl8
         AAWxOcABPzG9ehZCHRae4/fUbZsPXNwLAdbZRJYfBKbnyvgNbqwFXrDlI0hSwTG/0vqG
         9SRKindXqCzY0EzkGQBM66Q3V8WAX1fDaFueUhzuXbjfs50K2Sb0iWT7AGJqNRPWKV4/
         AVWDGwzGiuxpj7Esz4VM5+K1vyWaRht9QAcx5pcPZYFjkD6MKlJeaZ+O02Y5zurO8XyQ
         0WYFHwA301rFYLBA4hVh9i/LP2IVIMbDnFR1PDmWKLhGNKNUwZbulcVCmWB9MxKm5W0q
         4pxw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/yj9ul/0yKLCV8xWUc6R/+4EAnCN9pUNERUqrnyvs0w=;
        b=XAOox013rRhtGW92HJ+6siBf5OtD8xKEu7zKrouiV0LKXJ/WIlEfd3O+V9dsk2+gRI
         v93+CSxklLpugxHeFi3TF1Xipi9oBMMbFfT0Hx1PNtiR0hihTMr5c6mUH5rjTIZQKsPx
         X0tpgjhbsxVcZhHCVZ5joSYV5FNT6AZXtlMBA/kvAaw1ThR78O3AqTIaZhy+Kr72ntsp
         E+BTvWzwnpCxd8YROD+txvpboKyQIPt8gsgjb6MtnwqWpBhJrq414ZM9j3oKmRrX21Es
         83i2nX2+D5sUN0PCm86+wMphPDigDHuUrSZqeMk3Rjo6yd7i7i0/vMQSlz9zcs0iL1MK
         +qCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/yj9ul/0yKLCV8xWUc6R/+4EAnCN9pUNERUqrnyvs0w=;
        b=cuUUJY9vLTUu8LtPEBSJHeGbnkt62/QDhw35751HjA5o8h60X+uFVN+dyf0mF0yVlU
         esZxkfMFft2Y15vzAPILERFIJQ+50vGl8xdk1FMfnH+nGZL/6XdRw9dGwR6WK44swv5c
         ftWXa4R6omO5smd6AaOwL2LjJk+yPo+QewMgrQdMYCaSI6e3A4BJBqT/bR8Qk3dmd0kl
         MDCZJepQH+e5A3fb/Msm6KCy1lp9VPpcyLwpuMiLyACaUL0aebXfaM2Dj0Kv24DD22AB
         bFmlN5MXPNfddWSDLFti7M8ui+5nj2nPVyDM8mmvzJqpeBZB0lVR6A/EHkjZRtE32J0c
         k9sQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUdXJH9sOfPlEJ3dDPvtRimJ4vq5JM98uVS6l2ioQcusErzac4l
	A6X3rpyRtDpEYize7sN2tV0=
X-Google-Smtp-Source: APXvYqzaHIIAqX0QkVL/AwTxw6UKaeeE0Z5eaGAFH0rzq40iUXpZrH7xfeZejZNmWUcCS8cVe9Z9AA==
X-Received: by 2002:a1c:ab0a:: with SMTP id u10mr24104093wme.0.1572872754207;
        Mon, 04 Nov 2019 05:05:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:387:: with SMTP id 129ls16876734wmd.3.canary-gmail; Mon,
 04 Nov 2019 05:05:53 -0800 (PST)
X-Received: by 2002:a7b:cb0a:: with SMTP id u10mr23492307wmj.48.1572872753446;
        Mon, 04 Nov 2019 05:05:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572872753; cv=none;
        d=google.com; s=arc-20160816;
        b=ORBjAzkcpAC4eJ8rYMIhMyaQfmf/3V+T8GWDDvQOLc9o5VxASS1n+fPFBULVgOQPVM
         hKEty/OGzkgvDhohQFdYatDVmxvcOq9oaFIimbgBkPVePeXBzqOQlqS8jwv9Ytsq1zWy
         1cC09yRjiCHhC7Rvf90raDDUWbJroKbrFhFRFusartYDt+0OgO1PAghcA5kKnra7/amB
         4lOYhxGhuLNT9PK8jKrHtfhy0IbDqSBYWGwGJAOhiXNCtMbqeFbGANtVqRRsChhJ1Hju
         hjJuZLmTLYdO3M38+94s5VFL/PwAvl71QkSQP0G3O8zaMO4okC9EUrhWyriKjg5DZ1aO
         7tLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=jfRgAZrWdMG+282Ou+TZN7rEnTADylFmv30rO7d57xs=;
        b=R2NOLYAjK0QFtuwVUwYJLWotkHNyzXwcK1QMfYxwzQWp8+iVlJ6e93wM5dHxUY2/Eq
         fw89H/C4u8U2XzSF30ohITjRhunLi29JD+eBTKaKFLCEzNy1IueGRNmL3DtUYOcGpaui
         lkKbztcTjjGTp2JFco1uLUhzXPrT/kxjHSVcjNKuSaHCcDWcM0v6RMBo8qRkIW0EVrw4
         LaCOyairVgfsmFMig+mIwESHxV9BBz8aDI2YyQG4z759IfpmB0c5IuFCMq5RpcGhfG8Y
         SpcYDZz7fkbbIjYCKCUacqGjF5z4mnk2DXeYmOtfzzIhln71S3vIPQNBfXCJxtb79l2O
         Q/6w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id w6si106712wmk.3.2019.11.04.05.05.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 05:05:53 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id xA4D5rx6024485
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Nov 2019 14:05:53 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xA4D5rHK026858;
	Mon, 4 Nov 2019 14:05:53 +0100
Subject: Re: Backport of patches to jailhouse-enabling
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <343b0acd-45a4-0ca6-f6dd-84bee630169b@oth-regensburg.de>
 <e01e63da-43ac-b915-c8af-828491621c88@siemens.com>
 <994ee21f-038b-d19c-d267-cc25485cd0ba@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <14a0f111-cf06-41e5-5143-57d101369619@siemens.com>
Date: Mon, 4 Nov 2019 14:05:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <994ee21f-038b-d19c-d267-cc25485cd0ba@oth-regensburg.de>
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

On 04.11.19 12:44, Ralf Ramsauer wrote:
> 
> 
> On 10/30/19 6:56 PM, Jan Kiszka wrote:
>> On 30.10.19 14:30, Ralf Ramsauer wrote:
>>> Hi Jan,
>>>
>>> could you consider to backport the following Linux patches to the
>>> jailhouse-enabling trees?
>>>
>>> 8428413b1d14f ("serial: 8250_pci: Implement MSI(-X) support")
>>> on linus/master, and
>>>
>>> 0935e5f7527cc ("x86/jailhouse: Improve setup data version comparison")
>>> 7a56b81c47461 ("x86/jailhouse: Only enable platform UARTs if available")
>>> queued in tip/x86/platform.
>>>
>>> Those patches have been accepted upstream, and it would be helpful to
>>> find them in the jailhouse-enabling tree.
>>>
>>
>> Yep, will have a look soon, along with a stable update.
> 
> Ah, you already did the backport. Perfect, thanks!
> 

Yeah, and from testing those, the recently posted patches originate.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/14a0f111-cf06-41e5-5143-57d101369619%40siemens.com.
