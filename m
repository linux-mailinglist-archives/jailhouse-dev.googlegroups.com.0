Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBXX73P5QKGQEJVS6EVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD31281089
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Oct 2020 12:24:31 +0200 (CEST)
Received: by mail-ej1-x63a.google.com with SMTP id y25sf508961ejj.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Oct 2020 03:24:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601634271; cv=pass;
        d=google.com; s=arc-20160816;
        b=o/N2R4JIuFwV1t71fDPQUJEppK91OAe1WX+JPDIsIUck6ZWl6Yk49o0LaqjHDs47L3
         XqOPqPL2LecUW/+FjGFLY6pHYFNJYwSa9KMdDaCEFL5PMZ6Gmw8yNYdFb0X0t9b4VXMM
         4x/ZDrGHDTAZzAyWg0P7OF+iureB+w5Wo8mft8cR6lXbA7JB46CDrEI9WHrmM/pUAFgf
         h6oCNqOD3cepcAnF7nWZ6ILWQQrssZGumAGw0klZMvuOUY+VGE4dHR/bwpd8OLjS8Msg
         8tCbvd3X7VBswJUp3lFETpTumF/3qoP1wKEDvx0buMKOcD7S5dfMUv0tvlBau4GyKbFq
         3QQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=Rd6xJHOGsJ3TRRaCH8I0MYiuI7kPhIoKFtGTMd/VSwg=;
        b=nljJF4Br9YKEog+AG7Bz619XIixQ9vil+IgByTGii2d+xQ2e+TgP12UYC6fVEwdBMn
         cPBUSPs4c57YUrzdF9qcHo15tirkALqaZ2QK4hjnuds+Epo0R0SPlDlwfTgS4MqjDedk
         SykNuamZC0/1lwafXEar0FivCX18LYvnrsKoW7AfhWIgD7KQhZYiSVk95wtXXHZBF54Q
         vzajaNYLSE6wABo8hPQYYkFA4S4PhFVIU+B5CA2KExSIxut8ybzNdotoXQpDPq3kbcks
         mloDfaGkeGmYHdI87NJ44Q/4A3xll/EW91f2Skt3fTwqBRDJ27CJHrZ+/Q1Yr7K5q1lf
         F2cg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=aceNmsCR;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Rd6xJHOGsJ3TRRaCH8I0MYiuI7kPhIoKFtGTMd/VSwg=;
        b=s1bbso3ereAUvIVRZvlY4HgSyjzZRbNA42ykCFBDSH6p6t1hJjFGBfjdkMwTJlscmt
         3C7iKHyoHAqTF2QYiD6/qfx8ivtYH1V2ojJH4fo9lDBIS0K0mQbBfUjTfENYLFG/TKul
         Z0uBy4YKOg0Yqxc3rxZhoUdDs1nZsRk8uucL3goK3Ya5ORYAQ5Jdzy54lZuGPJ8p5f/n
         BUCM/IWdSDvwJYVqIXKMtXlNULEDR09Mpg3gHu3y6wZpGdYmUnx383fk0iHHMT7blHMX
         VHD5NDCYvuSs8IOsYRi4f6jAhApfyys+i5NfELs6+/UpQvrK/8wkB/BoX1U6yAATWO6x
         hKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Rd6xJHOGsJ3TRRaCH8I0MYiuI7kPhIoKFtGTMd/VSwg=;
        b=tU+V+oEg3TdSpJzkolOfc8KV4pBQs4d1hHaW8SdGevztKyXA22Eoq6K2iYaw7nFSk+
         jq7Ct7NaMFssRowFgnaqRTwNdZOmQLlpD06ODcoUtENKuZSeC9lLWpKkjEtCEbIcNJ2A
         7gYqmIUrJnSHCqxiM9PfmzRggmzQ9+xYFUXkRuXC4U8cHLXwa1ZvFUEc7VUttbKByOXe
         pxKlZNoFDm015JY3AJGzgB3mgG7CC1SV/zah74m2wH3U+ccNR0bmD8SFqEc6+1hJNH1X
         Ts6x0QNYVGRM9iPgVeds/PQq264JlNAYB8x8q4ROdSWJ9c/Rxzxczd86ULYiuT7m1XvW
         P0mg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533NuirPcaPce7emh2XLum8uA6nHFKZy8wJQOffk6UBuNfM0OdO9
	/DGKoW7qUogMFvAmzqvtkB8=
X-Google-Smtp-Source: ABdhPJzDJoPukiDNx5O6tnVJr7vVoRwWR9mqrTUL0KTSFqmsGyDHNXGYfaxBp4ZN1qvL3l5ZvpdVEg==
X-Received: by 2002:a17:907:408d:: with SMTP id nt21mr1456160ejb.355.1601634270897;
        Fri, 02 Oct 2020 03:24:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:f996:: with SMTP id li22ls475669ejb.10.gmail; Fri,
 02 Oct 2020 03:24:29 -0700 (PDT)
