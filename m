Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBRWFSXTAKGQERZC25NQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E65B5B0
	for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Apr 2019 10:22:30 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id o8sf3493476edh.12
        for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Apr 2019 01:22:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556439750; cv=pass;
        d=google.com; s=arc-20160816;
        b=N+fDT4EekDDvncvGEppnAQyFcHZuSqHV1PZh0KYsfgv7FhqQMkXcHRPQfl9dn+VhVo
         1Gip5emhB8U/fCNVtI3U10ASKw8s4elapm9Mm3B0msml0vmwnrEOs3xxVRYfh7mE3O4f
         nRYTpEq5HHdHesBqtlbZ1nFi4plklDG8YMFhih4faR11yevio5Zgbnpn18PSUHCZfWwe
         kTsX8fG+PLy73seatOxV5+15jtCE4HtDW3Gvsvb6VY9tDFfQ9MFwqcZvFPNV9c6E05LZ
         t4Bl71Z/rcybPgmVMiOvlaRNIhwIG2FEgsq43ucOqazSB2J1i878FXaATfnSrZiaXRCk
         p6+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=LO2qzt73V8jLz1WzWm7ZsAuxsayYg0ZYD6d+FZXMS5M=;
        b=dCgtaAsPEcoOOEnaOZJuWVRSuDw9ZxyNTpQSNb7PcS+KtgjkDo50i5+Auay7AOTIVf
         QWklQVNvaMuZBhLzarQsAK0CG25p0rbax5zP4RtVJlksaEae2y1jP0YgHOqcfQApDDUR
         /nYEKF/X7twCEdDlL86ueIqP/7IJYi6OrJ1Cd+EckdSVgq//IH7Ql4mj9J3WHUsMApuP
         LHmFrsxqe39ha2AQclcvoub7+zc6PGNwkW98H9XQm7elew3OziN3nhujVzG40yo/KY/l
         QdqVTBQUnsqewEBbtGaZGc4em5iZY9M7RdGMKAqEPd4BFwUmy2UTGxT8S1euYP9VtMN4
         DgXA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=gouI3A1P;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LO2qzt73V8jLz1WzWm7ZsAuxsayYg0ZYD6d+FZXMS5M=;
        b=HT5aVGEywvHpQW3e0OrNn0eL/fWy9pZhIpbJz7lBXGsw74fGVTvAagPE7NL/ssFzFo
         DaeQ8TtC+nM5jPMG33M+A1W/ElICUnxxf5Sae2UxIOUsKbMT6zp6GJYOVpmAWFBfVD/W
         N0GWxXwtTG8cJLSaul+fbxqxUiJDJXbavGpRpZ+yPS510HFdTqbxq706Ea1n5wjenbkC
         oVI+XQSYjKcNB2HkMUwjpFc4uSxcfBVlhpn0Bk+yfFxKPyK4OjTDdfDAGVNDALLChLwN
         QY4IlO4iAs+PdnbtZdEGe3z4FtgVhKKDSBzOAn7L2J3jGpZN1qdQ1M27M75bgtlfda+U
         hJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LO2qzt73V8jLz1WzWm7ZsAuxsayYg0ZYD6d+FZXMS5M=;
        b=TKTtNzlXnOAtAJmzIbtLPKgeHPA3Z2kKIYYro1BM6mfixln3J59aPn2Df8T65EIlIR
         VW+pp/GnZkFsqLO+BzCD69d/0zK8DsMjMD1D0yVwvs4WiFLDdtaTbuDil+jM2IeSJEuW
         +m5A/B6OyFkauB2II6B5B0AlHM9duqnDxyqKbwIXcDBThJPaGZLhONg9eBqnNOOr2FXn
         BLCPxNxlmhEthX6uXGfaG8ceihIIzMIxE+Nz4n3kF1Y5oB91P43kWtYm1KUET38zcnVq
         kX695YDK0c/aLqdUW1ukog4Fo83AjJ3q6zCcLXkea3tfXX8sgTB/+BT8T5jQaMwZUN0J
         G/eQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUKZ54kOJBIKoh4zufR1x24zD7acFakkEryIfJVFZ8Xg6DPxE96
	dFrAzOBr7J8UARUxxnHBmkE=
X-Google-Smtp-Source: APXvYqyZ6TdniFvza7BEBHv7pO7VYrxwa/bwzde+/ZDU+YgKJE4Rua+3TJTOImouXg84Itn4uJNdKg==
X-Received: by 2002:a17:906:660c:: with SMTP id b12mr17541507ejp.299.1556439750462;
        Sun, 28 Apr 2019 01:22:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:8871:: with SMTP id c46ls454980edc.15.gmail; Sun, 28 Apr
 2019 01:22:30 -0700 (PDT)
