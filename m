Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBBGQROFQMGQEEOFX7ZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8CB428179
	for <lists+jailhouse-dev@lfdr.de>; Sun, 10 Oct 2021 15:17:56 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id l6-20020adfa386000000b00160c4c1866esf11067132wrb.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 10 Oct 2021 06:17:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1633871876; cv=pass;
        d=google.com; s=arc-20160816;
        b=CqIC8tlT5Ef7nwuKKLZocHMUusDJFaq5Iy0A8hxrBhqD3rC70qpR4e5KWtUus2j+T9
         /tQCgZvwOtFBWCLStElIIPWkOcxksBkqxs1oRQam0d1lsjp4Hb0qqNZKdHZmoX0JydPq
         6JPlgVGRx/GhLbqzYvYPmmcPeEnLE14MOpvu2NkDCud8tNOkkY27GeozuArAm470cM1t
         0nzC9QpxjtzCL1sOnUtxNghwRX/XZNlXCACdYKTUnLt9Q2/+GqcCYuiEtTOuDi+5Z2gD
         LY5eZ2Etd7RGdEzxKaagHR1QSv/L3/T1oe8f39BqM8FtJyR83vsfyHDUylc9JPEyTnCt
         f4lw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=U+BdZgujL8OcW0W01JzWfDVaBjrU9s8XZCeHmHdo3zo=;
        b=v0EJpaiZAHM0GdLyilQpvasVdF8zdvu3PSwpbDEWwz4qOUtPBvx/ilY5n6kacm3Yo7
         vIElfLNtC0seT0fLK24/YJbgLAMsepbAyH+ND1FIt7PPqDWUtQUYYDYiBxZT+I9qtDrd
         N8nn9Ug1UDtaFKrflXLt064kenLkwxgYjjrhJjm8dN6CehzRZW5HvoXrGxsKLTq9Osfk
         A5f2TdwOLw8BjoMAOQVA/i/gHe4tOBhABeEr/yPeTPUfjs9a09EWT3yTIuC2cJTOx9r6
         ykWAoy3tfWfCSbQTiI3QWKWtpc37ossY5jF/7HXgXfMprZeyMZOEhFesP4Dztzrbk55j
         F3gQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=KNX0Igya;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=U+BdZgujL8OcW0W01JzWfDVaBjrU9s8XZCeHmHdo3zo=;
        b=sxMDsHu7oeXuTTMvJqHfewIVEcEsbf8ChdaxHYks89kR5l93hvlaMz4k6Sn0CP67pJ
         7wuZLFQ+qXxnKN4QA2SHszM4WceQFDFyfA8YdmkVwOHp0wxny6mXCsRaXtijlCCYl5SP
         wG3xlF6w1eiVwCrBCAaNvSyzdjR9k7VlP7sAtXRtMLBCnwAVya7Hi3vfWaiker55+pRV
         QAHi7P5LoRfteOSjCsXI08saM53QJHKUCevIPVSvmzc26hbFrIyrk6gaqmFOZ7DWh815
         4i7S5gIqE9Q/nT9ES/4nTCjWQYeD8B2My3wCQIIMprSg/SaHcQ0PsztlSntCXNt+OC7z
         JJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=U+BdZgujL8OcW0W01JzWfDVaBjrU9s8XZCeHmHdo3zo=;
        b=PUk/P+PcnNiNoU5KToeYMl6NeS2C6vLehchlDbKVyz9W/U+KZ9cHGcYVuA8XlrMihl
         ZGTiQfbKtkgqBOpbgjZM4KPAybbLCHzCD5SsnZ3eCOuoGNTLSIA+zqX4SYQvzHAFXqg/
         loyTsCy7fc1nlt6oZyO7uUl09gUFPa5ZmZbVsj1eTCpmvAKSi9T2Ma8buq0uJcVdeh0Z
         xKr+Ul6ZBdSvPvYz4wQyBaw+p7gqeI3UIulOL9q+Sq4aw2uEz6RQ2O+9zZ1/R26dIJyf
         vlqhh0rCf6So5tViltw6lx20MBXKsd6Np3GuBbwGZNqJoqkYVSLCAbGk5Rbc1j7mbYbL
         2ZeQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5319I9ZhrIZurQCmUlm5NFKU6RjdXfixZ6K5ZyDXvUSwLTCYxdYA
	xkwMakBWEUhcw4gQjq430c8=
