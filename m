Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJ7TT6FQMGQECVUU6GQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 6009542D62A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 14 Oct 2021 11:34:32 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id h11-20020adfa4cb000000b00160c791a550sf4102605wrb.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 14 Oct 2021 02:34:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634204072; cv=pass;
        d=google.com; s=arc-20160816;
        b=cw4D7cuXX6AM5UvH2Zc9NZFGS7Dx+dqB197A6hVybzMhnnEXuLQOZGA9LSeMxkfgJl
         kCGHZfX6LvGtLLhfylOWWv2oogiE9aIyTWBOxHtZJIO1wQPa75KmVZCDG4XK4sg0WkoG
         JYofW5D75A18ElCwWZgUiz3DE/Ib3kaHH93EAJ6qR126trj4nDUdXT7NteAjEx/tsm1H
         0O6Ox+yu8B5Q1LWgdDPYbAVrrg2j0bcYT+mGfRM/jHGtebaqH9hH8f0sMTOmSeJETN4D
         qNTx5M2gL2tyuAegwFE6dpAsPVP4AVBB35Kf0H+6yt/zHfK6M6D+zggbK3KFQ5CxmXtr
         /pCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=4Q+6OxvZf+B8dsl1fSF6koffYPByP4c3xHQVkj4g8rA=;
        b=hiKOMcvzcIG1qyvSvwh8llSHZOCvHcMeBbtHGhaBPQ2/z+nYFDWM03sq5XA/3CJbZ1
         tu25jKDATCaLUYhWYxWF2Wcnpx6Ppm1QjwufUkr5Dxlo2C+JMApzDp5eCoIF1vU18e8X
         66ZEAe/fGpPZ5RJjLpeFRXmM8hrA2ur2oOa5XBW5cz5u6puUoCwiNxtNKFDHX2nLL8rT
         +OmqEkiR8M/F3pz7aGqkKHcf3+vyp8HQFhq3MIy4eXdJHmUyEClUuVMQOplxOfW+ipcu
         wMggr33azxARYu0ByuTxAdlZZGGtImohEmhmJM31cW+DsmhNTOYxt4J5f8/RKvQLWrlI
         eZNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4Q+6OxvZf+B8dsl1fSF6koffYPByP4c3xHQVkj4g8rA=;
        b=ogreSaBpEo22uyPUiNyaJ90HTyKZVEo3yqu5CZGXwyUkxiVAS+XSQalZT0NxZqhH7O
         +Ig4j2StCNR178bPRJBh9x7FCmfmhMzmt9dYB/M0mL2/JtJCpKZPzN5UBiw2qTObykAJ
         XDC7A2hmK1JbSqy1NfCjp8JfG7464s4kO8kE2S5j3tlDYoy6InESiIEXubOZOuLNJJ4Y
         Z2ceiUF3qS8OH46wR1ASaIisQdhPcCIqnZC2RqxZKJqncvvdyy9WElL9HUQrnson85Hi
         2YzA5r6ieyBjL5ORS0SPGijt9ncEw2dGt4f4snbc1N10mXcA9osh4NDHHk88Z3UpJt1k
         2hrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4Q+6OxvZf+B8dsl1fSF6koffYPByP4c3xHQVkj4g8rA=;
        b=Zc/KaDTn0RBnLg/YDd1KK/C8IXjogS4YmG+6IA6oXivNA4GoFdTTKqiCmHad+fyDQN
         1i8JgCX+5Z5wIQ4ZcD6G3OdAcTeZx+LWxQVGEaFqSPxNsLvsxrRGdds7Dnf8YKVvWC7D
         m4KOxrSqyCS21KU/8g4wBzE22d7NRLK7sJj2/zm5gG1bMagxWzRyrbDns7E9XYhEts2T
         eFKaIm/9OcLvCDUbZE6e7ImcUReGXibuwtsdVfVF0t8lo7vaejttANrbGLHTDqAXFmKn
         1gqP6EmbAyrl5AhZak/2QHpEO/g1giAUOfhiwzBLeKgBZu1qjBPP3QHUIBjOJC7Pdk9z
         bXXg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531WUPByEL69eIOqE/X2jWOohHVRxl9Zehot6xI72SzxQwSQj8Co
	uTM4MT2WBoO7BQjwWtCF/0U=
X-Google-Smtp-Source: ABdhPJxDcqOmy7VFgMDB/fBZs8BkcKo5GhOAFfvld+xQZ33cWm/fWGkEEsezYOtpwxfUnUMjWuLp8Q==
X-Received: by 2002:a1c:2541:: with SMTP id l62mr18607254wml.11.1634204072069;
        Thu, 14 Oct 2021 02:34:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:8b92:: with SMTP id o18ls2455483wra.0.gmail; Thu, 14 Oct
 2021 02:34:31 -0700 (PDT)
