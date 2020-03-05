Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBZ7MQTZQKGQEECLI7VI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFCA17AD32
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Mar 2020 18:27:03 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id t2sf1845018wmj.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Mar 2020 09:27:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583429223; cv=pass;
        d=google.com; s=arc-20160816;
        b=pqpZokzgTb74HNuJW4eR+sJpm6SA/UYI51i5stubr+P7TFMwT+518RmiAmj/OY9AmY
         FYmabvRyKAOkgqctwCW4V+QNt9OZDq79kmUi0iAqo1hckGIVuzhGlfQAOITCPlVVYNVP
         Fhq73xVkoFEUjvzcqX8wZEZoD6ib1cE31cSzNMCcJys7hNSBDNw94SOTg5B2w+MOjVtM
         TecZL4h1EIj/e98nlYtMFIxCRXnDyRle3ntzGLoYAprzyk0goYYO64WtyctceyDp1GI1
         Y2uYNz6uy8r1DYVN8dNZ9xwnXKL4O7RwLoCVEyToHxnRTS9/WzpcngK/OOGnT4IVjSh0
         p4EA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=/g+wGRrQMxBehhjmUWtDdbkPKV2kDWm+az5xe3GYbmg=;
        b=WGqAC1nYfAuIaFEf83LaCx73bv0U0dZB3VdNYW/TVHdBunLl1aN3RXXNJuCvaG3MyT
         f++M5swViMEvHuCfMqI7SpPTFVm8Sb8NGNL1WrYuvew/jvlrfWXui4hSgzp/ddMw7kON
         8c1bXoQmXaforzeHXuc8v89sB2DrJUB1MZ5pQpmKkzO6olZa34lNAcxm1t9qShKRaihu
         VNhrKHB+fzZCM8VjwChwiVcC+aiHqyvlsdumAvIfOXL9YMwFdwRX9iGcOpk0j5nWF48V
         VuKQV4aF+usGqpiA0Nyz0H3N/+fGQPf4QjTBp3+9hrDwjST1UH43eMg1o4p9XJuMCFty
         Co+Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.othr.de header.s=mta01-20160622 header.b=P4MnvwQe;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=othr.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/g+wGRrQMxBehhjmUWtDdbkPKV2kDWm+az5xe3GYbmg=;
        b=F+O+G+gudBj9wSot2WW+M18ny+6DNNVla8v5Ij/HSyLgBp5mRHw+/Ssx2v2Q/UpzLr
         tlcfJwq0YGOXsY39WcD85fdGNu4Ft6xP2ZFzWuWgHZ8YkuB+ZaH8gwg9VoPc59JSk2np
         LTzyQR4tLHuGOEOJTHDuPkPaGKAkyAG/gvZI99Z8W/Z9N9fix+9+QTMzUbzuWmwCKufv
         58ExpTKcFCO4tBtSqVVadicoxRvBSCYFfcxtUpZ3q08oynRAL5uD8Ce7FsObi7JFn4NQ
         OFVt7XS0ZtKmP0VnYhcYkkt0+UzEw9ZOh9HH7D0dku16BJd3jXIxFD2W0U11o0CMHoQS
         vjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/g+wGRrQMxBehhjmUWtDdbkPKV2kDWm+az5xe3GYbmg=;
        b=PEyhqlkj3Avo+uZLdMXTbizJSOuSV6bW4Vg82s8V/u8E0W8pldWI/QVUHperJwj2L5
         Uqfc3/PxsSWcy6wfHc87ouLv0b44cCsbq9SSSMXJyWykbQa6xDKJ7aK1GmdKlHOqDnoP
         Z3d4X2zUuefzWtHN1iH4ar82JSmRDWAXH3/n3/ahzbbuOABHidGU9jAi9ob4D9PszclO
         r9dHjeVY25TIOoLSKBKKx9B9BRSHWY1H5f4g26X5RWoaC8aBkIqJo+ZZZ3gtHN+T+JfC
         PNFiS0aE3AvSh4wgB0xwNZE+/jLHF46cIl5LsHgC0Jhozgc692EUlw1AjI/uEK6g/KYf
         SYaw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ29264oIiDYWWAHBuzYrhnhTpuTPg9JtjGytOIiZzVSyBVGvOdR
	cgX67q/igNmyFdd+bGXlVzc=
