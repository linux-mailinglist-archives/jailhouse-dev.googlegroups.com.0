Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJ7J676QKGQEGIP5UBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 073992C38EC
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Nov 2020 07:07:36 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id a14sf422946lfo.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Nov 2020 22:07:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606284455; cv=pass;
        d=google.com; s=arc-20160816;
        b=ooF3TPxKOb/PlLrTrkyPWZuM7DuRrX4/i8kp4bRFcMiYa5P4P/mMbw7g1p5Qr9V0G2
         tp3y3aBR4uDXf7Q41vqHtzNpJ993M01CyjcV8gpBqOYw/itlOahtFa1L5SzT6HYwL5TU
         9GHBt2dax+xTpS15FxtMB0akNoeKrEvdIcIYvGAAiqo7Yjp+I0aaeF69YUHXoDI/hadd
         W1fZivi+S0FzHfboHZ4n7IIIaxpwIUALSrNnvWbkUMAI+s7pJTQQQbZwuZHRXpCFxaTy
         Kc9u9gFYylo3iutb3c+/uNqs6Lr0Az58hoKHW7I0YrnA7Rde7J91r4QrsghfYZBYwSKQ
         SgnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=FOHiRfSPvzhOLD4QjBpqhyXd2vYUxBuHj1OJrs4Q3Zs=;
        b=vG0OQELrfdxaJnqvbykZvttR10TCppLWz1lBwYEFotFv1iB+wFer0lgcDJY+3Czpqy
         27Z5hHEy2/OKOWqzmWbxnukn1EaoW63xnCps68tl0CkMj8mC2fi8NpeMpVO/bnOndbE1
         IKiGyIme8rJ4GBCOx9wHjCBzacav7t0zoD6GSMP0ycT/v9cpNPF11OpoQSgtclN6iVAb
         72nseRYdukc/CjtSS21h6GLa6x/0/F7sI3Unytkcyud9hl65pfj0tWZCXCCIkh8otZil
         TRdXk4+p6FOYShc5+srDYAgY6/7x6qqJwGEY8+g+07Cj5fRx0UQpe0jglbynNXKGsH1V
         SatQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FOHiRfSPvzhOLD4QjBpqhyXd2vYUxBuHj1OJrs4Q3Zs=;
        b=a9xnf97svy0dTzE90j2GFOs3+i2MuqcIK9G/PQXtMWDelIVBnE9O1a2ogDaQdi+TtH
         73P6N70slfZ+zsdD4bKUoTTz0GgUr+JcyW+oJGtL0j4t1wBkjLPfSLbTApMO9BDUyo3n
         UW7DFttaPgTbd+hO6n92BLAuw99wkkm7lvV8UWZAacwMluFLAp/LKYAhoI2MWVYEmmvO
         N7bnruznlWCwMPdjwIqop0gsmqa7ABTBF6KyN3fhI2QWqsW4DJ3v4YyTITri04yyTIaz
         UwK1G9Qs8qTNL37NDLlCiWefJUFDHqg/zXmXlbNY0a8Lf2QYqcq764fUr79IyXz+b/tO
         vUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=FOHiRfSPvzhOLD4QjBpqhyXd2vYUxBuHj1OJrs4Q3Zs=;
        b=SybEe1CO788WQA4KU3SZPAzfajjRuR9BhSttuFFNbVE7VSfuCbVBcFyKSIGBBWOiUa
         iEvsOfxUIl8nyZjmxKYQFqIY6kwZ8/kHmPCb1kOi7+LAYWa7mnzpmmorUeoWp8ZHKrgM
         cSlh1xqF9ORhpwa2PjMIzHpxnY9tglNhONRLZkPIKqHt//A9qtzGQ4/uZGIH0NGAfMBr
         1P7HioQI128H5Pya3Y40Dr24ugRc88H2e9kh4yhDd04yT/VCIe9ULaOhmNuAmXIGsr33
         yggI9r9P84z7NMsd9zJxkTw7Iw/YhXSYUzBPgUgFtKfJTTdzrWetTgivZe1xFjybD5N+
         Ftjg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5316wqLQBSogNMvqTNMpYoO4TZZTS8CwX7QEYpdBn9uqO6GK24U8
	qLy5KgoAwt+aws93CxYMC04=
