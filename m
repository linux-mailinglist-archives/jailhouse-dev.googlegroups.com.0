Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLPA7LXAKGQEX26LTXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id D642B10B44A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Nov 2019 18:19:41 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id x16sf5115771lfe.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Nov 2019 09:19:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574875181; cv=pass;
        d=google.com; s=arc-20160816;
        b=HcK7swcD8wlo/YHvmm/47nwEppvJxD0NRbiKDSZ49AmjTY1ZZxaakjeMV4Mn0zOfvH
         fG3jFlHjMhxHJn/Wx5sWRw78U5pvwLBEyToi+F1bV/oY1G+PTocZLtipXBHJ4VwHtdYB
         z9tZhNefmm7OrQ3hcaGJIF2a6xvz9JlUkYVkV2RFX49033AExGcvGXA0CbQFAfAnKNFp
         rYL2ep4hdqURedvrRsZ23ILB6DyZYeuqpbdD21Nkil5bgjaDFDFlhoodv7LqQYu1Gsct
         LLicUE87kTEr+vhc6KIzrh2SCC6LInRIi+kBwLFWlAPCm+fXoeKfOxK6YaqjEOWaqHS7
         8Yug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=tpadsKOa4HcXHLvDcBgcS3KE0e9DrpTGxCzipXJhmJw=;
        b=sqLQvc7upUXQC5oPX23He3+7EI9E5adMX1rt0LZQGLdNQKyHvH14Igo+QLfOV+7GDG
         iQt/JlCfugFNUOyVgbslJXtU+AMB7NbZdl3m1lhAW8cwlN40fuZxcGcY3r2qRO4SyuSg
         CG3fWk+rLO8y4222kVum0Ut191aqdQQkgfSc+Q0vKjVncn6Vq38Xy3pICjpLwGZvAGzE
         50LcCXVSM2HN6H8+V/Gc/EUDKrmTXV0Iw2Ki6KOSu7uJ4m85LZcAHFZTCehpYVtT0k4D
         2NaHyp2bXwulYWyc7s/C99bBNcuOSiOdfWOSndlksqVtLgYjacvXtI7xQMuCIp0UzUAV
         x9ow==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tpadsKOa4HcXHLvDcBgcS3KE0e9DrpTGxCzipXJhmJw=;
        b=mS32RelxmuwwXMggWh0Oqbjs9KTDiZgu2JL0zioZOtZxnY/nk75WXqfawt/MBlixhd
         VVqDVscVvqJ6n0ZCBdCFdnI86TRKIIVkWVlEVk6KBoJTsgjwNJXPTSqbAF6qfQpPy+uM
         +r8RPPrGzmAxsN1SxYkURUxLK53hct2b8ybdo4YRqM5MEITFNU0ppOxgk4rFp713eHtd
         5zVMa7t5vPKgfWmzVVBB9B6NYNsKN+5KYB3eMjCjluquoR76tUJal4WItkem1V9iUKWJ
         iXVuvgPHijC79mddQxMC0nLb8qY0J1MrYMhV3cAievPFsbCDqMBVV1TS6Am3eqWVZXz5
         +MeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=tpadsKOa4HcXHLvDcBgcS3KE0e9DrpTGxCzipXJhmJw=;
        b=kM+Koklxkax1BhcR8J+7Th8H3UXRt0lya6gU4n5Y3LAWGdP0R+MiH4qouWDXNVefn9
         kPL5nwYzlpTfdFdRJb5cBJc1yrWSoAvAPLchHyem2RukNiZbmFjTCHTMFPmR/UvH14uz
         3CWq/hKoIUz0zRgbGuvvhFnsp+EFLeWrXDHaf/M/GjulyeRhHiaSMckjA4M0gEYtDT9B
         /Z4kjO5+ISCSfYQ7ZhVg6vixqK7wckhll9mz+6UPW5jkUAaBMycxW7wD1xO57oa3Sclt
         CtJAdaK4sGaitGcm+h50Lu2ubDxt642CHv21KNZnYFZmseki/o4U+v4D8Zhb/9YZor70
         IgYA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWMlsjKxDZx3fuhpm/oPRwBApWtbG2kqO95af7t3XHgus6mxgF5
	/PFhrDQJ4WKZgKkfo5+tNS8=
