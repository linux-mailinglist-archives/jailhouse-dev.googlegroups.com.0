Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMGETOAAMGQENI2ZQOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0F12FB671
	for <lists+jailhouse-dev@lfdr.de>; Tue, 19 Jan 2021 14:44:17 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id e5sf580369ljg.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 19 Jan 2021 05:44:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611063857; cv=pass;
        d=google.com; s=arc-20160816;
        b=nj1zK/ZX9tmiOLa4ICO2LlVLfeK2goRQatJQhfN/TTcb1S/TCPKcg7ea1KXQLaGX8l
         3lsiQtTlDVPR+LCLkcjHCyQFenGZPmie3Jd3hBA1N7zn8WHII17Bkc7l3o2zx9UBFuoL
         XCVxP6pTlBcw2Xh0pkdE40y4Vd6T3vELlC0BRZCUM/6tVbwYHJXSkxwnZUWdqXmizQW+
         KMNsQa0cRJgTxdSKEy05fWHK6Kwr9Ych3AcusjpJyrUMdiDDFybAjrEKi54mVBqSCxeS
         HGzPapMRixn+KPyW5td6DQo9zMGkhYrccR/zV4KUNFUyLFguIsxgk9VLl+hBAVLrenXG
         JSyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=hy6HPb9ycxkTZ10mWExo3GKVnEZ/sejB49SGAC5QKvQ=;
        b=WOurYVYvLeJ9EiigCcDnuMjT+PAIfkY29eBcWnKNx3m/DeHzlgzN5KcVRiLK25ha5n
         PHjf5883imjhNCR2VvLcQmmRvcIzy2EXcsw1kn1Yc8lbwRAN9hWATjc2kK3LNCid5NYo
         e/hG7GZCE9HpAhXWNLNLLQ1lWRzSzTckiTVuhcaLo8mgkWVl3cRFXpFLVW7SgDzNf6h3
         QcVhM6Hv0KtL90UZYxHqCAMuGGYQ3GLa1Tr4A7lWfUNrYbDOAvIwOG2PE7zgwHShDjW1
         DzeUlYgbsQf3z1TLUMgu/dZlNlZRm4eRfaZ1j4/Tq48Q3tdEr63z4hAVi/lmsPhDHBKz
         4b1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hy6HPb9ycxkTZ10mWExo3GKVnEZ/sejB49SGAC5QKvQ=;
        b=hZ/iucE2OaT8YsMyW7owpPITnoKvybvt5FaOoF6mxnj8adRnXRQ1agQWd6ZLuQnZqg
         1iQkjRzcwNCO4jiSI02qmYQAkSn5+ndj0yEMt59JPUJc6IGDsXivXxf1OjX+nJuGFbAo
         poJEnzrpTbBmMhKQE6zSO4/h+VK5UCkA4pV4b/bbSX0oTgfW1e1UjiZPpwZvmOIzz5n1
         FuAJixLfRtaxw8AOYBCFd8r3LHoWoyx16nJjVO4GccgYBKpXqGgPSNwGHKaNJzuzNJ3V
         4+344GbWxRyyvkuYdqAJGObROxdcNkf7gELKNrHZb+MxfEx5fMatmioT2rHEn8iJWUa3
         7x7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hy6HPb9ycxkTZ10mWExo3GKVnEZ/sejB49SGAC5QKvQ=;
        b=YGtlDbmEQ1AyMpotwTkHoJDKWGNn/TEm66VXmGRqB/3YyWssCPfgGus3tcyiBmR5/U
         irtteSK+6ve8YhBHVY+QaaPCswyBHBk4XJ3GvONMwbOk4syzayqqHwYgxFKvp+dj9RyZ
         guYCn3G5g4znZnG+63n3dL6cANVQnPT5Mf9SYBjNoZ59OTkCXk0MgoHdJFGSrR8XzBfc
         R6j0Xg7tXMHJZrbX4lPNtQ7HXNlKYgPsoFsCzpRY5DmW1Nw9x8GA1Gbez8gkZioH1u9k
         Tznuxs5X/7g7BwQ/PFett06qtvHEzYDGfxYHMS++ezaR1VnPVfFwrhR3N65VGf9v0yuH
         B7LQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530+u0NXbCHiV99VW8unWdbpiqZBH4PdB1NLy2aquaqui1UoXcWi
	Mhn94v1SukNnyFwjh61+42Y=
