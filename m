Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBCGDQTUAKGQEELHBZYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 116E242B98
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 18:00:09 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id o13sf1639040edt.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 09:00:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560355208; cv=pass;
        d=google.com; s=arc-20160816;
        b=I3l0sZvw5DI1ukH9uWgcmX2H3f8G2ZrzxWnafpLU1aDIZ58qXbkpx9IWxFZAxRE2OE
         DiIlC/p0h1OBaswFE6UVYqmM9PSuKtGomLO9Nml1QHrwZb+NTsWa2N/K7HrpT49BrhDk
         rhKSiXMblWrX3iACDsCu3+6L4YDN4R8YOnTpNQ4YlVjhoeSqY5kve+UbQOeoWn2YnjPc
         WX9++OHTXWYbWg3G05kJM8AffhThzHIECSRLTAHnc/3u/ELVVx8rtmUTOufnqFR8GFEx
         TTXvYI2oSEcOzVVs2UexpaEpa4I8m2HuH34cfwgGcTC1JH9BElxWCth07dTDzGknLQxg
         yAnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:sender:dkim-signature;
        bh=49yiXl4rzcEx8tYZFUg0hs1ibjcuSCZ8St7TkrNqQYU=;
        b=ESBX7/L/A0+pyPG7faEqfRn3KLi5F0Yn+L9YeYVq96dDZHQ6lvsYmXKZBjGapGjobQ
         B8Rzyq0csSlB/CKAAVC9ijtOR32OU0spRJTvAz3bSjQGks0meBx0mvgsP+u/v7vVCD1d
         eQxsXQzdihyTIxXGykQBJwUA4aS8kgxec/DxHgV/5NQqkr9/qElZQKqAhoqEaq3U/PbS
         I9zWAbHsZidiDpltUbS0rFjLKBAxfo926HLfzftXOnM88rBG8qyQmAplfVzfA1m1RFk3
         F91oa0UE0JxX+br+2tEbC/+b6ExKw3CIgGB2ICQE6MSpwXwMQbcVSHEBKd66korXTCAg
         ECug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=o9oryvtu;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=49yiXl4rzcEx8tYZFUg0hs1ibjcuSCZ8St7TkrNqQYU=;
        b=TPRQUR4YiHr/9+91MQTlhAIjp4dlOvdcALSt/XK0QhCZQfh9i1Y2cPmhk/fUuKgnA4
         taYiOfEuAp/dgTVBku70FLJHQfbYf28GJDJIXFZI1Zq3e5D4IWzzfsR8hJ9331yI651Z
         NmyFTPFrG+4zAz4aUvFHCxgNhDcJKmsiShhciOXczB6gugehMluu3OBTUrx/u9HaJISu
         R+2s+QchmWcapAsjalkH6bb3Fzx3/49fM/NjZ2nQqxqOE9m7h+PDAcnvvKsQsMqhN/lQ
         EH3dhJPWBOp65jeDCHsQPNmSANsIv2YWSE0il8pCM+8Tc4rLjYYMYpzLv6j+OLT/9B2T
         kJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=49yiXl4rzcEx8tYZFUg0hs1ibjcuSCZ8St7TkrNqQYU=;
        b=p9vbewzQp4ObRm/hic8DuvMQyimAG+ihEFYpSQdgA1RL+r2JdduVsqAOTywK9kCI+j
         7w1R2YdBvfmtklNH+dH+R05glHbNAIEhJEk8SEVCC3Ul9w80FAd/3lGkHunzHx8drhMr
         sHwFkmb/PZgrtj9uAcF7Pq99KpAcWTatGrke+6p661tHl00XhAJgdZE5P+Qzg3ZzosCG
         DKaO9hodOXgpIdg8uDUnMdSdSS9u/6Pmh5cRTKsvucxqDk2TTvtxSLCk8EeyPn5+b6oa
         3CZYzyP3cmW/r++/1ykXFUaVMIR+QIcvsgKDIESRcTzcpDXAQkSCAe2zePGVV5ErNNEB
         glGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVY6KU5zgrjAoPRudMl8RQ3gHfq7pHsS1o3qH7DLQ+FUabBMCc0
	kKjjlOq3p/sCFTGthQbm5lQ=
X-Google-Smtp-Source: APXvYqxrV5FOAq35pxDbGewGIErnDzXAG5r5M9rpGigzjWs5HqvlXa7R09PpS0Jrrycg0PHKoqOQuA==
X-Received: by 2002:a17:906:e9d3:: with SMTP id kb19mr69816706ejb.248.1560355208633;
        Wed, 12 Jun 2019 09:00:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6c4:: with SMTP id v4ls635411ejb.12.gmail; Wed, 12
 Jun 2019 09:00:08 -0700 (PDT)
