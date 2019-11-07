Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBEPMSHXAKGQEMDSIX7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 26306F38FC
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Nov 2019 20:52:50 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id k30sf729713lfj.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Nov 2019 11:52:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573156369; cv=pass;
        d=google.com; s=arc-20160816;
        b=qT5sfTtlPPe8wxBgyP0qNOcQ0MumvrB3Hmx+fgYNSzhOruPnEZQQl+B7DbDZQK0NVm
         crjyc3iJGLLd46RX6ZLf/upF7wlull6IKygx1EWcLqQwY4JXSGn4i2G9mpxwpw2MBkry
         +rhIRWBCRVYjNw9vR9GZGcjN+arkQSbyr7XlMGUophTFdP0eHv3FLzzwxgN8atB1aKBr
         Tx4+bREJ3TB2UMtsJtQ7s01fptrcrw2+7FP7efJPj4uUuA1JrU4+siaxuGT/u3wV44Yw
         +Mm5fZEcrwA6MRmmox0pI+tBFrsndV8VVwN7ne2b1bczwKH9RLYazYoJf8WB1VhyZJ6I
         ZbEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=KnW91OSSdU4YoCEmVx8aE/tajAz5cmghjjw8NphJN6k=;
        b=N5ru1vnz/3f+0Qb7YFlBKvO/18emtP0nEQ22sHGmA7qHKKFc3NJ9P0SgCRy5PH/uTh
         TkDXxzi7Sauq59JKLwYWudrIbOGZWMdb54a4+KhZIuvraysMJgB4ww22Z8DoqbLVt9wW
         gqsxUzCtZaTaUEVqIoSZw2YcZbHvr59Hn4nvoKeqyU6/lIlQTqI6/ceCNLOnoo5gm4M4
         MzGIpjRFxYOyuiJ+EIdwlTXcey0UUyeRhFSvyi/TjlXqyIiogVg772Df9CrHb4sCqbO+
         3FkZ2An/zg5/Ri56ndy9NwLA0Kgqyc1wTPbVZqkkGYXGkBGrJu9i1amEezH8+rmjniDH
         jhHg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KnW91OSSdU4YoCEmVx8aE/tajAz5cmghjjw8NphJN6k=;
        b=minFSsiebPdjXc6Z7bwy8rUJx5fnfQzXOw888Dhsnij9tf1WG8T05GYvmyUTIOsAGm
         0mk1uBB86IylsC++mzj7QRLPL5vAJ2lKMshSTlK2AZxyQQQOPyj1L9g37i0jLElBmkST
         VskqwAHrzTqqp/zeGRemFQ4rQuCCMDbAuc316Smsx2m3KlmIa5GewkGnm/tIqR4CmoMQ
         3uWqnFDQBvXL2LVmHJIliXCtZo9W0HJ/q7OYXhJYxKOgaJaNxazKsZjBHfizu1DyrjMB
         268L71d2HtboBImOCB6/xtjrKxy6C+vV98caZbROf7O8xhUyoGyhjqNq68ohhQ89jDrn
         TISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=KnW91OSSdU4YoCEmVx8aE/tajAz5cmghjjw8NphJN6k=;
        b=iDyq/wPCoHTwB5/4BKAIHORzDUW8HWjwCR2srkmQsigy76/VrHmaAo/IQX6y8d2qya
         /zi7HKo3X4f2yp5OQ7gcxINClkhrF6H4eO00fn7S3fsvu6cwgOZ03ybSNexEdmAY8EGU
         IfuD9PgfkJYe1gGEBGjezSWLW05L50QmKdZ9sEsadFqC40d+/45/YN1b0XrA0hfCgiKl
         imSGLFw5utmvN2hQxZii9shEKtgrxLBnzoG9E89KWKyTuzsjPq8SBni+yItGcUizbcFu
         werqaTz4p3toyXdKLGUXJzpmXwWlbZrKNgeWHviKDr1hkmowKWWMt/4Dw0Wvd2a/elMR
         jRyQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVASry6YkAZjEsf7/9Y0OwfqXr2QHR0bu/WHIs1alJtH21w0Yft
	rvSUdh7p5cOoUq3FIcT6Hos=
X-Google-Smtp-Source: APXvYqw3rPl9wzDfYLvwd48ckFbwzbmdGyDXVqA2odVmFxIv8GTyzm/KWzZwi+C8tRyIklkQqua0JA==
X-Received: by 2002:a2e:9c94:: with SMTP id x20mr3781880lji.64.1573156369553;
        Thu, 07 Nov 2019 11:52:49 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4465:: with SMTP id y5ls56712lfl.16.gmail; Thu, 07 Nov
 2019 11:52:48 -0800 (PST)
