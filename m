Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB2V5QTUAKGQEYUEO6SY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x637.google.com (mail-pl1-x637.google.com [IPv6:2607:f8b0:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB7B42B3F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 17:49:00 +0200 (CEST)
Received: by mail-pl1-x637.google.com with SMTP id i33sf10013379pld.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 08:49:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560354539; cv=pass;
        d=google.com; s=arc-20160816;
        b=Zo2NdOxOWROI2MXS9NSFBATdI5jO/QTTdb/Pf/p/KYOrBUx1rlO3CakWekW7+FoXFD
         NWERg2arie3c28qH86FkLYOC6gtWzNbNQfeqoJREQ/VY2/nwyfvOlsFMq6zQfIFIuMOj
         UXgCR2u+c5h56ekoCir+et1pn9hye8DUN6vC+38HJEMzhfLIQAie6TXpTP28cSJ1/5nB
         tKj9zpq168Joq314yMQ4OGZD1r3bwOf0B7dO4LnUYLM2jgCEoK5vPMnhkPVJ+X/wlbF7
         y7nwzBVAXwYmSugYtaVi6xUqZpXL9HtPR3ir3FbyvkwkxnLh20Yrmu3daWpja3AIowI4
         XBoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=Wg340YSTddsDb/tu1n//UTo/0OMmmxSe5eujDEpdS/k=;
        b=O3ILF0w1fEcgpgSuNO2kSeIgaY3I51es3bemJ1gubQ0sxV2MGVzXT/faYcnWNJIblE
         yFpJSoCpNKpbxmTVsCgqR5LVpmzwlwlHLEVpb0knDCL7Dn3ghGVMGmDWXwUKyqRuttf6
         hdU3x4JswPDt8ndZeD8uoYPFFPyWWrKSIBqhjcx1hRM3sSZHXLtdZ91np2xa/Lo71OgK
         0YJB5og1XME5ZpYt2kaJDMyyA+LlJLhqby4KWnxfq0UzwXoFAMltGKuYwDMEQEBDtNuj
         5BTnn1O88ybwJT/NaB7v/rvT1Ii1sBNdwOYhgsPUz/Z3sSFvGbZp0Z3LiV+1+FVSKkjo
         43RQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Zrj7r2vd;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=Wg340YSTddsDb/tu1n//UTo/0OMmmxSe5eujDEpdS/k=;
        b=fMX5QGoFk+86RoAX34Ei/AXi2e11S4SuMVaHbqgOkavht/DKuY3zAVPE9N7WhDrXA/
         PFwZ05L6GuTKYAevP+TmzcvKDuanY07Dw1pDak38WaJHrAXFrzrQQKwMQqhOmAdULy/s
         4UGAIYkLuLMwsj3K9h7QluE7H027sGc4GYpoICr0g7y9zc7c2bpNoTqiH/M8yGBh0576
         SjUQMx4gJIsgN1yDRl54moDReeMfV+8whYj/pTmTbXW5pfsA9vKATIti+MUCRc37+N7H
         WzAmJm6waerLvX8lOl2Lt1JXjD/VE8N7DLkwxm085Ci0UAuiidAMqgofD5hwdJQklbh7
         lrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Wg340YSTddsDb/tu1n//UTo/0OMmmxSe5eujDEpdS/k=;
        b=qXVebw/kF3RtLOmFTyJflo2ItKxq/4G2uJp3bt0RhqaKlIvuHdV91SKqasp2+8HGIB
         IkXaxMYPhSi04tAJw80xU0W9Dp8mUAt/WzpENaS1w5kDj3lpKNtH8Mt5wT4MkUGmucOc
         It5dXi/GDYyHwddbwdy/FrgKbWa9FQNGTyYGkPEynVmO+Gs84Hc9oiqnh9QBnktp1mki
         sahFgRf7wRFJu5geuyBBiW8pIdaoDxltlcjaR4WlsitHsw9eQqN3AwXDyJYYGxmnvHMS
         9slJHhuaR/E8y7HQcKiGmlF+DLnbUKiV8tFoAjJs21FT8PG32DOATPYQi2d4IfjP+yAm
         4dcg==
X-Gm-Message-State: APjAAAUlBf4qs7eyr2HGzF2boRwM3YiZ0NiMPTHds8ibnj0TRrpk62X7
	jQvV6se5p+VwuqE5sdGbfDM=
X-Google-Smtp-Source: APXvYqy1NjO2Ju5eXIT6dGjsrTTtpMcJnNKEQ2F+VjNpmypFboMRWph+z4l4hp0Rckx5qmPQkejuyg==
X-Received: by 2002:a17:90a:a09:: with SMTP id o9mr21770733pjo.95.1560354539089;
        Wed, 12 Jun 2019 08:48:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:1021:: with SMTP id b30ls716495pla.1.gmail; Wed, 12
 Jun 2019 08:48:58 -0700 (PDT)
X-Received: by 2002:a17:902:ba82:: with SMTP id k2mr74798663pls.323.1560354538538;
        Wed, 12 Jun 2019 08:48:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560354538; cv=none;
        d=google.com; s=arc-20160816;
        b=nkuuHLAfbpdhQLQWSvbUVoYJp/cnzMlfgCMCLfXYcIJ6tIz+T6Si+7XFe6iqLN7DVf
         nHZQOqDHccTQdrP5SFJWIcB55XtL29KrGii9uBKguaXG/7O0lYJ+RWxNggqhOIPvEoY1
         lie1YM6srF571XbVQl2kApSl/0SZ8Xt0TtghYZiXIIMEnISRudGB287wIS56RaStlHIw
         13raygmJOGlihcCbV4VThKzV03ygpmCSyDMC8+tU/fRb9YntOPeWj5gwBI2Td967w2DC
         Jp+r4i606o3tXOW/egDSX2yyULVYPMddb9urwYDSBKv87uZ+fqF2cLDQi+XU/4ADyNDh
         G5iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=y9hJ4N98SWxBbyCdb5R7xS03s1aKW8nYANWu/2rqn70=;
        b=RX+M7P8vjIbJ2QyFViBaUqFKVRGrllyE+0uhOnBhCkRO7H3gjrofScS8hQC2ME02Tm
         QoWCgPLGOtx8UB4f4t6V0YIhlhmHtWQq6FI4bHOy9Z9m0JWnC2L9ejQnTwRPFKZOOwW/
         HTWUQD1YvWUBgS/DJelqGrUzo6qdagypmsI+5mw2YfGVqBU1LPUmh4oh9fFMyJxsbUVP
         VKMnGm7cyAEzbs09wulH45QATxylFCbjCsbP3EJglRrbl8I3CDZcfNUhi+zC2rs5wIeT
         ZEB+ujiwhiQQkvbzX2KJECP/yLvdI3w6DRs+E4t4VIeOffGxbSV3w4UmAEwXS8A31A26
         Cz2Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Zrj7r2vd;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id b4si4574pjo.1.2019.06.12.08.48.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 08:48:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5CFmvdc008587;
	Wed, 12 Jun 2019 10:48:57 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5CFmvUx073945
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Jun 2019 10:48:57 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 12
 Jun 2019 10:48:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 12 Jun 2019 10:48:57 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5CFmsEW070236;
	Wed, 12 Jun 2019 10:48:55 -0500
Subject: Re: [PATCH 4/5] inmates: uart-8250: Add MDR quirk for enabling UART
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>,
        <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
        <lokeshvutla@ti.com>
References: <20190523211623.9718-1-nikhil.nd@ti.com>
 <20190523211623.9718-5-nikhil.nd@ti.com>
 <ec13c47e-9ff0-8fe2-f895-27213a5b7b6a@oth-regensburg.de>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <8cb3e54a-a0f6-38c3-626d-0dbece8b2025@ti.com>
Date: Wed, 12 Jun 2019 21:18:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ec13c47e-9ff0-8fe2-f895-27213a5b7b6a@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Zrj7r2vd;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <a0132237@ti.com>
Reply-To: Nikhil Devshatwar <a0132237@ti.com>
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

On 24/05/19 4:15 AM, Ralf Ramsauer wrote:
> Hi Lokesh,
> 
> On 5/23/19 11:16 PM, 'Nikhil Devshatwar' via Jailhouse wrote:
>> UART is disabled by default on TI platforms and must be enabled
>> on some platforms via the MDR register.
>> Do this as part of uart_init for 8250 driver
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>> ---
>>   inmates/lib/uart-8250.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/inmates/lib/uart-8250.c b/inmates/lib/uart-8250.c
>> index fb7940d2..42b0979c 100644
>> --- a/inmates/lib/uart-8250.c
>> +++ b/inmates/lib/uart-8250.c
>> @@ -49,6 +49,7 @@
>>   #define  UART_LCR_DLAB		0x80
>>   #define UART_LSR		0x5
>>   #define  UART_LSR_THRE		0x20
>> +#define  UART_MDR1		0x8
>>   
>>   static void reg_out_mmio32(struct uart_chip *chip, unsigned int reg, u32 value)
>>   {
>> @@ -67,6 +68,9 @@ static void uart_8250_init(struct uart_chip *chip)
>>   		chip->reg_out(chip, UART_DLL, chip->divider);
>>   		chip->reg_out(chip, UART_DLM, 0);
>>   		chip->reg_out(chip, UART_LCR, UART_LCR_8N1);
>> +#ifdef CONFIG_TI_16550_MDR_QUIRK
>> +		chip->reg_out(chip, UART_MDR1, 0);
>> +#endif
> 
> I think it's better to encode this in struct uart's flags. We still have
> some bits free there.

I looked up in the source.
The flags are only for the console.
Here we need this to be written from the inmate, which doesn't know about the console flags.
Which struct uart are you referring to?

Nikhil D

> 
> It's better to not reintroduce compile time switches, it took a while to
> get rid of (most of) them.
> 
>    Ralf
> 
>>   	}
>>   }
>>   
>>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8cb3e54a-a0f6-38c3-626d-0dbece8b2025%40ti.com.
For more options, visit https://groups.google.com/d/optout.