X-Google-Smtp-Source: ADFU+vucafSwudKHOAD9diyQnToQ+TnedBVHUsZCTfVt4n+r+EAp7NFoA98+4oHiDTq1UCZO4w5CFQ==
X-Received: by 2002:a5d:4450:: with SMTP id x16mr31041wrr.106.1583429223281;
        Thu, 05 Mar 2020 09:27:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:61c8:: with SMTP id q8ls936835wrv.6.gmail; Thu, 05 Mar
 2020 09:27:02 -0800 (PST)
X-Received: by 2002:a5d:6b8d:: with SMTP id n13mr14226wrx.292.1583429222584;
        Thu, 05 Mar 2020 09:27:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583429222; cv=none;
        d=google.com; s=arc-20160816;
        b=pEi281QOxPZYFQZgS22GOTEM52QmwtUWsE/er/Ind+UjiO53h+fcP5utfG6LrspaND
         m9Potsabn0Cx2QQ7K4WsF2uMlkEu92NA6P+ZneSsZSMohrdYcstsZtKyOw++YoZls0MX
         FiICjZCVGKOr8K07nzCqZRiiDLXsmgfCh67jRw31m26RQXCCKlXBY9keAXBWLM/B72Hl
         jgoIlQYSYu49vZyzudj7DpHVlADHaS7vYUZiXuC/zzRKfbqtr30HJquNRqnPM4XyyQLr
         PofdyykT2m89nNWBZFD/QliWII1Ls2OwCCls/qCmi2K3VjcffexazJWW4+PweinZH9ed
         x75A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Um9Yd4r8Pa2Bnbg5BGpdKo3b8VPGBBjR3yg7+BGaw5I=;
        b=bXJmiPouYnb9kfqe/gzHAfEVJjnaQJmCFVsspCKgnAc0wA+e4USlwzymIbdJKnRsT7
         9mJXNOHRsA4lHYJ38t5Fn6noFWzHBVACmOVEyJprt1pikMM823++1CAHavR1tsf4tvpG
         gqDxYTm5AG1TwASYuCvAd49Q2Geae5UoQra4XBs9ko1mKAbtmM1J6mdWpJ3jn75V+8Fo
         vsZMR6kgqX8y+iMGsHRePnMHDLIaC4UzWAEYD4+RPjEQ7mZak0SEQghA3dUYxAHg39N6
         2lIjaD1TWl0CuZ5gejPW0OyrdQRCcZcjBxuB0eAV4+suXTMXZ/YI1F36nsqVYhK1UaxU
         6AXg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.othr.de header.s=mta01-20160622 header.b=P4MnvwQe;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=othr.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id f1si248801wme.1.2020.03.05.09.27.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 09:27:02 -0800 (PST)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 48YHjx6nH4zyBv;
	Thu,  5 Mar 2020 18:27:01 +0100 (CET)
Received: from [192.168.178.79] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 5 Mar 2020
 18:27:01 +0100
Subject: Re: AMD: non-root linux inmates
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, <raymanfx@gmail.com>,
	Jailhouse <jailhouse-dev@googlegroups.com>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>, Jan Kiszka <jan.kiszka@web.de>
References: <c2839a0f-c1b5-9139-43d5-01139341981a@oth-regensburg.de>
 <814c68a3-d59b-75b6-ce96-411cb8e5f4a6@siemens.com>
 <c28ae172-5eb8-e9d7-b322-36d7016047dc@oth-regensburg.de>
 <445be499-99bc-a739-f6f7-49dc9d8f9b6a@siemens.com>
 <03de53c2-f063-2288-3ae0-c813b53642ac@oth-regensburg.de>
 <12bf6841-413e-58e3-e7ba-0c7a1557bb48@siemens.com>
 <08841e36-df70-50e8-8094-426d72fead52@oth-regensburg.de>
 <36fc6114-d1b6-da9f-f2b6-b76c1f33b7ed@siemens.com>
 <6de58d25-f1d9-b0ea-b0d8-631250e5ddeb@oth-regensburg.de>
 <baa5bc4f-74c4-c60e-0283-a8dcef07b8bf@siemens.com>
 <f2ea45c4-1c22-77cc-a6dc-831aa1e27a3c@oth-regensburg.de>
 <c0402eef-a0c8-40a7-b021-ba0f9f8422df@googlegroups.com>
 <b434f550-5700-ba44-e88f-ea76c84a6d0d@oth-regensburg.de>
