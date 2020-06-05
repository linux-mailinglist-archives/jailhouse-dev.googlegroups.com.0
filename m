Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBAGG5D3AKGQEGUVPECQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x138.google.com (mail-il1-x138.google.com [IPv6:2607:f8b0:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C6E1EF5A2
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jun 2020 12:48:33 +0200 (CEST)
Received: by mail-il1-x138.google.com with SMTP id i7sf2353344ilq.16
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Jun 2020 03:48:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591354112; cv=pass;
        d=google.com; s=arc-20160816;
        b=jVKFpLgf+E4Mmh/pZbEqKNkIUsZ+1WfyX9zhFeRwRKQeQc6pNYWNmpZu7NPVWeZJF4
         2zwei9M8jZEKXDSScGpXzoKt3nv664RGdv6u4+Z74FP+coeUSkx/ujoPW/+myf68eA2l
         vVxuC+0m+bn1aYe/Un6y6OgrEGm0l/gEIbyh1ZxH7qn4TcgtkVWEOcteFYfYfEeZPyV2
         jsLiLR9cUHDLnpivtbIhyDDjw8lbeYqadk7GmCjW9zuhLlmO9CvQh9mRwEwMun+uv1t3
         pkv1k0pPX+BUjtWXj+MN7TrY9YDXx4y9U2jpURiBOmfuCJsX+UOqsjHwZjlENeHVNoqD
         AdAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=WipIuaYr1mqZrUcKrGydekEapuL9zn/r1yG12yqiLok=;
        b=bUe+hofuHmRPM3rZuRVu4Woij1HLLVTjX6cO95jnLqqIguVD1/OaPr1JgUjdY/Ua5y
         Ws2JE7YLcUzoTCv8C+mj+zyCEjFfVPKfBk6uMTXig1+jN8UDHTvunC52279/MoxARCQH
         041lxLSPycB1/skXK7kSbDdzN7vBEchAYrFepqajkO6sQqZfQEnIC9elKNGW2H7sybiH
         NCKPuTTh1EQ/pMn5rrgh3R1egU55vaQhxlKzW1LsW+2sI/tRYiEUB+Sw4DRPw+5Rjitt
         eazj1YTNl/RdKp071EM1TsCml95DuSkwwVC+4kJg4R2HsXQySYGKadv4EqbCJ9032o62
         d8zQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dt8roGPu;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=WipIuaYr1mqZrUcKrGydekEapuL9zn/r1yG12yqiLok=;
        b=cFO+MU1jYSNpac267smCA9yJB/gMVSie1zkWlrgZQSv3vXjWBeSACGuLxbpUkgmfZY
         cx2KrQJxw1WGFMgpyrjzKliRYQxlP8F+BlsvQSsskMpnEEf70WV04Gvrj4QWq7Ue5j5t
         AcWCD7Rf3KRiVUEWX4sVkb3i9BURfOyhFEVuxC08b0eXJG8dlB6QygsVZFrrHOME1IZb
         49r3CWHSLa5tKRuRds1GOVR/K4x9SnbVWzY5Vhc78I4ddbD/M7hLStoiIPaA+dQ9DNsU
         QDGThM+XNr+tbmFNNi/7vBpwlzRddWlDCq6XF9VoOnW//WIB8HZSrLVvuZINlngW/pRA
         T6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WipIuaYr1mqZrUcKrGydekEapuL9zn/r1yG12yqiLok=;
        b=SXpvIeHk7v5FqlbWtbNlw0xHpeiQIdiQCQWQO3yJ8TYS9IKQBJkamUrXKr077OG5oD
         saMGbrp6UIIfGKl9JPMKPBAVexzQc3AYxTHuLBCbGYdxlLLQxrT81rVSiBowIq8SnrfP
         4KKFgSUfs+CYyaaUSKpL88BBmDUSe+TpEnM4R7JcKWOoJg8RVXPrwqJELGMaFFxXHoD1
         DqIB2yHMOBba9ajoYU9Aizncu8Ame4Bloj2XlPSn2nTLa//50oMwrieLwWaRILAa+VtH
         yoZBRhmNm6oVobUdpCVrbJYtjMhBvFFtVBj7Ap22roE4Xu2TWQ3Jo9no61S3PhC+4+Hj
         zrxw==
X-Gm-Message-State: AOAM53067YbuFth+VwQqtSB3Be7tvCic+442rQ0RUU752pTsNXrGhtBD
	3glM9JanJ/pWxUlGvQ4yLPc=
X-Google-Smtp-Source: ABdhPJzB/ZvwmUPuyJOQJZTEa1ude65v0157OL5WppIrUuDHZEDuEWAgHF0Z4WIbT4E4IEtXtJaM5Q==
X-Received: by 2002:a05:6602:2431:: with SMTP id g17mr7982704iob.3.1591354112480;
        Fri, 05 Jun 2020 03:48:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:d28a:: with SMTP id p10ls2347131ilp.5.gmail; Fri, 05 Jun
 2020 03:48:31 -0700 (PDT)
X-Received: by 2002:a92:4a04:: with SMTP id m4mr8272193ilf.228.1591354111890;
        Fri, 05 Jun 2020 03:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591354111; cv=none;
        d=google.com; s=arc-20160816;
        b=gGws+X/PLznhTSXFUt+UiDh/Fp2WM5eraDJtRseTIpqRfUmr3GJC0+br/WcOYNrWVm
         WsSFRdydOZy6Gcvr5JvxkT3s7vZgxuK/nqMuRMaSTePBOT38MObM+Ax1n3R0HPm2XdS1
         s+C7xMfgS66wvSAq2fAdWbR4JDOMpQij3+Y2IPcwFz0PAWnlKjOkJ/pYGdZfXCQ3qARM
         CfIadgH0R/H28yzPcpSdl5744oM6Yu4erQtcBqw+T/NURELRGJJqF7HgLh4dbxPXBPYz
         YGCbwyofpnJmwFcW7qL79YIFKvYATa+a+NHkLji3LR7CKQShaFRbS69j30hUIbdiVT9r
         QqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=fQ/880Bd5h9c3vEhY640z2DYJCeeFBRFdve8oUhFKr0=;
        b=M2iMycFtOtmtegR7QuvnJWVhhSnXvUksLmfCPi3+FR4VTyDBt0EC4YSc4ulRJ5zxTk
         qmdjXaonal4ZluynSYBah/NWmIDU8fUFmDT8W0YFbvElaNNz1TkYJLVcQClb+u77ZdUm
         QLnTe44dOhurBIubbGbym/mL4AQKC8fRtoOrfE1TtLSGxrRv2uzME2nphWxTuksfYAIn
         H2ZQRSwbwgqmgla6qK+21kogxbuTwVRG6tPzQoUi/9Fr+eEGgbPoYBXd1VaTyZQlbvux
         8PprqoBv3uQqORZgluVtpJNaw7SBHIsLh8qY10ffAd/AMmORsZ5eD2ScS4s3VeBWeBCv
         f0Yg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dt8roGPu;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id h14si65316iol.1.2020.06.05.03.48.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jun 2020 03:48:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 055AmVw6095390;
	Fri, 5 Jun 2020 05:48:31 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 055AmVWZ113114;
	Fri, 5 Jun 2020 05:48:31 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Jun
 2020 05:48:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Jun 2020 05:48:31 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 055AmSG4094218;
	Fri, 5 Jun 2020 05:48:30 -0500
Subject: Re: [PATCH v1 0/5] arm64: k3-j721e config fixes
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>
References: <20200527122358.14723-1-nikhil.nd@ti.com>
 <2dff1677-1886-ec04-24a5-6fec518bc08c@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <e72392ba-8cb1-1030-8753-ff7b47724f11@ti.com>
Date: Fri, 5 Jun 2020 16:18:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2dff1677-1886-ec04-24a5-6fec518bc08c@siemens.com>
Content-Type: multipart/alternative;
	boundary="------------8B1C5DD1D82AF5B6EFF2CDCB"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=dt8roGPu;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

--------------8B1C5DD1D82AF5B6EFF2CDCB
Content-Type: text/plain; charset="UTF-8"; format=flowed



On 02/06/20 8:14 pm, Jan Kiszka wrote:
> On 27.05.20 14:23, nikhil.nd via Jailhouse wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> This series fixes few issues with the jailhouse cell
>> config files. It adds required memory regions for
>> fixing crashes due to accessing few devices.
>>
>> Also, remove some obsolete device partitioning
>> which is no longer supported in the 5.4 kernel.
>> We will add only when the drivers are upstreamed to
>> mainline kernel.
>>
>> Kishon Vijay Abraham I (1):
>>    configs: arm64: k3-j721e-linux: Add GIC ITS Mem region
>>
>> Nikhil Devshatwar (4):
>>    arm64: dts: k3-j721e-evm: Add pinmux for main_uart1
>>    configs: arm64: k3-j721e-linux: Add USB mem_regions
>>    configs: k3-j721e-evm-linux-demo: Remove unsupported device
>>      partitioning
>>    configs: arm64: k3-j721e-evm: Fix failure with PCIe
>>
>>   configs/arm64/dts/inmate-k3-j721e-evm.dts | 12 ++++
>>   configs/arm64/k3-j721e-evm-linux-demo.c   | 79 +++++------------------
>>   configs/arm64/k3-j721e-evm.c              | 32 +++++++--
>>   3 files changed, 53 insertions(+), 70 deletions(-)
>>
> I only had one comment back then on the last patch. But now the new
> config checker has some findings on the j721e as well. Please have a
> look and address them for v2 ideally.
>
How do I run config checker?

Regards,
Nikhil D

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e72392ba-8cb1-1030-8753-ff7b47724f11%40ti.com.

--------------8B1C5DD1D82AF5B6EFF2CDCB
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 02/06/20 8:14 pm, Jan Kiszka wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:2dff1677-1886-ec04-24a5-6fec518bc08c@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On 27.05.20 14:23, nikhil.nd v=
ia Jailhouse wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">From: Nikhil Devshatwar <a c=
lass=3D"moz-txt-link-rfc2396E" href=3D"mailto:nikhil.nd@ti.com">&lt;nikhil.=
nd@ti.com&gt;</a>

This series fixes few issues with the jailhouse cell
config files. It adds required memory regions for
fixing crashes due to accessing few devices.

Also, remove some obsolete device partitioning
which is no longer supported in the 5.4 kernel.
We will add only when the drivers are upstreamed to
mainline kernel.

Kishon Vijay Abraham I (1):
  configs: arm64: k3-j721e-linux: Add GIC ITS Mem region

Nikhil Devshatwar (4):
  arm64: dts: k3-j721e-evm: Add pinmux for main_uart1
  configs: arm64: k3-j721e-linux: Add USB mem_regions
  configs: k3-j721e-evm-linux-demo: Remove unsupported device
    partitioning
  configs: arm64: k3-j721e-evm: Fix failure with PCIe

 configs/arm64/dts/inmate-k3-j721e-evm.dts | 12 ++++
 configs/arm64/k3-j721e-evm-linux-demo.c   | 79 +++++------------------
 configs/arm64/k3-j721e-evm.c              | 32 +++++++--
 3 files changed, 53 insertions(+), 70 deletions(-)

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I only had one comment back then on the last patch. But now the new
config checker has some findings on the j721e as well. Please have a
look and address them for v2 ideally.

</pre>
    </blockquote>
    How do I run config checker?<br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <blockquote type=3D"cite"
      cite=3D"mid:2dff1677-1886-ec04-24a5-6fec518bc08c@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
    <br>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e72392ba-8cb1-1030-8753-ff7b47724f11%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/e72392ba-8cb1-1030-8753-ff7b47724f11%40ti.com</a>.<br />

--------------8B1C5DD1D82AF5B6EFF2CDCB--