X-Received: by 2002:a17:906:1cca:: with SMTP id i10mr474526ejh.487.1601634269756;
        Fri, 02 Oct 2020 03:24:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601634269; cv=none;
        d=google.com; s=arc-20160816;
        b=bXUzEn5YNkRRTrvHpBRvnVLhfQ/TCRXBfSmBi9H3naQBtxPrTnjdBR6scUrAVAww2b
         oDDchVqUcJJIhLmn1aMc/dB/p8vkjOIg26b4H/tYA+28olR7gK8tG5AHLQRxEvMxPck7
         8Q8OvzZ6UOjuPcYhynrBmQskLpw96u9Fy9GGf9kqx7WyU1fcTFKU5qIxIN6XKUI68Uvk
         BTf9BXARhJQca8k/xr9xy5/v8EZXbcX712mJhV36p5OZR/MdxWhqqtzEvTHb+RIPJYm4
         sfhLtA5nYZEmXrtJElBWZTtWzyfm810VS8azcwWAheeEQ5JSRrcmxKaRKvGlFMxb2GQf
         W3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject
         :dkim-signature;
        bh=pCOdO/yM1g/m/xxTRplMEq1HWuu1AkO9fsLSkqmsTOo=;
        b=ax5cSMCqlKB1yUSKFFYjRXNhILjt1vDoJ56gBYZMUGlLTHsG3RxZIFN/SdXciwnx4f
         M/AJS0Kk3AtMoNdetr6jnrNVYyYjvR1DrgERHONmhQflGrIgwJ/JNQWxvxWrJe/+1dzE
         9t0YUbYTE0lYfrby93WmqiMpW8sYd089zEEjw2IKlIq52bpx3R97t9t2fEzeMliFmKa2
         zwt6Llqh19tz+SOq9T5i8scB6Xsan7Fpd6haPbOAp9PsfhcY/AEdh9BMyIIjjZNB0D+C
         1R/g0rEXC421NeHPBfNJF3YtzImB2eXwjrFXo9DBBGcW7qsv/YqOyj5rG436fTm3NK2K
         k8VQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=aceNmsCR;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id a16si50963ejk.1.2020.10.02.03.24.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 03:24:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjgT9-1kqQrO0anz-00l3vw; Fri, 02
 Oct 2020 12:24:29 +0200
Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
From: Jan Kiszka <jan.kiszka@web.de>
To: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
 "Devshatwar, Nikhil" <nikhil.nd@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
References: <20200922064542.26274-1-alice.guo@nxp.com>
 <20200922064542.26274-5-alice.guo@nxp.com>
 <2f0d667f-68ea-eacf-7b8b-61652bc0d2ce@siemens.com>
 <DB6PR0402MB2760ADEA2D5A37133E5A1D9388360@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <27f73d85-f64c-fa29-0524-1fa360c6385a@siemens.com>
 <88609d72-f571-ad84-78ed-28fcec0198e0@siemens.com>
 <DB6PR0402MB2760EF8A41AFC17F8571BB5B88340@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <143f5a37-9cdc-d2ef-581e-7f7144b6a709@web.de>
 <AM5PR0402MB2756949C49DAC709F669D7F388350@AM5PR0402MB2756.eurprd04.prod.outlook.com>
 <59ce287e-bcc8-16f4-ead3-ff4bf8211628@web.de>
 <a6a3bf58-20dc-3704-35c7-d97f7bcf9834@web.de>
 <dc3c6437-f508-4632-46ab-6268b948b280@web.de>
