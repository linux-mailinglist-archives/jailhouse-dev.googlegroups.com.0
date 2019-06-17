Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKG7TXUAKGQEYWTPCGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DF447FF4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 12:47:04 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id n8sf4504222wrx.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 03:47:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560768424; cv=pass;
        d=google.com; s=arc-20160816;
        b=UqXzlT0HaKlqqBqugA5Bgu2EZYwd8VziEovOsl475iDhxQ0GhCXfa8SHuiMiBYwOWy
         Q8L1mzPGREKZFtu8RCOyE//3o6Mwo++sLu6pheGCX2H52BMWe02APMjh3ACmDadoDNWw
         26IM2rMo3pJHpgKoPl54r096ImokqgTUUg0m45dGcmYPhxm/5+7Q18irwgwLdO9SJPTT
         xkB6viTz8kf6wK3AFNLe7ngVNVVEehoocA1Kdav1ND+gWxaFwhbcSD8mpkDURqi7y/n8
         v5gbFu7FdydIcf5jkPuKg3h6JLQWf5uZT6T0b/2EHArw1zrR6QI5EBzPxJapsxPOshWM
         b9Xw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=aVIzelowz1qDE/IVDNcRFtJMXMKNTTxJaIzYT6tVXZs=;
        b=t7D2YtYyhB5TIFSvTSwcEWvFFjJZc0uXEHY+E2V58TOl4E5zX1vRYJOOugvSEk2fWD
         /N20lsCTL8zcVClhS8X8x1Pm9CX9rYcPkEEgQprlKUJQGKIcOiLSeiO/PKyAjWKl4LRv
         j/TZzUuUD9kZYw/z+OgiG4XUcxzt3IKi+kNn+IMsQpMP07oqu7w1f06z0XcCEhQIUkpH
         rSd3p2bmpHEBMfuRpFTGTQIRwftOnqa5oeEp5W2K1/eHqbRqTZm7jIAt+GWsyCSB2DX8
         cqrTAGJIrd/rS8Md8L0gzmiLoPVY3LbE8KvDXdWAabxKWV6hJLKiV0tuuGoZkFEIWgs8
         6y2Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aVIzelowz1qDE/IVDNcRFtJMXMKNTTxJaIzYT6tVXZs=;
        b=XnDZspzRmApjG933pAO0hV5bsGNfaIWqMUasUQyvDTSLOg+gEM25meGgZIMV7hN/4e
         u1pvrKVsRmRGipfDbfaJ34j77BAeW4t6w1H8d0lc10/PT8E0pfDTBtZkF1DCfaTTympm
         JLyaMV21kUlTCl8wOTH7pqLimrd7zinO2zAJnUbY3fxPePZAJHyT/f8ca1eQoOHOBIuB
         5m0uLsToR0LSLjXN4so0FZUDOj2stwAk1hHdwsKdax0WmxefHDNpGGWU58eo23f996XT
         3EdyhaQcUj5g3/h0Ii3ffjRNCp4fx8geFe5SfQ6CN+YJLNBlhPWArDUca5CWZ0LZm0aW
         Yx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=aVIzelowz1qDE/IVDNcRFtJMXMKNTTxJaIzYT6tVXZs=;
        b=r+EjLHdAnNST/q9saCtNGjwe4D4M2L+BH6hO/ggh7k8Zf624WJMO3Amq9cQVrkCgnc
         uv7JzsgEDdp8MUw/R+0rZbM0OusPKXfUFZHv+FtgPuGCSyHy/SvyX8L9YrcN9+MztEMB
         HZ5iHjm/culaSov95F+AjeaO18+uGUPwlDdIcAOULREfNlkb4jcDpB0rjKreUk7yXgdm
         yANCrKKZoqPXTohwEQrBJh9iVGBTD7R+pLQ62Gpsr9xarscGfq4EUSJm7VBRwyg+h0ka
         5hzfbHsW9FcW2DUDCj5fvFFaItlStUVTvmctvkBaIhUtoph2RTi8WnrYLGOhkqI9U95e
         Tl6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUvBo7WleGf++Yo7ukdz2n6xuJvIqFjNGR0F6Wzlbp9D7EZSP0m
	u6vijSsLUPhg3GvbRFXEaEo=
X-Google-Smtp-Source: APXvYqzTwYcxX0nfsKoh0a1B4RuYf4TEPOiK0Ii5QhzHBcWyegpufiSjZ8gl9K0YW3hQezqS1mOx8g==
X-Received: by 2002:a5d:528b:: with SMTP id c11mr11003656wrv.25.1560768424683;
        Mon, 17 Jun 2019 03:47:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a396:: with SMTP id l22ls2823980wrb.2.gmail; Mon, 17 Jun
 2019 03:47:04 -0700 (PDT)