X-Received: by 2002:a17:906:4e92:: with SMTP id v18mr15374716eju.57.1560355208012;
        Wed, 12 Jun 2019 09:00:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560355208; cv=none;
        d=google.com; s=arc-20160816;
        b=blIxWe949rq/hqxVU9diXzvxsfk48gekeJahheeWAnaC56NmngffSfBNTD5xYMjUmp
         n3MtJv2TFaMia/vkmqBykeuYxFnl+BVG0LdGJMa4as4P+yYE3x7JdyruNCZYXY8JIy8c
         0J7SFxR1TSBL/kb4zvlZ0Tza0psbRIUAHKnZXuzw8keZLVlGqpd2GwgdiEpVNzQootM8
         oIDB4BvTgeIIBwdpM7xo8g+9WEEpOSXI0A9Xbyq59dE/sx20tIQMwDHMcg4zaODAB7cO
         5bEobSXrLQF1uv+fGmgQJYgQ1UnLuGEo/U7byKJ20NkBxAzxD0ayEJP4SUOIQ19ksEtp
         CKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=K/aPJeYFUNKI0BR271QtKg27fE4vxGK9WXIyT6yX+sc=;
        b=pDNoCeblpil7mCH4nPHUx8IFNCCF5iE93977iwEtuOeMaJ8SLw0KtakHUnjM2GVWMQ
         HtKYMe/Cez4Ic3AMvkrMjAcM6c8OtzWUuUssrFx3MjX0gG/JJDCxy9K39gfeY6m1pRof
         TRqPvlmy4wSnhzOW4l07XK3fQoaFNLJs89qr+KKGbSZ457Ozr2Sx/AGhLtrRptiLyruE
         VScnT+zcJTf1vzhczpQUdZabNKfrwVQTdPG/zts5ZaQY9a1zFUZWFtDlBVSAo6MEJ7DW
         Nv3FOra6gmv8otuIAabbtsklnzyub8Imk+YfrXjajzvkz5co2RCWTvAoZlzV8/RrA9gR
         wQ2w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=o9oryvtu;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id k51si14709edd.0.2019.06.12.09.00.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 09:00:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45PBQv3gm4zxxM;
	Wed, 12 Jun 2019 18:00:07 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 12 Jun
 2019 18:00:06 +0200
Subject: Re: [PATCH 4/5] inmates: uart-8250: Add MDR quirk for enabling UART
To: Nikhil Devshatwar <a0132237@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
	<jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
	<lokeshvutla@ti.com>
References: <20190523211623.9718-1-nikhil.nd@ti.com>
 <20190523211623.9718-5-nikhil.nd@ti.com>
 <ec13c47e-9ff0-8fe2-f895-27213a5b7b6a@oth-regensburg.de>
 <8cb3e54a-a0f6-38c3-626d-0dbece8b2025@ti.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <6b51d8be-2267-32df-3ee0-1bfb07c81851@oth-regensburg.de>
Date: Wed, 12 Jun 2019 18:00:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8cb3e54a-a0f6-38c3-626d-0dbece8b2025@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=o9oryvtu;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 6/12/19 5:48 PM, Nikhil Devshatwar wrote:
> On 24/05/19 4:15 AM, Ralf Ramsauer wrote:
>> Hi Lokesh,
>>
>> On 5/23/19 11:16 PM, 'Nikhil Devshatwar' via Jailhouse wrote:
>>> UART is disabled by default on TI platforms and must be enabled
>>> on some platforms via the MDR register.
>>> Do this as part of uart_init for 8250 driver
>>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>>> ---
>>> =C2=A0 inmates/lib/uart-8250.c | 4 ++++
>>> =C2=A0 1 file changed, 4 insertions(+)
>>>
>>> diff --git a/inmates/lib/uart-8250.c b/inmates/lib/uart-8250.c
>>> index fb7940d2..42b0979c 100644
>>> --- a/inmates/lib/uart-8250.c
>>> +++ b/inmates/lib/uart-8250.c
>>> @@ -49,6 +49,7 @@
>>> =C2=A0 #define=C2=A0 UART_LCR_DLAB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x80
>>> =C2=A0 #define UART_LSR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x5
>>> =C2=A0 #define=C2=A0 UART_LSR_THRE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x20
>>> +#define=C2=A0 UART_MDR1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x8
>>> =C2=A0 =C2=A0 static void reg_out_mmio32(struct uart_chip *chip, unsign=
ed int
>>> reg, u32 value)
>>> =C2=A0 {
>>> @@ -67,6 +68,9 @@ static void uart_8250_init(struct uart_chip *chip)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chip->reg_out(ch=
ip, UART_DLL, chip->divider);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chip->reg_out(ch=
ip, UART_DLM, 0);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chip->reg_out(ch=
ip, UART_LCR, UART_LCR_8N1);
>>> +#ifdef CONFIG_TI_16550_MDR_QUIRK

if (comm_region->console.flags & JAILHOUSE_CON_MDS_QUIRK)

>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chip->reg_out(chip, UART_MD=
R1, 0);
>>> +#endif
>>
>> I think it's better to encode this in struct uart's flags. We still have
>> some bits free there.

s/struct uart/struct jailhouse_console/

>=20
> I looked up in the source.
> The flags are only for the console.
> Here we need this to be written from the inmate, which doesn't know
> about the console flags.

We do pass the flags to the inmate via the communication region. See
hypervisor/control.c:657. Just pick a reserved bit.

  Ralf

> Which struct uart are you referring to?
>=20
> Nikhil D
>=20
>>
>> It's better to not reintroduce compile time switches, it took a while to
>> get rid of (most of) them.
>>
>> =C2=A0=C2=A0 Ralf
>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 }
>>> =C2=A0
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6b51d8be-2267-32df-3ee0-1bfb07c81851%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