Message-ID: <db19391a-ffbf-ce89-9e4e-f811e501c993@web.de>
Date: Fri, 2 Oct 2020 12:24:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <dc3c6437-f508-4632-46ab-6268b948b280@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:a69cLU5mnHbUzPZkb2hU28Z7q37UBJrFrrsAkOpskfmmkOlNiEc
 KiiujWMZBTv4oQ1mwtKqjpSFUjU6Ft0sCRrsYJMCV1YGudY2VfzT3Wmg8NSqzF77YQfkeI7
 GpyEOu87yFXZsBGNoLx4s+LjJYLejECNQ1KoPIjxEBxjET/M3H0qIop/TnJIC0g+1dlrZBN
 iQi9PpoFBAPMXcxi+wTJQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/D4r9MgywzA=:L8P7fZx2hWwA/G2uX8l+51
 BNOKuJ9CLS8M3U2cNDkyGfkwBTahsL5+uPtibRE2LOdoTTFOSbnqJ0hRX7fM1s5FO92M9iiC/
 oyqf2Mc1w9MBNeTvnV7QpiwgxecOPznt9OoXL/S+2EpUICLJMFcZndbhq5dU7B6/R7uWsfeW1
 Si5RzycJutfNtedyIPitt8bnVKsaZ8xFcJJXAWvpv37UtIXGZxMFE5VFbJaFZ5pjVoaLf7LJm
 9IMtyWxo7BuRVUjp1SRd6JGjE3WChGoPfTORhZdPe9iUSIhHfNsSBaBuLFVQQwddo229zF+Mv
 hE2NjR06gNg+LZKd5MaMjpWL2DH/WspgAdDiFZxiCxMuW8545EkWA5HTZqe8XAmxRq+/WdVTt
 h35/HvCOK8aY0hQfFTFGYgnTf2jFPIe7SWwnm5EE818hgm1oBIAe6JwqmHkVTx7q3E+hPFeOi
 gd+qYiVV1i+T4bYJrahe1janzFUaJAamYcnD4USAsJiXjk+AFwxhKrds3jZap1z/QHRizsRd2
 AroHmPlDmzYOL+1N5slFlX0D0RH/pWhhbdbjsXAckGfh3QR9Qd7MDCvXKigHpHsLElD6qpDK3
 n6Tfh1hc2Wc7y38hfKNdLktLDIPKaecF+37Z/ejq/HVimpNMFYAJR40dai5NfDPw7USuLt7No
 MrI7C3zhvadlSb7Tb0+bCh8ypUwQ09/sjCcQYfooOK4sgPgJcF5fqAj1aU1O7uoBfIySLsGSb
 BOCD3DNdSP/7nNc1oyrEM5umShic2hotzt67bzmKuYg6XvQ4k4lsCqzUUQZW1KIVIWpglS69D
 9SFiqPLY4jrNnHpf5sEvpzjThe5ZHdP0eSYN+oU0ChWO9K2kZAuMiV3ST3Ivu74NvIYlW2Rai
 tlDigGWn+9q8ncEby8qEvle9yDECOe9NkTVEh9bUmq/4qEcuH/GmNeboyzyqcZuIBXl0UizBP
 l50HNRxUH7WR/Bo8I++XfpmbHNQ5kewLU7xJjOBXFMqKAtIX/e4HCjNZw4gqdzI7r5QJRrKvf
 hGBc7IhtaOB9FutrF5jS/OSEEepH6Xnesvmsz6CtbB6tL0LGBBpx18+hvx2DUVRy2w8Y7VSjh
 dDd/lSgwetSlqxku7tlniPBVEW/5XMZ2ePgvLLBOX+G17O/JTLfOlsnOCc6UCcqTrNuBUeuxZ
 xqMM2O3Xet9i0daIcXsRWsZhn5xfcxNtS9JOFp8XinLTDSpLCS1SpEzeEI/tYfiQYRzSMk/bx
 o87qxgdO3JL5zXK1kv/E7PwcNlGAzK5dwx5ef9w==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=aceNmsCR;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 02.10.20 12:04, Jan Kiszka wrote:
> On 28.09.20 08:20, Jan Kiszka wrote:
>> On 28.09.20 07:57, Jan Kiszka wrote:
>>>>>>
>>>>>> You could try to not bypass SMMU transition in smmu driver, then the
>>>>>> system might not work well.
>>>>>
>>>>> Where is this bypass controlled? In the SMMU settings? Or is that
>>>>> platform-specific?
>>>>
>>>> S2CR_TYPE_BYPASS, smmu settings currently.
>>>
>>> Just flipping the type does not seem to be enough. Could you tell me
>>> what is needed to switch to "block what is is not permitted"?
>>
>> Looking at the kernel, these two changes are apparently needed:
>>
>> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
>> index 69374b28..ea58340d 100644
>> --- a/hypervisor/arch/arm64/smmu.c
>> +++ b/hypervisor/arch/arm64/smmu.c
>> @@ -534,7 +534,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>>
>>  	/* Enable client access, handling unmatched streams as appropriate */
>>  	reg &= ~sCR0_CLIENTPD;
>> -	reg &= ~sCR0_USFCFG;
>> +	reg |= sCR0_USFCFG;
>>
>>  	/* Disable forced broadcasting */
>>  	reg &= ~sCR0_FB;
>> @@ -637,9 +637,8 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
>>
>>  	smmu->cfgs = (struct arm_smmu_cfg *)(smmu->s2crs + size);
>>
>> -	/* Configure to Bypass mode */
>>  	for (i = 0; i < size; i++)
>> -		smmu->s2crs[i] = s2cr_init_val;
>> +		smmu->s2crs[i].type = S2CR_TYPE_FAULT;
>>
>>  	smmu->num_mapping_groups = size;
>>
>>
>> However, only if I remove all sids from the root cell config of the
>> zynqmp (num_stream_ids = 0), blocking starts to work. As soon as I have
>> /any/ sid listed, /all/ transfers pass. I'm using 0x3fff as sid_mask
>> which covers all 14 bits that are used by that SOC.
>>
>
> Could you comment on this? Is this behavior different, more consistent
> on the i.MX8?
>

Ah!! Mask bit set means "ignore", not "match". If I clear sid_mask,
actually just like in the Linux DT, everything starts to behave as
expected, and I can selectively block devices (streams). Will write some
config patches for the zynqmp targets.

BTW, it seems we are missing shutdown logic, thus will leave the SMMU
active on jailhouse disable (and will not properly disable it on errors
half-way through init). Also, SID transfer between the root cell and a
newly created/destroyed one is not available. Both properties are
apparently shared with the SMMUv3 implementation...

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/db19391a-ffbf-ce89-9e4e-f811e501c993%40web.de.
