Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBB5JXPTAKGQECE4QWLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C8513F65
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 14:18:16 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id p14sf82725edc.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 05:18:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557058696; cv=pass;
        d=google.com; s=arc-20160816;
        b=mqz4vwlCjC561HHbKfXiCSEPw40R4Xx4A5AdLnrtLx+LiFL0H1XlEva1WSRUcJnbFM
         1at4xBtcmMYvubCXOlYFHcI48yYqlKJXmsfrSq423WUZRz+R835r2VVluLcQORHYJCJx
         n8Q/Aq2h7kLqhsBPbtapaHSbVSU/hcOUxe1neC6Pdu7gKCM987WrfJHPK/i9z+p94H0j
         SvRM25WEn+Znf6LVFB9iAblg5+f6CZzelfnLCA98xIKu/EiqEkvZByhR73U7Y5Q9r6hG
         NtUYiZwWtAU+Wpi95l07K6sdCQyBaipLLg9pAQenWOGFKC21fKFeCnr4Heh2vZIsU2mg
         BAtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=8SbVauG9WhRJZSlAwBnwtlFaYWTGWFq5k2/9myq++O8=;
        b=p3o57DIsKhFVdzsewkMEw0GbgawK3Y5vdPbCIL0rjdwT+h01A18rALqHD9lBqJ/f/p
         KL/JsSeWoI+L399xeYuPZ4Oy8c5y90/RLTu2TDGtE/ESTjPQGK5XJEn3ZnM3gxl3kXml
         yZ9XZnGkK1fVD/CvdkzdXHh3KOqzazJq5PTFnTqzTRtRNfKRGJxOdhRjWWDXidR04Fu8
         sYzepwSi7r9mVBdY0VxbeRj8dfN0gKGUxFXYAtQ2l9tjn+N1EE1cH+PbE5DlPdzmexer
         IWYZynE4oBbKhmC7vIIncvrALuspuCqOSCQP7G1SO8eE+wUgZ44GuYHTB1VucKYHmxey
         mPjg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=PMQ4US0H;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8SbVauG9WhRJZSlAwBnwtlFaYWTGWFq5k2/9myq++O8=;
        b=HRgS1BvsGxrNMEDEz+QuJzU+nwyk/ZJbUTZYBMYU1M8aneOypO+9aOibe5IwHNI9yR
         dbaejaPvwAgwjcJtt5M2V7j6VUSOjMwcjYPl11TKgdMvie1tg4/ZuEYuO5EWXw5KjwzN
         RMeKtVVfZvKvH5zgE+x2j6eo3WpI4KXtLPFHgOzXwS8xofnbaZ6w8VJEbs2fi/PMA1xR
         RvFgrrsfaytgG1uKeYK80f4Lv/+4H7TmduAUJHvALlvzZLVe9vPMcR37bWuu659nf2Ou
         P4RFu2L7D4/Kcyw3+boBm93dfEcJXikW0Me44eVaoxxlmwXwJR2sowtKePm+Z9TDhdSa
         rI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8SbVauG9WhRJZSlAwBnwtlFaYWTGWFq5k2/9myq++O8=;
        b=Klcm6XA+GO7O06NiO9hQ1PNYRQHU/n2zXRWNu/xEUotapoUa1U/6xqFIWoR9zCmAIq
         Zzr0izHxJDsBPTSIP5sayeGGCH1Yc+ozNAKfIqara6D3CY6849hyYa9Y9ZRpHaGwaJIW
         f0sx1LF6rzkcr6JZ5/AXWZMmMAsb068AuEYkx/HVmh2w1r5bgoaIh9+Zlm/DABq0ywRZ
         vM2pdrbQQpSKrCQxIxoUNLb36ufUdbw9KsHPkueqeyc1aSjFFTdWHYwQ7YzpX0bpTKbh
         Hnl/RO0aLJNOiP5asSXHGzy/Kas5Rej1I7LfhbvbO+CSgnyPJWIqGW+j5d7Gs2Ahh8eg
         tcew==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVJtnnjGTE09wJDTosLDC1+Dv87fnalz/sThkqyQ1nTj5wcbyav
	Sd17ROrlfZ6Syr56fW1J++o=
X-Google-Smtp-Source: APXvYqwb0li3N0fzXt2AoNIxwjLvTSqNr1iSwl2CjW2He1ZOcasK+YfeTRc10XAvCMWqtASo5SakbA==
X-Received: by 2002:a50:909d:: with SMTP id c29mr20065544eda.14.1557058696079;
        Sun, 05 May 2019 05:18:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:8d0:: with SMTP id o16ls1958622eje.16.gmail; Sun, 05
 May 2019 05:18:15 -0700 (PDT)
