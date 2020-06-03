Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLUX373AKGQEPQ3WWWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE081ED3F8
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jun 2020 18:11:27 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id e15sf958353lfq.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 09:11:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591200686; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ueo2VUIC+XLHvfmvxaH3M3TeH+QYvfS4shKOxtT0oHhIyP/dLUtZSnRsIb6wXhk6Oa
         slRxhS8CGRc4IpGuG8EOee901pwBNywMaHZ5IpUwRgEf4vfOurPM13y8tzAORsSkO6F1
         8L9hXOGNK1k1R9epNNWb/yzoVQ3PT1kReFj+SgZUsD7zQoRWF5mdCstLoEe9egTV9uZV
         N8ergDJzPIUQxbt2fP1KJrEe5z74MSvNnsXosdcI55OoIf8B1OZDmTva1FiDZa21XAML
         hCHjCeTZDu5c+l55RIQUemVUmm/ebAD0mBFVlla8bcdJCDV8RO/TvAMMvk5wud29p/PY
         xLxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=Ep7kNWi60tZJZkieB99p4CB3PK7nlGJE/blxA7H5HLs=;
        b=vD0axVqQNZYSJy5MQtM/7/RQxLk0qgt6igpGVw/Cdinnn2OjgWa6BHdlKDZyKuawEC
         GRnSK+xqEs4aGGb3xjxKQ3JtLS3ZEcLgXEPpC9HylRJfh+2FlOHRvKzZTwskPjxFyUuG
         BmzpVCQC/joKMz0EJgSEydEOERXT59vAbWxkq1NNSvbsMHdVfjadd3SAm+tDohL7jkGC
         yk7XEffzYW3UHn4K/Vgj3eE067zmmVlIGZPngriT2Sj1q9lZMc2s7wHIe9zHcDLBHIny
         oRtM+jT3m2oNt7G+LMw9Nq7VF/crJqZoSM8Y2CQXS1v2jCYzcR/GR9zeXQjti4c07DNq
         +Q7w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ep7kNWi60tZJZkieB99p4CB3PK7nlGJE/blxA7H5HLs=;
        b=Q/ns44pfuLoy7YxCLRwVpFU+ncDcC1RAuP8chjX+AL08DOFYZrI4lECToS3Y7BPpiz
         1TBu/05++0kXCKx2AUqgehCX3nAFXhaMxktUjuu+eTJuW8p/ZVH4I8e+EdhsKe7X/HLJ
         Pju9P3EP8R2ZmPNsHjFi/BX/PfaaxhFGWKq80/cLMFszQ9Q/BvLuVeMTZjdIchrK0Upp
         Mi+Tdv9iUmJHGViQCC1Ml63yKiNo7X7DW2Q5dVbZ9RO7j7l9HOQoqZw0kI6SvUW61zBz
         EO+KrmZbH6ds40UthpY6/Q9afd/S+XLnwMpvI4O7yvkX8DThfI9qEBNlM1Ybu/5LJPQS
         jCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ep7kNWi60tZJZkieB99p4CB3PK7nlGJE/blxA7H5HLs=;
        b=W6p+yi1Fi+ged94T3Fe8NAbIugJ6XEY4qgiMc59nWx7DRrgWjuu+UQX9DIEtMe4qx/
         J3K7HL8ImUjKLpFkkxQpzFeO0ae6X5MbcmLTAnq2bs83vsMPC6K6g+J5nO7VaqeL89Su
         USNQG0JgxzBxBmPNUp4sMeo5S6gC0NKTF1RMnTDvcOWz8GXKZp8qi4lSRMRr/Eh88t2/
         EhsUqj+Mr0PoE/2uNGECObJjs9EG2H+sZHthTBcSycgQ2/23h/0dmi/nTjTM3mlGwGTt
         g9NF2lIiDxqBuAFs3AsQ7J7z+ekAP6QgPsJGaVL6+kJYJww4eBpHfc0Kd/cZGE8VEtvz
         vKDA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532cQ5jn6BRWnDzAF/LXKZRfPwbaTCovLrgs7Hli4NFII46fga6w
	1XZm6oVAyMO22/nIC0SBW5c=
X-Google-Smtp-Source: ABdhPJwzDwcPOyg5uHngcW2WGwn3S8YxY+MNRCA+Y0JP2oTTE2w8NXF7/Vx+JyJbA795PbZV9DpZhA==
X-Received: by 2002:ac2:544b:: with SMTP id d11mr114844lfn.157.1591200686766;
        Wed, 03 Jun 2020 09:11:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9e4b:: with SMTP id g11ls443613ljk.11.gmail; Wed, 03 Jun
 2020 09:11:26 -0700 (PDT)
