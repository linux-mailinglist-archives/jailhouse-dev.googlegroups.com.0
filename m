Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIMRS7YQKGQEHLS72LQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBF7142ED0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jan 2020 16:34:58 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id j18sf1857305lfh.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jan 2020 07:34:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579534497; cv=pass;
        d=google.com; s=arc-20160816;
        b=L2IgGogy3huUug/G4X6eeDoPJmhZc7QU8AE1L8ZxpAVdbbn8//MC0Q3RvpxtaszwUu
         jTqZKKVnYOBJZIbbmyzQ6uQfFyyqW/JSuIQovxIOqUTn+JwtfaqrNGJNX486V+tw/cBI
         UL6gtzk6RBTv+fH5ne0p2RwNZMsD3cYjB4Hm46okF1v18FdVYNHJaJ73Q7UtSmLJyTya
         mHzWqYY9SelMvZT+VKrrcp3aSk74cgFXsKwKVV0NymVlAsZPZxA9hjmx+6rg+vgZoDm8
         b0m9nu++jaFEncQEZgFnhfPYJI48e7Gc2XiMfRv0l1yxHY9pUB3y4lXcLcnwmZZmqDus
         7rog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=o6F2r0WHx990V/rZId2geIfz92XwcAsz0S7hkS0OsCs=;
        b=iFiRSpTBgAVJA9jt9XY1uMRIajKetvxlkBhZPX0UEd+TFS/m5FO7/pWQczIbRHoQWM
         MF6IyZuwK5LUq3DhovSXI+q5bt6VLg66+WNkIB+pTvZfd1yoJa8ShKwSVf48BTp7oJ0t
         xdALXYhjviFkilPg0Nu0huaU4kM7mDtj4vgp7ObUtjhiAqj6Oyb++uxUcimK+2gWYAsk
         GbBDrS7xdscKBGtLziDQof+SqDkCKYtuLEUdunOVMxcNYr1k4HKOfGw5GHTK85Nas0+Z
         fKrpm52RWC07otMTR8Lfg5xXzX9A+JD/LvfX7M1Iuz3svU71MC2olrN4CjdFn9Mvoq/6
         O/VQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=o6F2r0WHx990V/rZId2geIfz92XwcAsz0S7hkS0OsCs=;
        b=jOZVZQhbkvRZKWs8vOTM9ncUKcfWTclaNmOKNPmr+BYW1gU5CbA0DuJH+lj5/8kpTf
         RM0Z7jSB0nzfMpHatHwun3oprAUxSClFXlIqQzQd9disC2JUVtvvhtBP5EigAdy6EPzP
         n6JuaDRxhXzRk/jp7iL1FHuRP2SwbjRNXFY49fF1V6dq6OPsbG1UYgUqPIoqgMJ1wkD1
         UFPML52V6s0gZ8SDt9vmf03Bq1Lr2WZjEyuT4ZfoQieC2/8GUtmUehbZaxj2C/xG7nLc
         J03BgA0Aoe495KMW3dBJE5CgSQgaPrz4/a1GwOKU4JJffDxI3KzM0LuRZBuiPCpudGM6
         0U7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=o6F2r0WHx990V/rZId2geIfz92XwcAsz0S7hkS0OsCs=;
        b=cWT4AuHeitezeiNj8HyJeZo8IK/vrF9FzvQTs8cyHx+io3qPOsazl3jkcKkitvVr66
         J5SO+q4Lc4UKc2EbXPG4o+kT1ctmRQqxFIgM1Xwv/O3Y0Pd+MCAaf7W6IUssfHj/OuiS
         E/ca3m835GfOQuZ6l/cu6uLX5JpZlZQnxPxGHhEcIDKMBCLW2x+r5AzeMb+SHfmX4baJ
         pjfcXivT43NcQ1XhikBVIrFmYkH3RjA/DkxBdewPUdHxP6QjDFOr8Pjd2MPsK0niCk3P
         El+qTdhjbaGv/F5llKhm9STotiYt4DdteudXv0C3IzEbvFgto7K+cje0hBs7TuDS+5dI
         YYnw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXn+T3vPqgpdobezhRbbHWnVxLaWmrQHrqDeqC9zHNVFUnI0jEz
	IwkEV3r1YVyU0bque0DGjuM=