X-Google-Smtp-Source: APXvYqx22gLPcJruMzz59Tv9gVPoujfTKq5KZnuiVTg6iI2l4dHIG+T/TEH6ZwTurCimRqfmu/tW2w==
X-Received: by 2002:ac2:4946:: with SMTP id o6mr16119033lfi.170.1574875181377;
        Wed, 27 Nov 2019 09:19:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b161:: with SMTP id a1ls3471190ljm.15.gmail; Wed, 27 Nov
 2019 09:19:40 -0800 (PST)
X-Received: by 2002:a2e:86c4:: with SMTP id n4mr17854080ljj.97.1574875180519;
        Wed, 27 Nov 2019 09:19:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574875180; cv=none;
        d=google.com; s=arc-20160816;
        b=kGngjifWiAgPBpSBBLPGkWtNQ+sANIAwP7eVQJgoloFoQdwbuQ4dBGM+WB+XeGH6P7
         8d17mpShYbzQNxFeALAdgKLMw+bgQrUJWhKUMXZnjiblfdef6E2DjBSRx4Ak6TAvNcdP
         N/6FNPHGkjmw7QKSyQeXZTL+tbpKCwUFEY5aWdvW8ll78lMxqpXZL9I6+oEZBeSR5oFY
         uF1+sCJqH5hEt4uyfN83rJh6KcaBLURAevNIjdEJ7Mw63Wp7Kq6ui5cqcS9vPu7dBy89
         VeVthJkQTXlJipRw1/gLk/C47CLrIUSpkchOw282uAXpkf5IX5E/5O/vo03Zh3+lGjF4
         s6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=oxP4JUiNk8JFr9TPom6Mb/wExpIL1UeqqtD8g4XACqY=;
        b=BiADUmBq8V+rIp65WX5BR89nznnrdkjeToCcqIHeb9FzClJm1Y+mH1fOf2MZmEtWqv
         dJxD7vE6tZHjH0yhj1MOV24GgUZXniahKhsGenxZ5B+PE2Id91rQrAzTGqHTsHxMLnIG
         8iCBq7/RekcUH8F/eqNkIpa0FJyPDLZ/VWWcef1dB4cAYF2qnsKHYHDLNCyF3c9BicH4
         bQNyZ60nuNpDAd/qS80wv8VyNYomEDXd59NL6XZD4qgm76HpJsDVj1iceHrSL/wKk23g
         xgU7227LFo/or2m9vP1vzE5KT0V5c8Sica9hm0pIHKZKX4pDk8IG6UwcgLgAbJcOsY6J
         fMBA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id x23si589282lfq.0.2019.11.27.09.19.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Nov 2019 09:19:40 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id xARHJajl008247
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Nov 2019 18:19:37 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xARHJa7L001485;
	Wed, 27 Nov 2019 18:19:36 +0100
Subject: Re: [RFC][PATCH 0/3] IVSHMEM version 2 device for QEMU
To: Liang Yan <LYan@suse.com>, qemu-devel <qemu-devel@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>,
        Claudio Fontana <claudio.fontana@gmail.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Michael S . Tsirkin"
 <mst@redhat.com>,
        Hannes Reinecke <hare@suse.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
 <efd5fa87-90de-fccc-97a5-a4fc71a050c8@suse.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <fb213f9e-8bd8-6c33-7a6e-47dda982903d@siemens.com>
Date: Wed, 27 Nov 2019 18:19:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <efd5fa87-90de-fccc-97a5-a4fc71a050c8@suse.com>
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

Hi Liang,

