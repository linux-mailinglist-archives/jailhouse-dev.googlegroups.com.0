Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBOHC46KQMGQEDZBK4KI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id BBADF55BB73
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 20:04:41 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id o7-20020a056512230700b004810a865709sf2704503lfu.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 11:04:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656353081; cv=pass;
        d=google.com; s=arc-20160816;
        b=dddaroJ/J3cQXq9I7WrByTQn+lvScowC+hjepJAEoMQGw0Jy081cjO9SsBFuh1Ugur
         ULqtG8iGURAXYCMtaq+BZ3aX6I89u4QvZ5H6dJgM08Q2H8hI3XUsvEVbxB9q/s23hipV
         JpHIUwDgta3mwr9/RaHLTIfwCAmpJq/btntBw2KT5cGWJ4jpTdti+BOBzuepOkKkVQL2
         8n76Euonw33shTSSYAsTCmm0jhqHNtT0YFtiLT3LY+Tr+NMWY3gsf64+WxqV2FHkDcXB
         FCAoDIsioOHmJZKeCBmA8jDcoMJa6zB7rV9kx6ucSnIvyPCJ8WIjluz8i1TRZhe0+zvf
         OF7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=a0GdSoTesGG9thfbAfKhRhC/buzxSiGUUKQTJTz3cvM=;
        b=eWf7FXMfzikU5y4CotdZeIxRVxu5YaenJvNfTvKtROiaEY2ELs4PJPfL/dOsX46A8p
         wwPaGxIRXIvkWpl1v4eW6Jr47UMInj83SntjlHwqqSsDzAQdAYBrn9f93dr8ljdjP16g
         ak9PrzZkNBU7hr3zGsWg0FA26uZ98uu+yXUgWa6XB8vjjKxXVJrDQ9K3OanGuoJv2eI8
         uMW+ZJIV77xdb17eP+4qEDoNSooTLHKv6PKsPAfV+rRefD9q8LQ6nomKTlqz2hAZXa54
         OaO1uwPAtKAKlnJxgQlcicDuYhrdtZiWePdEo8aObATr9H58L8sTgFuHGbkSi80XL0v1
         v70g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=U5uJt4sJ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a0GdSoTesGG9thfbAfKhRhC/buzxSiGUUKQTJTz3cvM=;
        b=pPRBUVfWBhJkVCH3VT039uey6vpwcf8Zx6VtjNYkrzgCCjiH7ezyglFZcW4FCeLRR9
         WXHBipqZ7Qh6M79uELqCvB5Ob0xZCJZteFhghD61Ivx9nAXSQslUtFFl6GgsEh5YWQcb
         j/77Tvwhk2SVq0Gtu/B0d3iTzCRkdPIPerll7EHUfOpXh+4ZAD+34sEC5uunmAmLQgYu
         C+ZsSBGUNp0POo0EQpCXzYnIfJ0g0NhIhN3TFl9aZbJYhaytqMY9GtHykPZJK999s5jv
         z+BcT4eZR7JATRA/K1wHDyX6g8vL0S2V1hZuhJ4k2rE4W+H9CoJLvpsDPP/yqnQDRiRk
         h9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=a0GdSoTesGG9thfbAfKhRhC/buzxSiGUUKQTJTz3cvM=;
        b=R+uYI1+9wU2MRxmAoFrHoLggZAmdAjD0U42F/x6VHWghHMyuAr4MfAlBS3EN5fhyQK
         5woj8kaDmkceSz9j3x435K1wEFR0cq4J2GU/DLhdu8OVpBfubGvVmMmQccGcr3s+Qa1x
         MI6HwaYMx9wHtemqxprV1gvOE89YJaBqPOTE7mDSiw/0t7WU2Be38eAXX2mzLrb86w+o
         i2AmHF4oX7zqdDsWI7zGAKVuqfPo0ihXGIdTC9AQx4N+f+Gq1RDDf5Wjtu++c/EPoC9S
         zc7NI2efwYYsiteCR0slgyk+RmkB/Rj1Dmd1yf/qP0HV6NavQS85PTEwh4KPYyjgVweO
         IfDw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9X5djXfnZKCnR6FVcNQHGbg7cFQPpGbj3qlDf9u+ieRa6akqv6
	9dLVSgyA/F+HQFB261ERFAU=
X-Google-Smtp-Source: AGRyM1smG6r2hPOK27rknJaTjKrxLvwkC4WDbd4EbK1bjcgvnIWdK1k0X6Hfo8zb3LdYxseNFZw/Fw==
X-Received: by 2002:a2e:1453:0:b0:25a:725a:db92 with SMTP id 19-20020a2e1453000000b0025a725adb92mr7651316lju.483.1656353081277;
        Mon, 27 Jun 2022 11:04:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3f16:b0:449:f5bf:6f6a with SMTP id
 y22-20020a0565123f1600b00449f5bf6f6als563069lfa.2.gmail; Mon, 27 Jun 2022
 11:04:39 -0700 (PDT)