X-Received: by 2002:a50:b78a:: with SMTP id h10mr35174294ede.65.1556439749996;
        Sun, 28 Apr 2019 01:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556439749; cv=none;
        d=google.com; s=arc-20160816;
        b=QN8VyYmZznHb7jAPUNxh/TzW8P5XWjL271UJBetU0J+MA5680yPBQSzyZa8lr7GWi+
         GN/vk3hfDYz+KMzcl5iYqhkiExr8M1YYZJ8V+J/X2Bu6q/AkqPoLzEQVTVQr+1jd1q6o
         jtPyh6imbUILM0ulUwAxCZkRLSl6WI4bjGQRYZv53aAlQNfG443wq99XoRdR6coKp96f
         yru9gKpBqLCxmSceqn1XJd8x6Z1MQPVY2MnpZiGkCbdCSOuYtEJuVqcamaXMAo4+Flg9
         b/z4yZVB1zH66H4kKP1Mu9OftwMtFEr3qo4EO+loaAf3zgm52LRJRqFtRClDkpNdtnHx
         5QSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=OgZHbT/e1qCIDkTr3BTVxpbm78xzIK3kCSqkVX4LBpM=;
        b=VM5vyegaxk+JHjScYtTXz5UldnCz0DKbJ015xnidGQ82hJsdZBgvi71ayRz7g32xao
         T42tpmjdkyom4m0FWyVqBpufFsb08iu7gDCVsLLeUzemB0ozDiGtBxouEjpHYbnI9mSV
         J1oZZuyyJ7YeUFToN+9ABacMRuaQJUsb4ZnBGOl1kW0HBe0WUPjmgcI/voWOAjjkeD5h
         oOasLBSc6SVUZHZdfUUtFFBFpNhqTzQhQPHcxHWCeHfJb0PV/bEEiELIKGyqUqzwq0NU
         PmwJjU7pp9EvuurezgZw2zw+mUpsOFPL3qva/m//2CbjdUJHmjSGhaNr1p6u8KTm5ME+
         bO7A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=gouI3A1P;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id l30si94510edd.4.2019.04.28.01.22.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Apr 2019 01:22:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.159] ([95.157.57.47]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MKr7w-1hKf4v1Tu4-0002Q0; Sun, 28
 Apr 2019 10:22:29 +0200
Subject: Re: JAILHOUSE hangs with exception when trying to enable the root
 cell
To: =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?= <hkurumahmut84@hotmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <16e3b6ef-37e1-4734-aba4-247bcbbc18e0@googlegroups.com>
 <6526d7d9-09fb-c25e-0037-628998267794@siemens.com>
 <81bb9c90-1557-47ae-990d-b1bf417a58b9@googlegroups.com>
 <63f974a9-5944-4f1f-77a2-4bd7393ff8a6@siemens.com>
 <05d90171-db1f-4031-a7b2-48570eb37847@googlegroups.com>
 <fdfcd6e7-e2a5-4187-b079-ca643fb281a1@googlegroups.com>
 <32bc2861-e11e-4ab0-bdcf-063e2c05318d@googlegroups.com>
 <f704088f-99c1-4ec0-bd5e-90e15874cc7d@googlegroups.com>
 <3e5ad4e4-abac-03f5-5402-661e62a83944@siemens.com>
 <7f55a310-7bb7-4a3f-b111-0c2a24939b7c@googlegroups.com>
 <1f880925-0420-7c15-1aa4-07d001a6efce@siemens.com>
 <bcd32c87-28e7-4747-b3ab-ebaedf160309@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <32d0b346-10e4-de18-1d24-95e4e4cff977@web.de>
Date: Sun, 28 Apr 2019 10:22:28 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <bcd32c87-28e7-4747-b3ab-ebaedf160309@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5eLR2jEPaVLUlCK31WrbIKZeOlLokevnPVCuXixCMbRdbHW7nbq
 5JVYPncxH97Lwf4Jsja96PkXJizimprCMSfXgcCDVQ0krFfvN9f+nxO85EPMbccnu4P2KLz
 W0B9l7sJx/fZodB6ZJwi5jomyn2ZdKXiRSYNViSqXic0/WH3SZF3UjfZsgP9zG5AX5QzmgG
 C2Bh8dNjDahHKtxNYm/JA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nFLCmvTrZaM=:2l9tYU+QPzAryYCrjxQ+7q
 S8mKvCAC9g16IlJkxXI84PknG5A1UmRdlJt4+8DpQ4FMHPNOa8UxcJasDdFCDkA6x8fXpl7b3
 ZHh+mNByx8T3pw3E1WD17tu4FwMIHTnOCtIz/szERdUlKDlXkJTYZQ33EvUr4b++eEwwtCYIY
 XXj2TM3XLzaxlF3022aHYbqF8DA6d4bu2LHHYmUdRbdEa5wI7nBnDAskD2yuK1DsdUHP179kN
 jnFC0JotSi0HURs1uaq0fdOrACVdJvGcscU7ZmtiPVWOxTPcTqqSiIMBmBOaWJuPO1tH8QgHJ
 J2Ht6e04oOt6GGuE3Dt7UuoSDBcpVYN0RwOnF+fd0cTjMR5JjEEWzH9dbGx248gol7YcLVw8E
 08josXxFUDKcSSd4FvuUBqZKvJkFKVmOcJMlUaCnaBgS/0MJG/SP4Ki5x7sUdSFqUIAIhofa8
 XqA6wZnZLhMPMrMnEo5n7uiUU8e2wcyQd/v6wvreCmX/LG8m78EtTjpX7RjOq54JwQcPx8ApP
 tLUXcMz0dnZ7A/Z+wEzlsB8nX9AW07b7Jr18Op041iuIXwiAWOjruq9++SBiYmlODUkHkLCkJ
 tX/yD5rcmuUDn+wCKl4mTJ7ICJUuLQghhs4OAQxSLPJ0L4lbCR8ug2Zdm8BLGbKnHtTr1JEpx
 ox1on8+e2oe4THOeOc6sBXnRz+NkXnkXdZMvtH7JkUlgVoyadG3bK0i0DPt8LzFubxaU+nphv
 rTUmbQOyMEVP2yehqYE5YMPingbsnfw/r3+8tZ8C8o/p+SWqGKCUA5VnES9VxvmAGhMW5IWR5
 xGocPTwcnHIsu7hNYJpKM6PbByqajp6iPMx3JIgrNmvJ6o3DPcvnuA20AEKXpK5pEnOEOruBh
 okh4+l06mL4oSC6ewrtSL/0j+9QOu5EMY1RijBhh7tEhkN0hfdVhgQA80dy357I8ZZqQ3AlAY
 8xOqVz7zhIQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=gouI3A1P;       spf=pass
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

On 26.04.19 22:49, Hakk=C4=B1 Kurumahmut wrote:
>
>> During the handover from Linux to Jailhouse, we briefly suppress all int=
errupts while reconfiguring them for VT-d. For edge-triggered IOAPIC and MS=
I interrupts, we inject on event to the root cell to compensate any missed =
one during that phase. That works for most devices as the also check the ha=
rd for pending reasons. Maybe the i8042 does not and directly translates th=
e event into key stroke. But that should be resolvable with the next key st=
roke, in theory.
>
>
>> Can you log into the system from remote to check what is going on after =
enable?
>
> I have activated jailhouse root cell. Then I log into system with ssh con=
nection. Remote ssh is running stably, while labtop is strobing ENTER key a=
nd touchpad does not response. Also, i8042 counters are not increased. Howe=
ver, dmesg log is clear and console log is clear. I have disabled root cell=
, the problems continue. Also I removed jailhouse modul, the problems conti=
nue too.
>
> Moreover, I have activated jailhouse over ssh connection. ENTER key event=
 is not seen laptop. touchpad is stable. Everything is stable. i8042 counte=
rs are increased normally at every stroke. dmesg log is clear. Console log =
is clear.
>
>
>> You can also play with hypervisor/arch/x86/ioapic.c, ioapic_mask_cell_pi=
ns and the injection logic there to check my suspicion.
>
> I have not debug the code, printk is not running. But I have done some te=
sts.
>
> In ioapic_mask_cell_pins() function, I have disabled edge triggered event=
 code but result not changed.
>
> /*
> 		else if (!entry.native.level_triggered) {
>
> 			 * Inject edge-triggered interrupts to avoid losing
> 			 * events while masked. Linux can handle rare spurious
> 			 * interrupts.
> 			 * /
> 			entry =3D phys_ioapic->shadow_redir_table[pin];
> 			irq_msg =3D ioapic_translate_redir_entry(ioapic, pin,
> 							       entry);
> 			if (irq_msg.valid)
> 				apic_send_irq(irq_msg);
> 		}
> */
>
>
> Also, I have tried disable all code in ioapic_mask_cell_pins, It is final=
ly run stable. :)
>
> Jailhouse Root Cell is currently running at HP8460p laptop.
>

I looked into that code again and noticed a long-pending bug here, and also=
 in
the MSI hand-over logic. The effect was that actually no event was generate=
d at
all when interrupt remapping (and x2APIC) was in use in the root cell. Your
commenting out of the code above probably just made the loss of the event (=
and,
thus, the keystroke) less likely, but the proper fix is to do the injection=
.

There are a number of commits in the next branch now that should fix the is=
sue
without the need for commenting out code. Please test.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