X-Received: by 2002:a17:906:fccb:: with SMTP id qx11mr14534783ejb.276.1557058695575;
        Sun, 05 May 2019 05:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557058695; cv=none;
        d=google.com; s=arc-20160816;
        b=Lmqx7/BU0T8IM1AsCVDQBMZYdAwfh7Ks1Ol82KPrF7XuJ0Mmq68xdCjVYMlAOGzOC+
         7poHC/1ru7TOSAmOCExmld+jV+0HcBbg+4fbvrl9jGi57cablUudpdN2NO4cH3v8v8/Z
         IOvFKlUPvQtHx22n1ITcPP5aQIihUn2AMkf374ySfgqozxK0m0cHQwQ9Ze8W23n+flIY
         bmXnH2j93witm1zfCeVHlgWs9sBm2yC2lmugR+Blii7/eBsl4dDAZdCmAoyk5SciGVXO
         98MNNfNdWk43/Jj1Wpa4VNVCou8atPEKJVh86mBEnV68HluW85T/eIRkOUxRxR06uCaK
         MZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject
         :dkim-signature;
        bh=54GUHi+P6BZ4y/uwpve85EOA+E+ERDojAJQXOZVxCP8=;
        b=paK6SFuNFGGVrFaC0s/AzPWQm5J7nxMrdFB4FIv5rn2SJzTgUO3t6UI9XU/dlnuVeH
         2yfrL6jgtUFT9zUqVTsQhCmkE0t2kGwO2kjaXVHU6syqOqx40qDujKxOQ0QozMxp1uGl
         6UdvS6t48fQLiOV3Ec+yGtubnFVDIOE7qoepW1kr0iEz+4bMVtqcbVOLP8LHo6POBdPF
         eEq7QBhFU6H7tVCiw4I0q6ENoBl7zp2BumTPa/L7LB/1ZmDmYynb7sL3RB4N0ABof8Op
         DFVM5b/AzpBhwtAbw6VnuINK3a35C2SFROfDlHgHfrH4/Ps8IJozv3FYIqhJd/UY/+lF
         Unaw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=PMQ4US0H;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id w5si404191edw.1.2019.05.05.05.18.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 05:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MWB8f-1hGtP40lVx-00XNIB; Sun, 05
 May 2019 14:18:15 +0200
Subject: Re: JAILHOUSE hangs with exception when trying to enable the root
 cell
From: Jan Kiszka <jan.kiszka@web.de>
To: =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?= <hkurumahmut84@hotmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <16e3b6ef-37e1-4734-aba4-247bcbbc18e0@googlegroups.com>
 <05d90171-db1f-4031-a7b2-48570eb37847@googlegroups.com>
 <fdfcd6e7-e2a5-4187-b079-ca643fb281a1@googlegroups.com>
 <32bc2861-e11e-4ab0-bdcf-063e2c05318d@googlegroups.com>
 <f704088f-99c1-4ec0-bd5e-90e15874cc7d@googlegroups.com>
 <3e5ad4e4-abac-03f5-5402-661e62a83944@siemens.com>
 <7f55a310-7bb7-4a3f-b111-0c2a24939b7c@googlegroups.com>
 <1f880925-0420-7c15-1aa4-07d001a6efce@siemens.com>
 <bcd32c87-28e7-4747-b3ab-ebaedf160309@googlegroups.com>
 <32d0b346-10e4-de18-1d24-95e4e4cff977@web.de>
 <9732f874-1271-4296-b2ef-ededba614a87@googlegroups.com>
 <7deff203-cf29-6353-128a-8b40f8d42584@web.de>
 <cbeb1b02-5799-472c-bb5c-f6eb62a60305@googlegroups.com>
 <8ef112a9-2f0f-9205-3e67-f0c6fed498ba@siemens.com>
 <3cb885a7-8b66-42b4-adf2-6fc98375efa9@googlegroups.com>
 <26834bed-4a78-4bac-b093-d8f9e2646e72@googlegroups.com>
 <6ca6fe6a-27b7-4110-884f-e3c5be79134c@googlegroups.com>
 <f09baf4b-72c1-d6d8-56af-966b1afbb88a@web.de>