X-Received: by 2002:a19:800a:: with SMTP id b10mr3713126lfd.15.1573156368651;
        Thu, 07 Nov 2019 11:52:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573156368; cv=none;
        d=google.com; s=arc-20160816;
        b=UjlQwR4lhqNXoZKUE9qSsiaoIaU2pwF0o4OV8JvhJvUQ0VwEC6ET9ker/K7AiXgpZP
         PoNIcXcxHoNvhbYQNzsj5KB5Pumpq1gEE6wwI7NAg12/Yzqh5QlzyBW6btAw+3oB7LB6
         1k+FLqIeGjQKUB+DP+LryOfW2D5TpnH9TJUBYr0lf7rhGTVpWNzwpa7yH2gg30z7JCuj
         XLxK7Yz1sfdnRKs8CjrNGmuQGOaY61x6ohiosurWcnxXx/DXctK4A5+rXFwTMQIO4l+w
         Mjxg0GuOCKM4ap4VPmXKgJ6WsJd88mAFAKYl83/bxIbOStADeaZZYi4EhxXbSRv1k4pf
         b+tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=vfqru2puUExDTF6zAAevZnPjPCnOhoKXhj/StsY3Re4=;
        b=qnKOAU5nKZSHa3r5XkT58jzabevmE5wV0HThAaa/q4cn1C8kIDOpYNPFAmngiextkH
         YB+VbD/GZQ8NkbWHoKmY4Z9XH0fbPQeIIxhNOOh5U37wCOs088z2NcyLMX4a+ItFfWkU
         VYNkctue7lbHrR8E65d8PNNJZhJaobKKCh9HsfHfEGVinHaA0ABVyJWB6J37UHY72fVS
         s2v0rS6LbQuTZbMeQrPR6CMirWpNTOy4TPX20LoO2XTNcFjJjpIx9kYzWUM+gWap+sKy
         OiHbRyIcj4LPdeoEJM96RJHZIo4BbJJtw/IjftbHnA5EtXs5mwMDa+N5TTg8JfRDt9Iu
         b3rw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id r71si181929lff.5.2019.11.07.11.52.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Nov 2019 11:52:48 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id xA7JqkVb003705
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Nov 2019 20:52:47 +0100
Received: from [167.87.0.206] ([167.87.0.206])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xA7Jqirl026533;
	Thu, 7 Nov 2019 20:52:45 +0100
Subject: Re: [jh-images][PATCH 4/4] start-qemu: Update x86 CPU settings for
 latest QEMU
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <cover.1573147076.git.jan.kiszka@siemens.com>
 <237f869c07579c80e0fa121d64c100c257cae489.1573147076.git.jan.kiszka@siemens.com>
 <0c4b85bf-adad-175f-38a2-6740a625ecf3@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0e86aadb-ed3d-a456-086c-6915539dac73@siemens.com>
Date: Thu, 7 Nov 2019 20:52:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <0c4b85bf-adad-175f-38a2-6740a625ecf3@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 07.11.19 19:58, Ralf Ramsauer wrote:
> On 11/7/19 6:17 PM, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> With the next QEMU release, VMX CPU features will no longer be passed
>> through from the host when using kvm64 as CPU. Rather use "host" as
>> model and ensure that incompatible PV features are off.
> 
> ... But why? Do you know the rationale behind that decision?

The pass-through was not intended, rather happened by chance. The idea 
of CPU types like kvm64 is to provide a stable, host-agnostic feature 
set. CPU-dependent sets can be achieved by "host" and similar types.

> 
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>   start-qemu.sh | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/start-qemu.sh b/start-qemu.sh
>> index 34dfd82..abf2537 100755
>> --- a/start-qemu.sh
>> +++ b/start-qemu.sh
>> @@ -27,7 +27,7 @@ case "$1" in
>>   		DISTRO_ARCH=amd64
>>   		QEMU=qemu-system-x86_64
>>   		QEMU_EXTRA_ARGS=" \
>> -			-cpu kvm64,-kvm_pv_eoi,-kvm_steal_time,-kvm_asyncpf,-kvmclock,+vmx,+arat \
>> +			-cpu host,-kvm-pv-eoi,-kvm-pv-ipi,-kvm-asyncpf,-kvm-steal-time,-kvmclock \
> 
> This should probably also be added to Jailhouse's README.md.
> 

Good point.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0e86aadb-ed3d-a456-086c-6915539dac73%40siemens.com.