From: Andrej Utz <andrej.utz@st.othr.de>
Message-ID: <bef2d9ff-b6b4-8927-e36a-e9ec41d0ed1a@st.othr.de>
Date: Thu, 5 Mar 2020 18:26:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b434f550-5700-ba44-e88f-ea76c84a6d0d@oth-regensburg.de>
Content-Type: multipart/mixed;
	boundary="------------48CDE42D320A0720D5F2B65C"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.othr.de header.s=mta01-20160622 header.b=P4MnvwQe;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=othr.de
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

--------------48CDE42D320A0720D5F2B65C
Content-Type: text/plain; charset="UTF-8"; format=flowed

Hello everyone,

On 27.02.20 15:46, Ralf Ramsauer wrote:
> Hi,
> 
> On 27/02/2020 15:24, raymanfx@gmail.com wrote:
>> Hi all,
>>
>> I'd just like to add that I am experiencing the exact same issue as
>> described by Ralf on an AMD EPYC 7351P.
> 
> aah, 'good' to hear!
> 
>> The stacktrace is the same as well:
>>
>> FATAL: Setting invalid LVT delivery mode (reg 35, value 00000700
>>
>> However, on my side I cannot get past this by just handing over the
>> xAPIC enabled; I get the same trace..
>> I added the printk's from Ralf's diff and get the same output:
>> ...
>> Before disabling: 10000
>> After disabling: 0
>> After reenabling: 0
> 
> Great. So we definitely have a systematic hardware bug that doesn't only
> affect our CPU.
> 
> ... Did I already post my local hacky workaround?
> 
> diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
> index de691329..7f51b062 100644
> --- a/hypervisor/arch/x86/apic.c
> +++ b/hypervisor/arch/x86/apic.c
> @@ -340,7 +340,7 @@ void apic_clear(void)
> 
>          /* Finally, reset the TPR again and disable the APIC */
>          apic_ops.write(APIC_REG_TPR, 0);
> -       apic_ops.write(APIC_REG_SVR, 0xff);
> +       //apic_ops.write(APIC_REG_SVR, 0xff);
>   }
> 
>   static bool apic_valid_ipi_mode(u32 lo_val)
> 
> 
> Maybe we could try to reach out to AMD via some kernel mailing list?
> 
>> ...
>>
>> I presume that by "hand over the xAPIC enabled" you mean disabling the
>> write to APIC_REG_SVR? That's what I did but it did not do the trick
>> unfortunately.
> 
> Yep. Andrej, did we have to adjust anything else?
> 
> It's been a while that we've been working on that issue, and I don't
> have the exact details in mind.
> 
> However, Andrej wanted to pick up the topic again soon.
> 
> Thanks,
> 
>    Ralf
> 

 From what I've gathered, Jailhouse works as expected. The inmates may 
(or may not) require the APIC, so they also are responsible for handling 
possible hardware bugs.

For this specific case the Linux kernel (inmate) needs a workaround 
during APIC initialization. However it already has a ancient (pre-git) 
quirk[1] to delegate interrupts to 8259A in case LVTs are not masked 
after reset. Nowadays this code seems strange, as the masked state is 
required per APIC specification (for Intel and AMD).

Jan, do you know more about this?

Interestingly enough this quirk is also the actual trigger of the 
aforementioned "invalid LVT delivery mode" error in Jailhouse.

For now I've appended a patch with a simple workaround for the kernel.
Hope that helps.

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/x86/kernel/apic/apic.c?h=v5.4.24#n1716

Thanks,
Andrej Utz

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bef2d9ff-b6b4-8927-e36a-e9ec41d0ed1a%40st.othr.de.

--------------48CDE42D320A0720D5F2B65C
Content-Type: text/x-patch; charset="UTF-8"; name="amd-apic-lvt-bug.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="amd-apic-lvt-bug.patch"

diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 0428ad289899..836436ce05ba 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1699,6 +1699,14 @@ static void setup_local_APIC(void)
 	value |= SPURIOUS_APIC_VECTOR;
 	apic_write(APIC_SPIV, value);
 
+	// HACK: some CPUs (e.g. the AMD Ryzen family) fail to reset LVT_LINT
+	// registers according to specification, so we help them do that
+	if (((value = apic_read(APIC_LVT0)) & APIC_LVT_MASKED) == 0)
+		apic_write(APIC_LVT0, value | APIC_LVT_MASKED);
+
+	if (((value = apic_read(APIC_LVT1)) & APIC_LVT_MASKED) == 0)
+		apic_write(APIC_LVT1, value | APIC_LVT_MASKED);
+
 	perf_events_lapic_init();
 
 	/*

--------------48CDE42D320A0720D5F2B65C--