Message-ID: <be558db9-b112-5891-119c-0290c33ef7f0@web.de>
Date: Sun, 5 May 2019 14:18:14 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <f09baf4b-72c1-d6d8-56af-966b1afbb88a@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JY3zbuIrH+T5IKqUZFko7vIIKHfjI2wpTL7xv0uEbNg3T7fy+jd
 VVIV5hBSwDyu14myF2saHVRSlutFCi09VMv13SGuzCi5D0usqWHXAJjPcGZTVR2LbgBpd0s
 JQT1JopXMbRM0PruJfPfw2JHH6Thl8NvvgSKyObFxDcJ8IC+/Px0OqL0VqFbuYz/hBD7lU/
 w84ukqYqCq2CA+OsjcRIA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GLPoY1Pa6zo=:iOb0GYeksuOwQKTWRavzKc
 9HzuB6XI5d2TJamYa9XwGL991i/cWJW9mbSzPe4clsq7yvSQswnZfHWryR11vLDGePcXgUyrK
 lWsNr1mldp/Y5OaBdGcWbCgTeyAQBnoImSB1vJkwU384xO5PP9nU06dFRpRyYHxrFb1JP8Lto
 nhMJt3HV/zZFnCzyuD0xTx6O6SN4EOq5uj4jL8I6PuhGHuiM8xJ0oeNtVGnRXKONIyf8bUlun
 V9gOEvwvMXhQ5wCOgJvoAeek1RzUmiY5fI+r7I2o1rcgyBNIbE/WquoVdjunxBZ4SDd4iDf7u
 micqvpbVOfs5jd+A0frMddoL7Q/MGspGBCaFQvfwx3bzRXLBkozdvaym5VtWFJ+t4SQnM+c4A
 Da+G68BMcchiKJ7GkgO1v4nen5Rsg5YbFRrSilQBBqb0g+9a3IeSWyuOq6RruPxQVm021roQz
 gny8XnYgbIyUboloDC4xkTodbeyECIeN2J6oUdR4W4GvmyD+Vhk+80wDxe/HI8t/gbbRORwLs
 nI3VOaLAV6L4PCj5f6+3ncOMrpbO+nxAuguDshtz5CxxAFmkLXQ9XrTh3zaandgoCSLzyykCS
 wGxKY5d7hUfw9H3YZki6yb8Zp6AI22eHqWHAr0Qr8zbtyE8gtA+/DF09T8lv7nVYxrPPJ1UOu
 TXSCtsbQYJ4ctmb2eR40g0+gNMn7BMMuuLU7ctj4yK0cIxEJAbMWtvQSMah0itDPIjBmLc4dJ
 guECKhfGyXZru+QDS+5/RSVAyIrXPbT5yT791rXoRaJvjJv4JI6E+K5AzHsRkmP90sTqenlTo
 tlxRFXJTvgnEqQ2Dwy3Kypx47jMApVN4MDX3K/tpS82OrZBi2aKXpp1ZSBPWWILiG+iSzhdod
 TdkmlCRwJg8m+KxFz3NXkQgjsQvbTeGTtGL1uzafXHh7D8i9IcdYwxujMqsaBhCFO9W2A+v73
 Hg2E9hIuYgQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=PMQ4US0H;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 05.05.19 10:10, Jan Kiszka wrote:
> On 02.05.19 17:06, Hakk=C4=B1 Kurumahmut wrote:
>> Hi again,
>>
>> Is my last patch in my previous message correct, I am asking for my curi=
osity :)
>
> I still think it's papering over some other issue, but I need to regenera=
te the
> config from your data.

Checked the configs that are generated from
HP_EliteBook_8460p_2019_04_29__18_59_data_collection.tar and
HP_EliteBook_8460p_2019_04_29__19_00_data_collection.tar: They seem to dete=
ct
the DMAR unit base addresses correctly, and they also do not map them into =
the
guest - all fine. So, there is no need need for your patch. In fact, as I s=
tated
before, it would create a bug as it would map the DMAR unit directly into t=
he
guest which breaks isolation and more.

If you still see access violations on DMAR addresses then this may have one=
 of
the following reasons:

  - you forgot to disable the intel_iommu before enabling Jailhouse

  - your Linux kernel uses an instruction for accessing the DMAR
    interrupt remapping registers (which Jailhouse can emulate) that we
    do not support yet

Please post the complete access violation report if the issue persists.


Regarding the different configs generate due to different kernel RAM addres=
ses:
That is a harmless effect. The RAM regions, in their sum, will still map th=
e
same memory. We could avoid that effect by detecting and coalescing neighbo=
ring
regions with identical parameters.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