X-Received: by 2002:a2e:7c10:: with SMTP id x16mr2505445ljc.277.1591200685356;
        Wed, 03 Jun 2020 09:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591200685; cv=none;
        d=google.com; s=arc-20160816;
        b=LRdioRjORVipOR19LsaShIHkIWcCoGzGRF1pugR5s/hfdF7JrOB0T8p0PZPeMQbWgi
         pm7ws51Nkly9o8ZczmH6HHOVNvCDkdmWpZID/ur25c1Ug1NOoSD1QqZ6SARO1J7xeUta
         27c51S2ajTdSSXorySZTqtMvAcDfMGG+rAgHr57sy3mcgevkVc5EegF38n5ipdZxsPBQ
         WUBaB3iAJFtcHJqkn0Ve2L3yn9W9klfqN46ckeDey69WeGARDyc6wjHx7oP3jQO9Denu
         WbnG9Em9dwBfHYoXBbedurNdtkt7tXE7It/FS7DPGMzfNhWjy2tjRj6Gqpr+vh9I2MJN
         OhjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=1zmd4Iw0XmQhAItfB8h8BrFapnWPZWjvRJEa8lXVcP4=;
        b=iZmys4SeybQDbRc1PvUJMGv4TctPPSIByd0xdduF7xEyQHuViX3CXT1+fl92zH24Fn
         Uh/3vY6A4pjmpuz3XBw3U1Lagv20+e1TkcuNjJRisg1n9drFstrkWxYPl8ue3rPUIgFB
         EjlPLgNoho3rbXy093xBKJBnwhhvQ9Ou4CT4+AVWk7ytyVGCowS6Byp8GLOv9HNgvO8A
         0zZZR+ezwMypb81F1SxNFP0OQCWnpiFyDhVk7/A67q5tcPzcWSHUIw9ndw4hSa5tARKY
         e4m5n3KDNWTq4dBN1yGczyLXipe08rjOetmWi/Vb6yhz455zapRMekGFUhahA79xT2wL
         IXvw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id f16si155995lfm.0.2020.06.03.09.11.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 09:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 053GBMq7011644
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Jun 2020 18:11:22 +0200
Received: from [139.22.36.189] ([139.22.36.189])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 053GBLku029778;
	Wed, 3 Jun 2020 18:11:22 +0200
Subject: Re: question on Jailhouse-Images network
From: Jan Kiszka <jan.kiszka@siemens.com>
To: dd <497738387@qq.com>, jailhouse-dev <jailhouse-dev@googlegroups.com>
References: <tencent_800F98F7CFF07895690D05760CB69748C805@qq.com>
 <684ff2b7-9e60-5680-ca8c-c624baeefd85@siemens.com>
 <640544fa-311c-c7f9-3781-1808c55f9900@siemens.com>
Message-ID: <04b90d95-fbc2-9ccd-0987-bbf5d20ab69d@siemens.com>
Date: Wed, 3 Jun 2020 18:11:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <640544fa-311c-c7f9-3781-1808c55f9900@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 03.06.20 17:53, Jan Kiszka wrote:
> On 03.06.20 17:45, Jan Kiszka wrote:
>> On 03.06.20 15:30, dd wrote:
>>> Hello jan!
>>> I encountered network problems when I boot linux image built from
>>> jailhouse-images repository on my rpi4.
>>> I found there is no network on this system, i could not get a ipv4
>>> address using=C2=A0 eth0.
>>> and I haven't found a way to configure the network And i can't install
>>> tools.
>>> So I wrote this email to ask if this is because the Linux kernel does
>>> not support related options.
>>> Is there a way to make the systemnetwork working?
>>
>> Wireless is supposed to work fine, that's how I connect to my RPi. To
>> enable it, you need to provide a /etc/network/interfaces.d/wlan file
>> like this:
>>
>> allow-hotplug wlan0
>>
>> iface wlan0 inet dhcp
>>         wpa-ssid ...
>>         wpa-psk ...
>>
>> Just tested eth0 as well, and it worked out of the box but had excessive
>> latencies.
>>
>> Note also that my image is a bit older (kernel 5.4.29), and the latest
>> kernel version may have more issues in this regard.
>=20
> In fact, that version is what is in current master of jailhouse-images.
> An update to a slightly newer kernel is not in the next branch. Feel
> free to test it as well.
>=20

No improvements with 5.4.42-rpi on my side, still lossy or otherwise
faulty eth0. Wireless is much better.

Maybe we are missing some bit, somewhere. If you (or anyone else) have
some time and try out different kernels or configs, compare to what
Raspbian does, that would be great!

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/04b90d95-fbc2-9ccd-0987-bbf5d20ab69d%40siemens.com.