X-Google-Smtp-Source: ABdhPJy4Vej+g8BQHIzc36G2mnCd9xf+FQuLsXXfJ4QimkicIO6wGDSS1nousO0rvcDw+lJopopoCQ==
X-Received: by 2002:a05:600c:4109:: with SMTP id j9mr8794608wmi.25.1633871876493;
        Sun, 10 Oct 2021 06:17:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:8b92:: with SMTP id o18ls2718931wra.0.gmail; Sun, 10 Oct
 2021 06:17:55 -0700 (PDT)
X-Received: by 2002:adf:f949:: with SMTP id q9mr17415710wrr.331.1633871875439;
        Sun, 10 Oct 2021 06:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633871875; cv=none;
        d=google.com; s=arc-20160816;
        b=I7AK+qcJg43tCCzOz1yPIPFIBz9vkCNm++1rig231rzppZdbN24dss64BCSU/i1Xn1
         GXmtljvZaKHCkhwKyWfhOyCpm/yNu22Z34snw3JgY3jURwtJlxUe0Ij7pgh9J8064L/s
         CkP5TaBli1FOfIQyCE0f62gdsS4MNKMkbawASJax1ex+MqjpOjyG09jnjUXBrkkP7C7d
         BbYgJOqeGnN7XotVYzMAeoB8Y9OCWmW775tFvsBIPk2V269cN1Rk6MdMTf2nRrnexifx
         cQeMqWLTq020hfk8tJl/qQQ1CTvZuDPCUGOEemLZIjDTS2bl2wloOp5vfoDivMyEDCck
         VKGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=sSeWCWywctnuZ3M7XGxn+lO7VyfTsEj9XSvn4vQOPC8=;
        b=1FsOqlvjBibfMelISpt+ZdLj2Cu2TvV1WfB0a+LMuq4gwSfrnHBr6P84XA0cArOcmi
         flANWZYwL1BfMB2a/U6g39FBOF6gKmLQI6RPQGNVWYYf3BuQTBRDwRgMWNRVIztGXFeI
         nZ1ob0yueqJDa/4vLxTkxfr4QWkNeatxCdMua/h45RjeC2uGO5ZPxM8xpwHnrJenf4Ph
         wUKbcEfUsamVQg7Jj0wCEzL6yq18EPosZQoh/98hiMGzjZk+6YycMSjjXr6FHnt2U+S+
         tqXY8iDIzYEzeAGD5ErH2Bdt4cLJZQcWWo0nVMUzE1tYfdsNFuTz3u68f4M0IALEHe7+
         16Qw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=KNX0Igya;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id b72si757465wmd.1.2021.10.10.06.17.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 06:17:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.84.132]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MejSy-1mOV343oyW-00OJGg; Sun, 10
 Oct 2021 15:17:54 +0200
Subject: Re: [PATCH 3/3] Documentation: Add available NXP UART devices
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, jailhouse-dev@googlegroups.com
Cc: Stephane Viau <stephane.viau@nxp.com>, Peng Fan <peng.fan@nxp.com>
References: <20211009011138.469592-1-peng.fan@oss.nxp.com>
 <20211009011138.469592-3-peng.fan@oss.nxp.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <1657c200-8bb7-4138-9fe7-cf361a6c6a33@web.de>
