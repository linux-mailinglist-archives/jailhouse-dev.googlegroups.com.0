Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPW6ZDWAKGQEQD674GQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 23283C2545
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 18:37:19 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id l15sf3211397lje.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 09:37:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569861438; cv=pass;
        d=google.com; s=arc-20160816;
        b=i+KZeJKTcDEbdz/24x8bQp42vhQrr/sdu16dFIjmpcQ6N1qbizlYUJZaIQx/ZcT5GZ
         h7K33lnVQYakLoDvSY0ptFPvoxilvDZyrYBHSZ6xCBE4Zgvi4dDCGLDCKWUVvnwqYMsj
         pKvGfyP2fwb9LqZAg/clJLhZ3SNAraxecwWSvZnp1afJlhy/Skvc3/iv1cx303MccTNu
         h0vXgge1CxnmW0v2n1MG6N8O3G6BDCNUWENlEhnsYtBovvclucQAaJRxYW4qIeCfHAj5
         wAxwcpHM6+B4KVBBEkY0Zac24Uo2YomJMiyRm4ouCjAEIj3v7XvfZU84RzFfDecHIGF0
         /BqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=7kekDmkB4IyOZjVTuv4Vfa7REgqnut7aPzsJA1LMhIg=;
        b=EtmrPdt9500EjaUkZYED0yJcE7Y1j5fY7pwImdd3kzG1ymJFLWR5a4AlctgvS0xlxg
         hNwy7JOid/P6VL1/3R0Ev3Nf8ZpOgfUObd+4oDIlwJmefy+1CB6NNLqMCQZpZL6l5Rub
         frUlwHKDZzvd1oBtOjUX50+mRbaTVmT2bQbj1+QQ2VElJ5JFbL2ViN5YtnNXTczq2j8f
         rGTfCiT0jLejct9VduanV6CBhfJxKD4/pluJ7mXI645EfKsTCNNRf1wOGDdEul82frS8
         dR4Jjf1TU58xzPXbWBtKeYs2BRQiLwsVRjKn4Pudb/sEGn7kIv/6KRgiAIuUf2+7szS5
         uNZw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7kekDmkB4IyOZjVTuv4Vfa7REgqnut7aPzsJA1LMhIg=;
        b=mGfQH2T58oUpNDo7ixFbTg3ppvUO1xv36ad5qAL+0EwrSTIIhAf99N7C93xTLkxEpB
         QDzDfgbyod7LpX2yx1Lc75G4hNkCh8a3BBf3ByDeqeTmEST3iBmsj6vzYGFsIgILBzTR
         COnFspiiGN5v+6nagwl4YvO27MFw0VDFzX55EPMUraw4X0wXulNPQOG5spC200InTWSs
         l51Z0R+r5EQV+bK0OEjYEZ9QEx7bL5OtTmxkZfwk96Oo0k+imA7YhuwU/PBfQ2O5Sh6x
         IF4vJXEvx4kztREsZZCZ046+qQcUo3KMiQiLAQxhtM0UKVEfY6zjHolQfrODV3G836KQ
         Wxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7kekDmkB4IyOZjVTuv4Vfa7REgqnut7aPzsJA1LMhIg=;
        b=ZVfEVlJ1E4JIJ6mX54SwYHyjX0wtGggPT7FjIlRB23KKR3/WkEAelZsz0xix9sdfkZ
         1uaCYIQlauOCQ4RjPE8Wxp+yIf6SznbgqWmSaArThNhMzAqqHFYkPII2TsRzHPl0fAF/
         8sMLVKi6dPzciCMIdp+y1UFyGTJtEjEQQa8ZMpjFgY0Z1Zclzb9HAFB4nG+TBQvmfH2r
         lvNqislenyx1JD3Ju33LMljet88EfJB75KuapS9Z+UcrJ1d/mIEpCdhQLVmMAyeLDCwj
         aQTXjXrKENzfiLo9fdPT7RPqj6fjQJb5s5WwIounQcOh+hbj44CRe3X0VPazL96Ry53d
         IOTg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWdnyOWkvR5uot6eedAammJvG5sY4glw1mDNAmVcslylZY/gpSH
	K/3ukfiKMso5IMqnapNbVxM=
X-Google-Smtp-Source: APXvYqyyTw5KLgDlKVVWbL+ZLSu5LTcz8KTPrWZfSPHPBo7J8LfBkxdOIQtGjyw6qVQMdS+4qSafRA==
X-Received: by 2002:a2e:2416:: with SMTP id k22mr12607884ljk.216.1569861438735;
        Mon, 30 Sep 2019 09:37:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4892:: with SMTP id x18ls1201751lfc.11.gmail; Mon, 30
 Sep 2019 09:37:18 -0700 (PDT)