X-Received: by 2002:a5d:5589:: with SMTP id i9mr5222334wrv.55.1634204070977;
        Thu, 14 Oct 2021 02:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634204070; cv=none;
        d=google.com; s=arc-20160816;
        b=DBA+1onNpfh0Tk5wdO54XxU5UUmgVWLQgVk6odq7S1bo6z3f2xD5nxN+LMGPPalzLN
         WmhJkTJ35UeFJCnfYkdbyB1y+AlRXveJJcMQtNKRFwbWVFEFLMHa+deWc5h9FPg94Gjw
         HopzJoWyRfef4mwKTqjeicmSQDhbV4NR1mXdkTJymMixcF+bB4ze+XB90dhLJttJdXJr
         NLboFLnjZ2TA7aGihSMS4saNc0f9pHmn7r0RGnhAEO8tMKpj7RqdCBVsB+EATCkI1qE1
         20+fwZ7+62PepGnfqIBbh8Hh5JhIHCYfVxUGRvHQLBaBPQ7FK+XP/O4MAQ35hBMivKsw
         I7sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=T+F753dkBEZ/Gg1FLTfam2RvCT5QTfTPHA2d+xXk0Dw=;
        b=BONaWIljnqFvlHHn8YA+1h3DXLV2kvbZtqdf3f7+GnIqXjxQ0bD30oWyC5pjygEMFB
         0qjFsCHi2dZMZQk/LW44hIEabM86bt3oAQ/XowzRbO9tkekOD3Er6aiRckx9O6EZP1bu
         CfOrId2tiQX/St2+PNV4Mnfy5H6uGQSNu4iqRIa1fzTH8m8uqKe3TsHh+ye7V9q6w+4D
         HIwdBNKReMD0D8TfWd0SeZJ6swqv7u4zr3e/DFwScYEkHi0AbaJv5koIiNTOhdIRi5KC
         h2nRZN9/IZjdpz4+DhnUvu0Ih4cEucelk7AE2opqJFy0K7PX/nHED22ax8fk85JJKYfK
         BPjA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id h11si110675wrs.3.2021.10.14.02.34.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Oct 2021 02:34:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 19E9YUQr013353
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Oct 2021 11:34:30 +0200
Received: from [167.87.2.42] ([167.87.2.42])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 19E9YT86029351;
	Thu, 14 Oct 2021 11:34:29 +0200
Subject: Re: Questions about Jailhouse
To: Zheng Chuan <zhengchuan@huawei.com>, jailhouse-dev@googlegroups.com
Cc: Xiexiangyou <xiexiangyou@huawei.com>, changzihao1@huawei.com
References: <830ab7e0-e8b9-edc7-8a3a-4acdb8b0216c@huawei.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <58cd66eb-1988-cef4-09bc-2438f790f7f8@siemens.com>
Date: Thu, 14 Oct 2021 11:34:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <830ab7e0-e8b9-edc7-8a3a-4acdb8b0216c@huawei.com>
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

On 12.10.21 13:57, Zheng Chuan wrote:
> Hi all,
> 
> After reading the code of jailhouse, I have a few questions.
> 1.Once Jailhouse is activated, the boot Linux will run as a VM. If it is possible to run VM by KVM(nested mode) in the root cell?
> 

Nope, but you can find traces of an attempt in
https://github.com/siemens/jailhouse/commits/wip/kvm

> 2.I wonder why the root cell need to runs in guest mode? Whether jailhouse can run root cell in host mode, create KVM VM inside
> root cell. So jailhouse can support both partition and VM.

Two main reasons:

 - security/safety: If you leave the root Linux running in host mode, it
   becomes part of the trusted code base, increasing it by a "few"
   orders of magnitude
 - functionality: only by intercepting certain I/O accesses, Jailhouse
   is able to emulate the ivshmem devices

> 
> 3.When create a non-root cell, the jailhouse driver executes cpu_down() to offline CPUs, but the offline CPU seems to be running
> and respond to interruptions. And the hypervisor seems to have done nothing to wake up the CPUs(assigned to non-root cell),
> or did I miss the important part of the code?

The offlined and then "stolen" CPUs of the non-root cell are first
parked and then finally started again at (amost) architectural reset
state when doing "jailhouse cell start". On x86, you can see the SIPIs
being injected for that in the Jailhouse log.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/58cd66eb-1988-cef4-09bc-2438f790f7f8%40siemens.com.