X-Google-Smtp-Source: APXvYqztb7XkjdP3WnyIXaA0/pdtGv/onKyMv9nesctZFpmkMCOZgujC0grZtrmPq9OuIKhBv/hS6g==
X-Received: by 2002:ac2:4833:: with SMTP id 19mr4713481lft.211.1579534497653;
        Mon, 20 Jan 2020 07:34:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:554a:: with SMTP id l10ls3113690lfk.14.gmail; Mon, 20
 Jan 2020 07:34:56 -0800 (PST)
X-Received: by 2002:a19:cc07:: with SMTP id c7mr2514752lfg.177.1579534496728;
        Mon, 20 Jan 2020 07:34:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579534496; cv=none;
        d=google.com; s=arc-20160816;
        b=EOzrbZCiYOB4i+DR5A3U8+VnDZbMSB++tRZpJ7K+VczCWQPqWkv9CKkoWYdvtbVDI3
         Agncp5JlkPHkNC+9uFS+eL1ueI+1nf9l14EG0HbBek45z9ucW1isqMoB2VF4n1JBFIbS
         e7uEEg48mR3ubNwuTKHZw8EQzSCqtI9+a+VvF3ghGlq6bxlIsOXxKPGTRtBtZu1qlTqz
         SFJABIYMS/DP33kxzLf6maRH0GrpuikhEmkj3Sr5Wl8gbrz4nGZug5uuL2JRqrpeUR+V
         KuO72BHOFZwWfEpuRfd04OyYUm01houAvNjJsVzHVpmX1VD2ZzHjDWVN/lML2ed1aCW2
         tFLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=QLBtuy+c3BvD6I8e77tRU8motOYpmZy3ViQwavIMQW8=;
        b=XLAC8diw97sps9gHHl+MSKG7ql2XYQvaxDz6yMyUBm59huBf4V6Eh1IpMXnV31GRai
         IE5auxA/K9QjJfcMT//Oapl4QNj5p+1oRAIRN7FI29umo4+8fnxz15T5EDErd6Nc2m/K
         fUnY7eK+n1KwW33c+bEyaSVQcwkol6c5xN5oTwbEVsAw9k1hWEDoIQCFxMIlvj5r3GRL
         8b+wx0WSAhD+noO1BzrP/2CvM11mZ9JazlKJACKFjTuDFY04584oriwkq2MpjTH06Cwx
         yestbirG48jJ931E46M/wOsv2aKIG/EF+Dp74mpA+SjsyhbefG/3IAEdcUCYD6l7zG2N
         P3dg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z16si1244288ljk.0.2020.01.20.07.34.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jan 2020 07:34:56 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 00KFYtct031222
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jan 2020 16:34:56 +0100
Received: from [167.87.36.229] ([167.87.36.229])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00KFYsJE014585;
	Mon, 20 Jan 2020 16:34:55 +0100
Subject: Re: Next jailhouse version
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <b800311d-e075-b2eb-a461-af974d93a0d9@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5146abea-3572-984e-5975-0dc542c3d4bd@siemens.com>
Date: Mon, 20 Jan 2020 16:34:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <b800311d-e075-b2eb-a461-af974d93a0d9@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 20.01.20 12:55, Nikhil Devshatwar wrote:
> Hi Jan,
> 
> Can you let us know when the next version of Jailhouse is planned to be 
> released/tagged?
> TI plans to migrate to a stable version as part of the LTS kernel migration.

I'm planning to tag somewhere next week. I was briefly considering to do 
one more config format change, but it's better to do that more carefully 
after the release.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5146abea-3572-984e-5975-0dc542c3d4bd%40siemens.com.