On 27.11.19 16:28, Liang Yan wrote:
> 
> 
> On 11/11/19 7:57 AM, Jan Kiszka wrote:
>> To get the ball rolling after my presentation of the topic at KVM Forum
>> [1] and many fruitful discussions around it, this is a first concrete
>> code series. As discussed, I'm starting with the IVSHMEM implementation
>> of a QEMU device and server. It's RFC because, besides specification and
>> implementation details, there will still be some decisions needed about
>> how to integrate the new version best into the existing code bases.
>>
>> If you want to play with this, the basic setup of the shared memory
>> device is described in patch 1 and 3. UIO driver and also the
>> virtio-ivshmem prototype can be found at
>>
>>      http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/ivshmem2
>>
>> Accessing the device via UIO is trivial enough. If you want to use it
>> for virtio, this is additionally to the description in patch 3 needed on
>> the virtio console backend side:
>>
>>      modprobe uio_ivshmem
>>      echo "1af4 1110 1af4 1100 ffc003 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
>>      linux/tools/virtio/virtio-ivshmem-console /dev/uio0
>>
>> And for virtio block:
>>
>>      echo "1af4 1110 1af4 1100 ffc002 ffffff" > /sys/bus/pci/drivers/uio_ivshmem/new_id
>>      linux/tools/virtio/virtio-ivshmem-console /dev/uio0 /path/to/disk.img
>>
>> After that, you can start the QEMU frontend instance with the
>> virtio-ivshmem driver installed which can use the new /dev/hvc* or
>> /dev/vda* as usual.
>>
>> Any feedback welcome!
> 
> Hi, Jan,
> 
> I have been playing your code for last few weeks, mostly study and test,
> of course. Really nice work. I have a few questions here:
> 
> First, qemu part looks good, I tried test between couple VMs, and device
> could pop up correctly for all of them, but I had some problems when
> trying load driver. For example, if set up two VMs, vm1 and vm2, start
> ivshmem server as you suggested. vm1 could load uio_ivshmem and
> virtio_ivshmem correctly, vm2 could load uio_ivshmem but could not show
> up "/dev/uio0", virtio_ivshmem could not be loaded at all, these still
> exist even I switch the load sequence of vm1 and vm2, and sometimes
> reset "virtio_ivshmem" could crash both vm1 and vm2. Not quite sure this
> is bug or "Ivshmem Mode" issue, but I went through ivshmem-server code,
> did not related information.

If we are only talking about one ivshmem link and vm1 is the master, 
there is not role for virtio_ivshmem on it as backend. That is purely a 
frontend driver. Vice versa for vm2: If you want to use its ivshmem 
instance as virtio frontend, uio_ivshmem plays no role.

The "crash" is would be interesting to understand: Do you see kernel 
panics of the guests? Or are they stuck? Or are the QEMU instances 
stuck? Do you know that you can debug the guest kernels via gdb (and 
gdb-scripts of the kernel)?

> 
> I started some code work recently, such as fix code style issues and
> some work based on above testing, however I know you are also working on
> RFC V2, beside the protocol between server-client and client-client is
> not finalized yet either, things may change, so much appreciate if you
> could squeeze me into your develop schedule and share with me some
> plans, :-)  Maybe I could send some pull request in your github repo?

I'm currently working on a refresh of the Jailhouse queue and the kernel 
patches to incorporate just two smaller changes:

  - use Siemens device ID
  - drop "features" register from ivshmem device

I have not yet touched the QEMU code for that so far, thus no conflict 
yet. I would wait for your patches then.

If it helps us to work on this together, I can push things to github as 
well. Will drop you a note when done. We should just present the outcome 
frequently as new series to the list.

> 
> I personally like this project a lot, there would be a lot of potential
> and user case for it, especially some devices like
> ivshmem-net/ivshmem-block. Anyway, thanks for adding me to the list, and
> looking forward to your reply.

Thanks for the positive feedback. I'm looking forward to work on this 
together!

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fb213f9e-8bd8-6c33-7a6e-47dda982903d%40siemens.com.