X-Received: by 2002:a19:f24d:: with SMTP id d13mr11977710lfk.127.1569861438017;
        Mon, 30 Sep 2019 09:37:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569861438; cv=none;
        d=google.com; s=arc-20160816;
        b=Pqn4o6nnZBKzdkiC+qsLRL0X3mkrYnyWFz1EOxkeAbytxmvO04vVeegxMAsz9SQ2tZ
         tZc1d01CcDsUB8QEgREfkQyqZHxAmJMUBZ7OrqjqyJlY/Zv5EQNGXSYvMHwk0kep+TVJ
         B89wMmYeL6hCnkNSI6m3PqdByGyaooFCBxr5VTr1N9hlTEMF676Uy0/TKQxPSVg4hb+w
         R9oAAMqUKxRo0QbcqBvFSfcSf7NypntJ4sGiRMKpJotr0HJTzL+9DH3DqnrpfNaIKZC0
         nN/xqpig9XAkdMUaf+azzn2f7kaz1OkT1eKb06P2gDpHykrkI4gp1X6m7JhPDR5qqqjz
         NwtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ahrqyqzkjCl1wnbZS+8liwklZmTBa4X5zRfLoBv8Nww=;
        b=L/AIs/0tNDMmE9a4ynWlv5JBkJ4PMiTVpD/wLgbdFbVkTmqMqI0dwCa18TGQTCntSs
         dMUOKcahYjJ2Zc9CvxnCZFJEBRE8MVjopFLEZAistJUfLgq8rhlTVq/HWP/9S7H3fdrp
         oNQk/9Iq23MAp+pUDciG+SQjTTIXTQbrVm8xfSvrK9helhaHBVAk9kGD35V3vs6cPOr6
         BJBnLaAFfjw4jm9rXHgo91E9X6wO5KAzjIOqnw6n4m1E66D8fF6Gspg+anfzwfPMA2lJ
         agTRVwg0mfjaTrlSvhkx5MODQMmG5Lya1HfXu8LmEj6CM6TkuLzQhXpUueSjeSMrR7j7
         6D7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id y6si723458lji.0.2019.09.30.09.37.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 09:37:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x8UGbHu6019542
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Sep 2019 18:37:17 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x8UGbGYT032488;
	Mon, 30 Sep 2019 18:37:17 +0200
Subject: Re: [PATCH] pyjailhouse: Remove superfluous definition and fix linter
 warnings
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930145239.16506-1-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d644b734-1892-14c6-8af3-86f506cd019a@siemens.com>
Date: Mon, 30 Sep 2019 18:37:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930145239.16506-1-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 30.09.19 16:52, Andrej Utz wrote:
> 'vector_size' was set, but not used.
> 
> No functional change.
> 
> Fixes: f6fef92ffaba ("pyjailhouse: sysfs_parser: Add more precise length of some extended caps")
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> ---
>   pyjailhouse/sysfs_parser.py | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 67dc85d0..e6b07716 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -490,7 +490,7 @@ def parse_ivrs(pcidevices, ioapics):
>   
>               regions.append(
>                   MemRegion(mem_addr, mem_addr + mem_len - 1, 'ACPI IVRS',
> -                    comment))
> +                          comment))
>   
>           elif type == 0x40:
>               raise RuntimeError(
> @@ -665,13 +665,13 @@ class PCICapability:
>                       len = 4 + (vsec_len >> 20)
>                   elif id == PCI_EXT_CAP_ID.ACS:
>                       len = 8
> -                    vector_size = 0
>   
> -                    (acs_cap, acs_ctrl) = struct.unpack('<HH', f.read(4))
> +                    acs_cap, acs_ctrl = struct.unpack('<HH', f.read(4))

Was that a warning as well, or just style preference? We have plenty of those 
cases, though.

>                       if acs_cap & (1 << 5) and acs_ctrl & (1 << 5):
>                           vector_bits = acs_cap >> 8
>                           if vector_bits == 0:
>                               vector_bits = 256
> +
>                           vector_bytes = int((vector_bits + 31) / (8 * 4))
>                           len += vector_bytes
>                   elif id in [PCI_EXT_CAP_ID.VC, PCI_EXT_CAP_ID.VC9]:
> @@ -679,7 +679,8 @@ class PCICapability:
>                       len = 4 * 4
>                   elif id == PCI_EXT_CAP_ID.MFVC:
>                       len = 4
> -                elif id in [PCI_EXT_CAP_ID.LTR, PCI_EXT_CAP_ID.ARI, PCI_EXT_CAP_ID.PASID]:
> +                elif id in [PCI_EXT_CAP_ID.LTR, PCI_EXT_CAP_ID.ARI,
> +                            PCI_EXT_CAP_ID.PASID]:
>                       len = 8
>                   elif id in [PCI_EXT_CAP_ID.DSN, PCI_EXT_CAP_ID.PTM]:
>                       len = 12
> 

Rest looks good.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d644b734-1892-14c6-8af3-86f506cd019a%40siemens.com.
