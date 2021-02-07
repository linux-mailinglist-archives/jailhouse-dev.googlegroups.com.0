Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBU6K76AAMGQEMVCNBWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id CE68031247B
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Feb 2021 14:04:20 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id g6sf6402829lfu.13
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Feb 2021 05:04:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612703060; cv=pass;
        d=google.com; s=arc-20160816;
        b=cPTDMdbuOTgGcptCd/C79H8gcPQJXMgPoiwr3QH+T1JPohOCX3sJydbAkvlrgQ6P+k
         6dgFF3g67uX1osRwNrwreev6xiGnD3q3P8c9+czNW6aD8i3Ety1wLpxUCB/eIHXut0Cr
         XrO1f5lNxKDpjxebL0KRd+qDGdzarzyBA6oiN8gjBHP9mr19I0u6rDJ3bzgpBgQ8J1Wn
         CN2Z9WVhh9c0HID/spfcyUHKWG35pBCBV3+dEi3QwcKDrdNje9LRgKdNqfckyNex6Ny4
         O9Ueppz+4Tc3qlRt8IG7A+e7FtrPQaG7mjXKHrW4GzJpLMZbvgnyJEPbn2yaBxoUDZpl
         dGHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=brI1qhn3KfKZAkXMuzFnriM06gi5uSeQ3+K65lSlrlQ=;
        b=TCdBhJJTAqc9JFHEfmouVNa/IYwt1fnDN/rZo4/ZcfL79xXMtyl/GqIx8LdRQDaiX/
         EILFnuWi/SbZrX5vOhJYW3MB8/KhbL17MDjEpK/skvS/yN5NHve4jIVhGzahs7ELHR4r
         awQ/nBe+YkL6FAfVeXSOw09DmSryqbTafolLq4tSfpQuwkykiUXRRKE0C1mKdl52x1Go
         CbMLdXAdHLVyfsisLkCcQwOjsyE/YBedGFjo+4x53VWCoNdMjZCihrHnzSkBxHqIrAmO
         zht82gEeMIo3f8cx/kbO/WFt2++w/FU5zEGD5VhB01ySbkQOSrGXkt9AKlGrlT5oCg4P
         cTpw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=eIz+H13N;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=brI1qhn3KfKZAkXMuzFnriM06gi5uSeQ3+K65lSlrlQ=;
        b=k7mW27nU/1WSfyLg4UOjaxLOggO2AU1FRne8g5i1yfKxLbdkwfUd1ZUOwDIp7iGuct
         Bb0imRqa7t+ngyKJ32xExU11FV60R5LirkOONyUQaKU70GvryCuqnGtBsdlcxkZiTXBT
         8JnkaLXMvi7TJt2vcZypMITK/FDVey7KEOiPjeqXpE1HgQc6u0Wf9FJ804jB7mqYrl5Y
         +EBGaSvXLgedsc9kdjOudpf9B2P5/WwDvik13s7hkBskvsv3mfMjHVw9O8dJ7T8KDUUE
         hX+IxtdNnbWEy85wxUcbWmbeiHldhQDZpw5pGGnv4B2O+MyA3144pjfrmCbI+8FHwWgz
         dSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=brI1qhn3KfKZAkXMuzFnriM06gi5uSeQ3+K65lSlrlQ=;
        b=qo7xXrnJ81DYuTNCZt8Vh8bSpCh2hnlBr8pxKcNtqo/wE72gAVOsf6iyTnG51P9hJe
         13uV2spokHZaQcvhwKoJXjKrQFKAyz0O0X44sRGO67ilgFwYwJx1uxPhU3WWjwm/ZVcS
         jQALkcIh2Rk+vvHS0UreFAG61dvsbdoSF4w8arECVNQYLKN3YgGHspa9sxYwaaCcqJro
         Zwnudw3hnLIqYbEfsaDKGCldrl3g3OwTjmpbP3teQH1qOgiNbEJYUluqWNta7koZPd1W
         e9bw8geP0CpRPB3696Rjsf/MNdX3BvYxJ4fDvGse4J57vP+v8FCUAZOTNAd5VfxUpjMR
         uKQg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531PtPPn8kgVi2f1mhZJm7gQSH3FiPHIggMalJr8Dno1FD+0dY+c
	C2Wsil+WPfIeonn0EJhvjcw=
X-Google-Smtp-Source: ABdhPJyvRFHvTKRZfCmiqF9Oywcao3xPIrfsyH50Iq1EqO5zb03ohTVVIt5EM681Ckh4Y1nqECrMZg==
X-Received: by 2002:a05:6512:2f2:: with SMTP id m18mr1457998lfq.89.1612703060338;
        Sun, 07 Feb 2021 05:04:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4adc:: with SMTP id m28ls2231451lfp.0.gmail; Sun, 07 Feb
 2021 05:04:19 -0800 (PST)