X-Google-Smtp-Source: ABdhPJxbO6vLTl7GprGcVFg2c72djJEWJ7OSDKkTKwx/jfe+LxqX5ikaMSe0bKVkjoVi4W3gVGdgxg==
X-Received: by 2002:a2e:b4af:: with SMTP id q15mr1965081ljm.507.1611063857124;
        Tue, 19 Jan 2021 05:44:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c1cd:: with SMTP id r196ls140598lff.1.gmail; Tue, 19 Jan
 2021 05:44:16 -0800 (PST)
X-Received: by 2002:a19:8210:: with SMTP id e16mr1728429lfd.69.1611063855956;
        Tue, 19 Jan 2021 05:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611063855; cv=none;
        d=google.com; s=arc-20160816;
        b=SHkvrthx9+fwxqYSoJuE88kCgV7lWVlTalbV7YZqpDTiwZ4cmpXutLA1XcOpdtoWZe
         3MBb7qO/9mrTzfw7UPZmphfCedLVUiufBK5f3grPSlyFxie59Cs/HU+YOAARV+Uha8vf
         MOiIwvZIz6RTqaSgHw3kgRRJ7PvAZRONxwLdqJ6wdyzzKT5PmYOMt2gU/OZSLYsEG+vs
         xQ5DuvlT1Ho6s6HEAx67jf3mrJHSxhv1xrAJ0unnsaEBwqtgi0p48aQGFxxA8xiZSFPo
         POl7R7WSEdxnCCpJyYjPNohf3WzPVv7LHBtP6zP7jPyqoEFPI3G0g3G0ova8KK+yMxSq
         zNFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ZxT9Di8KqIGd+1dhHh+jFZIED1U2t4/quvjoqLPNrxU=;
        b=VcGxq5fjGAQmUJ8kK8bSeZtrunB3GkT9mQOv5p+puZafMN++SKaxYQltWDIYZlT2Pi
         kxUUbe5k3dNlLYUfQ56lSnrkghLt8b42vMsnzXw2DBkAWDgeP/ZWSsGsouhKqS+1xYnB
         NaXRJeKsfjBuaNj5HJJjXdXY7++gLNE1/N5FPlVLEF3OTxXliG9kHN7jeZ9s7kEkOlLd
         rGhJ9TYUDWLyAzeH6Bu9l4uQiqNEW4r/pVMOv7GjQK1wHc2TNYHC5qgtHPjyX5J46E4z
         Q5VeaQs3wpWnGtrENOmFeD0H4Ib6TfJq+bRJyJBwQ4j/xCdnAEn3+0w1PfsTJK5udg+O
         IL7w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id r26si987605lfe.8.2021.01.19.05.44.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2021 05:44:15 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 10JDiErx013452
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 Jan 2021 14:44:14 +0100
Received: from [167.87.30.207] ([167.87.30.207])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 10JDiDhM000867;
	Tue, 19 Jan 2021 14:44:14 +0100
Subject: Re: IVSHMEM between 2 VMs
To: Luca Belluardo <luca.bellu95@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <3583efdb-f9b6-469a-9eb3-bfce0c4116b9n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7b09cf8c-26f0-5c5c-b780-6a3d4e6548f6@siemens.com>
Date: Tue, 19 Jan 2021 14:44:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <3583efdb-f9b6-469a-9eb3-bfce0c4116b9n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 19.01.21 11:06, Luca Belluardo wrote:
> I'm new in hypervisor and in Jailhouse. I read some articles and the
> documentation and I have seen that it is possible create a shared memory
> between 2 virtual machines on Jailhouse.
> But I don't understand some things. Can someone help me to write a
> sample code for my case? I have to shared a struct like this below
> between 2 VMs
> struct my_struct{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex mtx,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool has_msg,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0type msg
> }.
> If it is possible I want a sample code with some comment for my case, so
> I go alone in the development of the communication.
> The mutex is necessary or the mutual exclusion is granted by Jailhouse?
>=20

You may want to study [1] and possibly [2] for applications using
ivshmem "directly". You will get shared memory this way and signalling,
but no higher abstraction than that (like a mutex would be).

Jan

[1]
https://github.com/siemens/jailhouse/blob/master/tools/demos/ivshmem-demo.c
[2]
https://github.com/siemens/jailhouse/blob/master/inmates/demos/ivshmem-demo=
.c

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7b09cf8c-26f0-5c5c-b780-6a3d4e6548f6%40siemens.com.