X-Google-Smtp-Source: ABdhPJx7SAeEPO8FkTYRAFdOnU5rEqihE5zpAbFaHXr3olryYYSGulPZw5Kgh1lBHAc7xHN0Tzy8Ag==
X-Received: by 2002:a19:7f47:: with SMTP id a68mr630739lfd.317.1606284455541;
        Tue, 24 Nov 2020 22:07:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:2ac6:: with SMTP id q189ls205638ljq.9.gmail; Tue, 24 Nov
 2020 22:07:34 -0800 (PST)
X-Received: by 2002:a2e:808a:: with SMTP id i10mr135670ljg.123.1606284454219;
        Tue, 24 Nov 2020 22:07:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606284454; cv=none;
        d=google.com; s=arc-20160816;
        b=lWuVnD3PnTF36Y44J2E0lW1SlFpud9OAsGwUoWKtuSUjlidKuVbRUest6DK+ZjJdFZ
         j0cJrOL6UrFlsFDftEtCMMao6bG/2wvdEfxVV0w86Rm8VsHaBL03WybyyKRn4GJoEYPY
         Arl/4SfRuBiQziE+Dz/iO1DozZIQVzXI7fun1rzmFOyeK+pfCRGb/sIXm/rzAuJy5QE7
         Vy7dmHq5yqiDYqwDhlPe6hjTvq06IbwJZdvuU/rxD2UBKxUUUYLi7hvaNgzLQv9Ez9T9
         DpJgQF4MxklLmItMniv5eKEBUPxmxe6w+FwocuBNtvIA+TS2yq89WQNuKZdVvAnomBK9
         MsWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=t5KGkEwY9Nyq1B59ctMr6+W7S6B2IuOZX/OO6YRhaAw=;
        b=IFT/GpivJbgOBQXVR+fNtgSv8bgrLXXD/1ziINQVhqGcM5wDiIkW6vdxb9KjeiOg52
         KuJ5cqh5S4cCD+KKmqp2N8JFDXkg2xGHPazGivEgVIyDXcUjZ06heylcVGtgxPmbwQeb
         uUDK+XL71CRH/jusE9CkHjiVUkm30kkMAvPKMzcK2QzHXWgym2uCboQT6UjNYSbDtcoD
         sfMQEqZYVF9tmqaHFzc5p3f32wK2+hsxEK6/JnXupoSvyuCwjGEsRpkrVAj87tum3I3w
         Qb1PExVsSHmXEE81Oeh+VchFST7GFVxmFsMWuaYHydUs+hT/d2ypmTjgTFX6vLiSOQFa
         xa0g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id m18si33361lfr.11.2020.11.24.22.07.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2020 22:07:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0AP67Q0F022938
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Nov 2020 07:07:26 +0100
Received: from [167.87.38.29] ([167.87.38.29])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AP67O0W027508;
	Wed, 25 Nov 2020 07:07:24 +0100
Subject: Re: [PATCH 01/14] arm-common: bitops: add most-significant-bit
 operation
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
 <20201123204613.252563-2-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8f2b8fa9-a695-a845-b02f-98e22180b4ae@siemens.com>
Date: Wed, 25 Nov 2020 07:07:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201123204613.252563-2-andrea.bastoni@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 23.11.20 21:46, Andrea Bastoni wrote:
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/arch/arm-common/include/asm/bitops.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/hypervisor/arch/arm-common/include/asm/bitops.h b/hypervisor/arch/arm-common/include/asm/bitops.h
> index 808c9a0f..a726862f 100644
> --- a/hypervisor/arch/arm-common/include/asm/bitops.h
> +++ b/hypervisor/arch/arm-common/include/asm/bitops.h
> @@ -31,6 +31,7 @@ static inline unsigned long clz(unsigned long word)
>  /* Returns the position of the least significant 1, MSB=31, LSB=0*/
>  static inline unsigned long ffsl(unsigned long word)
>  {
> +	// FIXME: the ffsl on x86 isn't robust.

Can you elaborate?

>  	if (!word)
>  		return 0;
>  	asm volatile ("rbit %0, %0" : "+r" (word));
> @@ -41,3 +42,12 @@ static inline unsigned long ffzl(unsigned long word)
>  {
>  	return ffsl(~word);
>  }
> +
> +static inline unsigned long msbl(unsigned long word)
> +{
> +#if BITS_PER_LONG == 64
> +	return 63 - clz(word);
> +#else
> +	return 32 - clz(word);
> +#endif
> +}
> 

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8f2b8fa9-a695-a845-b02f-98e22180b4ae%40siemens.com.