Date: Sun, 10 Oct 2021 15:17:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211009011138.469592-3-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:mCJnWm0mJrQhbBU0Mwb6mictv2iWxsv2/vwe8xfXL82KjS45KBg
 kbXNfF+U78f3Z+vWEw6A/5jYPEvHYZ7oN2y1tGoxtHLPLXka6B8jujVHr29F19GsuvUBbWc
 zXml7shLyFTj0vpZvd5P98WnlBnRnRYR9uQWpOujmM5BHdVg7Jm3AQZ6re6pFZGD0EtAAiA
 olcrTWUKWrfK76+VnnMow==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7mbte4z0RWU=:eA7k8n6P7zfMUDTD/lBRxR
 n/lMI5eBCR3nxhvN+w8xM6eNlccaNKgRmKrJnBrwxzee/0EPU8vzycaTGsVilLjnQfLiO9jui
 /UHZ+VzZXjBbTZVhiQMHWQoFIHmREpyM8qMPrInOrgTVrapdfqgM0DlcWEgnlRA7Wme4zYHRv
 E6sN86kIjpTqwtMLT+HRwelEWyz49OOZPXLSqdeWFbMp5hqZoh48oLAhc0t628WSLNdznLxKA
 2M/JiSa4rGqurOCRpyQ9l1q2yr8SiyI4Opzacv18zzxQLUeJ9PJa6/VHPkcRZw1w0+AZ3/3xV
 pdKaZI662VArtiJUDVIt2TxhyUpb2TaAxtxbq42NbSPXwic+NpEhxT7HUuqNb2umAG/r3JLYb
 TolY07pLqacLN8sRJzS6v79g1ReBjWIFz7Ceb9vAtZz9XNUOk0basVzAok3mYpq1QhIK/V8Rn
 uoDXQj65PL1q5/mtoj2ZjogORwKXKoBtD8hPGjHR2s9DDgDWHAdzibSEQUU9j2eYctnsDzB05
 ZFg8Rm/YnpORH55p6sW1pnW0DjwtSaUQc+MlBTzJB/DTDrofHn6UU9lcu3yd8fLJuwzPznfBv
 hqMEedEMpO0mwhyS+FOuUBFRs0x7vLbxChdUkLzejhEbs27e9G1HZEqJUs7iL1BCEZQa1nM/O
 YuqatzEI7QDurQ8HnNFetNei5p8b3Gi2GiakYM+pE3SkFN27Tn0PFCV8wzB6DJYnPVhixcN25
 QBwgnIJWnpPdYzYN7u0+iVo6uR35X57J07PW4M4KUYbRaxTX4hZ7YRevOMW7ifWzehDY6crSa
 g4LjRHpVyrQ8+7h+YsVg44+d+Vc65CQ5z2h2ZuL3DNK/Mt8XBnFaIXYFi3v0IvfPWkc0grcct
 Icr8fsXoPg0cHoXNhVcXUpwJ6Idc2t9pttclPPYBRP03GB4SfmrY5pUamobFYjXn4LI2in5en
 WYFhpjOFty5+0az9ASiR+tM00+eZL9wqKscrwV/zXWm0AQCnClcwNGz3dYZz6XJ65LSx6yrve
 w61kDw7N+TdN5dK8dhFKn1clsXFQOLpUEGZVWleJlfoP229ul89dRi/qCvXytFGzbz0sfZwEU
 GxK2p4rER6blYw=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=KNX0Igya;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 09.10.21 03:11, Peng Fan (OSS) wrote:
> From: Stephane Viau <stephane.viau@nxp.com>
>
> Signed-off-by: Stephane Viau <stephane.viau@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/debug-output.md | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/debug-output.md b/Documentation/debug-output.md
> index c86270eb..50d91e29 100644
> --- a/Documentation/debug-output.md
> +++ b/Documentation/debug-output.md
> @@ -5,7 +5,7 @@ System Configuration
>  --------------------
>
>  Jailhouse supports various debug output drivers.  The debug output of the
> -hypervisor is selected in the system configuration inside the debug_output
> +hypervisor is selected in the system configuration inside the debug_console
>  structure.  The 'type' member selects the output driver and the 'flags' member
>  specifies additional options.
>
> @@ -28,6 +28,8 @@ Possible debug outputs for arm and arm64:
>      - JAILHOUSE_CON_TYPE_MVEBU     /* Marvell UART */
>      - JAILHOUSE_CON_TYPE_HSCIF     /* Renesas HSCIF UART */
>      - JAILHOUSE_CON_TYPE_SCIFA     /* Renesas SCIFA UART */
> +    - JAILHOUSE_CON_TYPE_IMX       /* NXP i.MX UART */
> +    - JAILHOUSE_CON_TYPE_IMX_LPUART/* NXP i.MX LPUART */
>
>  Possible access modes, to be or'ed:
>
>

Thanks, all 3 applied.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1657c200-8bb7-4138-9fe7-cf361a6c6a33%40web.de.