X-Received: by 2002:adf:f3c7:: with SMTP id g7mr74943787wrp.133.1560768423988;
        Mon, 17 Jun 2019 03:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560768423; cv=none;
        d=google.com; s=arc-20160816;
        b=SqOQ5l9bCBMrqMfp5NXG7bGeZO/df8WWiUK32uToxPIecNMX4UKJnvISQbwxWI6wcD
         jg06jXV47URZcoK6Fa5uwK4ykF+Rx6XpULjN66XI7nBRZKgzemvobHxseCy0rfiS/dX/
         IeBHmvR9NfHRzvaQf2NrPStVUokzExWd8CSVQ+FToValFgx3BRMMR3BfGZHjpyXx6Ocw
         /y9cgz1zfA+AL4AYk9yF1+16Edmfcb/6CFf1z5lFMB4jPpjHCxTHuMGk6aFsSba+qWeZ
         arDtzZHaH8XNOatKGF7RZ8bbuINI3wuTJ+pUGCCuVU/+vkRAwrXesGmOzIj5DlMEW+AZ
         WW2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=9b2fYw9uI1jBpAlXaZBWpWk+RSaVQ+SIB9cCpv3MHYo=;
        b=DKRhry1kwR9IcFii4V9u59EIJm6G+LiztCd/Vw8hiE2srGM8Kg7fZ2JDU0p8t3ZsEO
         2skZRoOBrRR9Bj9mNzggfQVKarAHsn69PbCcmdp3urlfm/7DioUgwcBspCTGTcFp2V7P
         4G1i+SuSlfIiHYrveY87tj9ENoZi/m5mosnSmfO/OPCtlfb51EWIgRddOdFFOjIbPFtM
         GYN8EiyRHjz0/Gg5TwoIM3akCYGJ22EDLsRftlohnlTvIzHcLzHDTKQXryVsQBuJeZKH
         ZSZs1MgnyG0fTAmArecGJ2ZXqRxpkuWVQp6fkvPZ+XtfnkXHLei4C3906nWtwf/PjDj9
         rtLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id u18si402381wrn.5.2019.06.17.03.47.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 03:47:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x5HAl3N4023349
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2019 12:47:03 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x5HAl3sD029443;
	Mon, 17 Jun 2019 12:47:03 +0200
Subject: Re: Finalizing 0.11
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <9a1a19fe-57c5-a5d2-f5a3-547e07bbcf8b@siemens.com>
 <e7496701-fcd6-8c8b-ee43-84245c782943@oth-regensburg.de>
 <dd35885b-522f-3291-0c53-297e2d2d980d@siemens.com>
 <464227aa-f75a-9823-772c-de19242e8576@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <159a6d4d-cde4-cd0d-48cb-20be69fca730@siemens.com>
Date: Mon, 17 Jun 2019 12:47:02 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <464227aa-f75a-9823-772c-de19242e8576@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
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

On 17.06.19 12:18, Ralf Ramsauer wrote:
> 
> 
> On 6/17/19 12:15 PM, Jan Kiszka wrote:
>> On 17.06.19 12:11, Ralf Ramsauer wrote:
>>> Hi Jan,
>>>
>>> On 6/17/19 9:49 AM, Jan Kiszka wrote:
>>>> Hi all,
>>>>
>>>> by the end of this week, I'd like to tag a new release. If you have
>>>> anything pending that should be included, make sure to post it soon. My
>>>> integration queue is empty, so also let me know if I missed something.
>>>
>>> Andrej still has two patches in his queue, but they're not necessarily
>>> required for v0.11.
>>>
>>> There's still the MSR bitmap issue on AMD64. Valentine didn't respond
>>> yet, I'll have a look at that soon, it's an open issue that should be
>>> fixed.
>>
>> Let me look into that.
> 
> Ok. (Maybe that could also be the issue why apic-demo shows implausible
> timings on amd64)
> 

Followed up on that thread. Should be quickly resolvable.

>>
>>>
>>> Other than that, I'm in the meanwhile pretty sure that there's something
>>> odd with VT-d, but I can't yet tell what it is exactly.
>>
>> Do you need me to write an instrumentation patch?
> 
> Maybe. Let me try some other things I wanted to test last week.
> Otherwise I'll return to you.
> 

FWIW, please try this nevertheless:

diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index 1cae0dcb..110184fa 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -567,6 +567,7 @@ static void vtd_update_irte(unsigned int index, union vtd_irte content)
 	void *reg_base = dmar_reg_base;
 	unsigned int n;
 
+printk("%s: index %d, present %d, content %016llx %016llx\n", __func__, index, content.field.p, content.raw[0], content.raw[1]);
 	if (content.field.p) {
 		/*
 		 * Write upper half first to preserve non-presence.
@@ -824,6 +825,7 @@ int iommu_map_interrupt(struct cell *cell, u16 device_id, unsigned int vector,
 	union vtd_irte irte;
 	int base_index;
 
+printk("%s: device %04x, vector %d, irq_msg %016llx\n", __func__, device_id, vector, *(u64 *)&irq_msg);
 	base_index = vtd_find_int_remap_region(device_id);
 	if (base_index < 0)
 		return base_index;

Should list the IRTE entries that are written or invalidated. When
matching their number and device ID against the fault later on, we may
see clearer. If not, we may need to go up further in the call chain, to
the callers of iommu_map_interrupt.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/159a6d4d-cde4-cd0d-48cb-20be69fca730%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