X-Received: by 2002:a05:6512:31d3:: with SMTP id j19mr7710017lfe.495.1612703059256;
        Sun, 07 Feb 2021 05:04:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612703059; cv=none;
        d=google.com; s=arc-20160816;
        b=g/uzlGulGULpyXuN597jnc7gGLA1tpIIVjn3ekZbXBFbDagexbLWDIRLw/RilHpnTk
         frUsi/bCU7UOYpp4M4FgYrcnlN8jGQTGYtkdPCp6Nv5/7TIHgb6V770o8TuHe8/ZJEq9
         6LKkYyU70qzLGbYvQ3sZ85o2NN5BOAT1bJ5DB+D7zt6kOfAa5sihPXgTtvbyjN4juQVo
         8SuosX/uRJKI6fW9qDcZsbqBzaSZ3zuQRsQ8aoYpEtVDybD4WB7pRLDBih0MKPjyupD9
         uGDwCAzV28x2pmyIUF1wILv52pNGZo65+fPzkG4NCgvsBjglnHet/BBoeDGmQPLSg1XO
         RI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=1tVno13f814OF9F99xFht6M0yso+aFqe7zM7lGtiBPY=;
        b=x2e45bhc81AqUzUEY5DZquYGkIZOXTUNLJqrJQR1xW9XqL/UVGcVOuBRSaKE1YQ92k
         BpgN4w+jRQ5ph1eYWoNCnoCg2PjhP2/llw9EqYLkU5Y4bbPxUFXMi6bNz1VkBp3H8FCd
         5xk27QioJXTZL3SNyF1dNkxBO7yrr0cxJQJNbdcUBCm+DRAC9r9Yer2+k0/ZhV0FMsSP
         sxJeiuaiAloOXJMOg57cDK9cXRmmdp4KilEIbPVBvaGVApMgjTLOcbi8+XB340E5JbHT
         I5kirNjVVTZNECELEkzoCQSa5yMoM85/ZNzYUSaxw8EQULblsjgzvKyL4jtLRMBC/j0L
         H5DA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=eIz+H13N;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id s5si745634ljg.7.2021.02.07.05.04.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 05:04:19 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4DYTrL4cWHzylg;
	Sun,  7 Feb 2021 14:04:18 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.872
X-Spam-Level: 
X-Spam-Status: No, score=-2.872 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_HAS_URL_HTTP=0.001, LRZ_MSGID_HL8_3HL4_HL12=0.001,
	LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001, LRZ_URL_PLAIN_SINGLE=0.001,
	NICE_REPLY_A=-0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id fpl9MLDUyufl; Sun,  7 Feb 2021 14:04:18 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4DYTrL08bNzyVF;
	Sun,  7 Feb 2021 14:04:17 +0100 (CET)
Subject: Re: [PATCH v1 06/23] hypervisor: protect inclusion of control.h
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
 <20210125120044.56794-7-andrea.bastoni@tum.de>
 <30e9107a-8b99-c9c8-ae90-df39157a66e2@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <f6917eee-2eb8-3846-bd85-c98303d5900c@tum.de>
Date: Sun, 7 Feb 2021 14:04:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <30e9107a-8b99-c9c8-ae90-df39157a66e2@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=eIz+H13N;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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



On 07/02/2021 11:18, Jan Kiszka wrote:
> On 25.01.21 13:00, Andrea Bastoni wrote:
>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>> ---
>>  hypervisor/include/jailhouse/control.h | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
>> index 76eb0428..2ac7e2dd 100644
>> --- a/hypervisor/include/jailhouse/control.h
>> +++ b/hypervisor/include/jailhouse/control.h
>> @@ -9,6 +9,8 @@
>>   * This work is licensed under the terms of the GNU GPL, version 2.  See
>>   * the COPYING file in the top-level directory.
>>   */
>> +#ifndef _JAILHOUSE_CONTROL_H
>> +#define _JAILHOUSE_CONTROL_H
>>  
>>  #include <jailhouse/bitops.h>
>>  #include <jailhouse/percpu.h>
>> @@ -298,3 +300,5 @@ void __attribute__((noreturn)) arch_panic_stop(void);
>>  void arch_panic_park(void);
>>  
>>  /** @} */
>> +
>> +#endif
>>
> 
> I think we could also consider #pragma once, with the same rationals as
> in [1].

Yes, and no. It depends if you are aiming to some e.g., MISRA-compliancy and/or
if you don't have to document the implementation-defined behavior of pragma.

> 
> Jan
> 
> [1]
> https://groups.google.com/d/msgid/efibootguard-dev/7c654734-df14-4b7c-e5a7-bf68f224c1be%40siemens.com
> 

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f6917eee-2eb8-3846-bd85-c98303d5900c%40tum.de.