X-Received: by 2002:ac2:58c4:0:b0:47f:a019:a024 with SMTP id u4-20020ac258c4000000b0047fa019a024mr9425487lfo.636.1656353079364;
        Mon, 27 Jun 2022 11:04:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656353079; cv=none;
        d=google.com; s=arc-20160816;
        b=cRtU+mwkxIddymgThU1waOD2P8jhx4ZQ9kXe8HX0x9VZ+QLpM5kdIL7htqDEYyKQeH
         ff0vom1JHVHenLP7P9D5L6TQod+xMfLzthBQdjUeq9md+qwQSSi9TLkWs4VrrVyWRBdt
         ILbtlvR2WwAUqAfmsxL9peufO6hu7uJIM7B+1Vf8JmED+bN9/bAhhnHsST9sjGoV+vh7
         SSNvBRGWavML8mQnW+oZHoeTqCSYjUQz2Ep99h8uFtsDdrEwZHQ8k7947W7VHpC1TtEn
         BMDin+bKBb7+gxzaIcxYWt+DyHwBbfHHc4fdTmhFGqta9iZv6ACNZCZKEna44TdDNy8K
         A1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mCQFe1ao4lnDf82TFxzw5eE92wVPERpe5EghZgJzVOk=;
        b=NtapqyE6bmEvTIh4N+V9F+s1L01m0/6Nen0hvnCVA3DBiNICRVVE05CYNSfmP0Asw0
         +xukVoAE9GUqsr8m9QFyJ97BgkcdCIi02jU6Ms8P6mxz8OwDx4M8BeHo71ZvYUPqR4eB
         oh5E9ICRGGRxBegoSlJ4g3Hxx4a1UsWMN02Vs9OJLMkQMjOg1jYH9B6jURT4dFgPN0av
         mUafQ6upd8Sogsg4T9FfwMb5E0803rQ1o8tMVCCSswqgWWzXYaeG/npxCJtbdE+46yHi
         HgTY4IWByLFFC27u2d/LpirAAhIgSPlPwqnSfiN5o6LMUzb7umqmdciK0IJ0M4jOc+fB
         hSVg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=U5uJt4sJ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id bj25-20020a2eaa99000000b0024da01a8c6dsi384824ljb.1.2022.06.27.11.04.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 11:04:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWwbp305zzxws;
	Mon, 27 Jun 2022 20:04:38 +0200 (CEST)
Received: from [172.23.3.47] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 20:04:38 +0200
Message-ID: <d1aa2611-081c-cac5-fe9d-06000a53754c@oth-regensburg.de>
Date: Mon, 27 Jun 2022 20:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v1 34/42] configs: riscv: qemu: add system configs
Content-Language: en-US
To: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, <jailhouse-dev@googlegroups.com>
CC: Konrad Schwarz <konrad.schwarz@siemens.com>, Stefan Huber
	<stefan.huber@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
 <20220627132905.4338-35-ralf.ramsauer@oth-regensburg.de>
 <d85ed09a-9979-c40c-9b15-ba68187ab22f@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <d85ed09a-9979-c40c-9b15-ba68187ab22f@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=U5uJt4sJ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 27/06/2022 15:36, Jan Kiszka wrote:
> On 27.06.22 15:28, Ralf Ramsauer wrote:
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>   configs/riscv/qemu-riscv64.c | 218 +++++++++++++++++++++++++++++++++--
>>   include/jailhouse/console.h  |   1 +
>>   2 files changed, 211 insertions(+), 8 deletions(-)
>>
> 
> ...
> 
>> diff --git a/include/jailhouse/console.h b/include/jailhouse/console.h
>> index 34dd7209..0b6c558b 100644
>> --- a/include/jailhouse/console.h
>> +++ b/include/jailhouse/console.h
>> @@ -50,6 +50,7 @@
>>   #define JAILHOUSE_CON_TYPE_SCIFA	0x0007
>>   #define JAILHOUSE_CON_TYPE_IMX		0x0008
>>   #define JAILHOUSE_CON_TYPE_IMX_LPUART	0x0009
>> +#define JAILHOUSE_CON_TYPE_RISCV_SBI	0x000a
>>   
>>   /* Flags: bit 0 is used to select PIO (cleared) or MMIO (set) access */
>>   #define JAILHOUSE_CON_ACCESS_PIO	0x0000
> 
> This is likely needed earlier in order to allow building things.

Hmm, I checked that every commit compiles. So in fact there's no user of 
JAILHOUSE_CON_TYPE_RISCV_SBI. This is still missing in dbg-write.c. Will 
fix it.

Thanks
   Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d1aa2611-081c-cac5-fe9d-06000a53754c%40oth-regensburg.de.
