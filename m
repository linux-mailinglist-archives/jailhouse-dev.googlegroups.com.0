Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB6PSQDVAKGQEGAKBFVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53c.google.com (mail-pg1-x53c.google.com [IPv6:2607:f8b0:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0627A897
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 14:35:06 +0200 (CEST)
Received: by mail-pg1-x53c.google.com with SMTP id a21sf33582299pgv.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 05:35:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564490105; cv=pass;
        d=google.com; s=arc-20160816;
        b=MirOGn/P/Vh2L6YIq3WdllBPc30DeU6AaZLYFOkAewaA0KZ8VJHgp403Wt7y1zzLfd
         umQ5EpP7ZQE9TuA62a03YanaMqnHHnUh9MkbLldA9I0mS0NDmfWnbK74m78F1lMsNAk6
         LOChWafWqxavVBk/l3y6bVUf0hL8oUK8x4Sa26Ykgnx7ylfHQ2eXJKm1zYae2ZFfRQt6
         LagWQHqMvSocIhpYgegbZha0aH09OD2rBplgGuCNaFudN+rMwc6RUgnscKTeZJdk0qXW
         9B82rUSF7TS0a1MGtJtosXZYOLZorp3CEnnXpkTUh+2yyqTVllskNzYuqQEqcLuGEHZv
         XIJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=OevkuYRCPnZ9eUme2Oeklh6BMQnzbVTpo/pJhgxtnXg=;
        b=alo23UNhlnU0OqNN5whgCHmkbJGvCHC54XSHiX8vWacka4FAV/hJbkuZvDxGOhuMNv
         cs1RTaKRCms+21xO/nFnkNRNVmKkG/4fr/q5NQTIt7I1tiRMVi4XN026P/ziKqGwxwOV
         bOPrauGK0rDjUMkqYK1gA4W/flnSw/BpTHnGfz7U+taKbuZDTwWvwHoxcu+mL6KCvobF
         cGTvz6u30UslhfUwrIqkzMHuic5u2bIKXcp0rXACkCGdDPq6vWNXe+qeTs5vBMLQmYAa
         kCJBt5NbNgIK3xlkYq5rKJar3Qx9z3xqk+kR3dDaGn/y7aL0apT5/PiLUzKMKzfyVhFU
         kVPQ==
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
        bh=OevkuYRCPnZ9eUme2Oeklh6BMQnzbVTpo/pJhgxtnXg=;
        b=M81oe+VWv3ZiybucCZtKPyddtcjTIxj5nI3FvuAEElgwx1eW3NLmMxxPCmH8RVZc1C
         p688PaVBGwYSDlXb8+AVzWPoZM+HiVjyZKmBbR4af6mm2E8dUJeOUPPXIvLcDUU3/KJi
         wcbyu8NJ4rZWAH324Z7BE2s5GkdExic3VwLHREdMZ6dmarNdbbyxwvwo36kF9MauROUW
         wK8dro9go+VapsJTV/yjpDHZeUsuPzKZGMqzsxmKTEtDUgpjFrDlBkPEk1C2C7Dgbu8y
         6VKiUVDIlM6Z4/3xbqWd4erQyynsQweGncq53eDZ50AXsadHlDg/3BYVdtxLa/hEoK1n
         TaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OevkuYRCPnZ9eUme2Oeklh6BMQnzbVTpo/pJhgxtnXg=;
        b=PnA6XgzK4w8x/6WFnsgzxmGPY5uCbplsORvzmNOR0ZuY9OBwDwWPGvT6mfnymgyKgI
         tHkYspg+hsTdnXhKsUEPMYzaLqYQKxyub1RILH3z5JAaN2jNkpK9iXRZlDMMJyzIA90M
         e1zfEFS8u3vFIL3dSrgwKtAkrakgp3gf7qlJkP9yrj0qvRjzeq+r+TGTM6623nUVXK/F
         g8+YeAVf3Lalz4MwYOv1BCiYmWpcdklhAXumeuXSEazrh/pUV5kM6sZJmltCXi+Icdav
         Xk6s9ARl4jnCHRLYd6xUkIoy/hTvEe1FF1Tj2GgT82uf/jrXCmIbbEplpK5J8OGXa5x/
         j4jQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW04Pj3llvsJZb78au7PInxUgmu43Dd3lY5r7W+ciXwhMpDKFtE
	+uTfv8xXgT+TVkmwsrQj5q4=
X-Google-Smtp-Source: APXvYqybzo0fuz/dQGbDOsLvTZAROVMwgw6jHyXAAOlRdOOvU3uczdQzProRdCKU+uoEaeAvw8Y5gQ==
X-Received: by 2002:a62:e301:: with SMTP id g1mr39912860pfh.119.1564490105303;
        Tue, 30 Jul 2019 05:35:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:34e:: with SMTP id 75ls11666141pgd.11.gmail; Tue, 30 Jul
 2019 05:35:04 -0700 (PDT)
X-Received: by 2002:a63:c118:: with SMTP id w24mr107168983pgf.347.1564490104789;
        Tue, 30 Jul 2019 05:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564490104; cv=none;
        d=google.com; s=arc-20160816;
        b=xzIykMGw6vv5qFNV8U2G2Ylhg+FVvFDDFlzLmPZXqrzqkZxl8AFoEhWJYn9NVMuk++
         BUIlhjz5VpmNacYl5KsrBajXw7NS88atFJMOQ6O4e+aCbIA6tsXpfGXicnaPnzp5PuoC
         vno1HivqGoGmMRwSUqGZVWMUEJKwBRkCFFzkQpErVk+ZyPSnTBQ2WjDwZU0QL4poBzg/
         FqTf3HSiT4q+WoWk7OyCNivEKvyAj182L6il6aYuI+UBwrHmvnyxJwpw3xfBc1ji6eGn
         r1eziwh4+mQSd9W6wLcEW+VHLIS8xAlITHHAVz0Qwh1g67F28HXG31X0Co0RmagcckSG
         qOmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=6ut9TkCfoh/UL5qOMhbgE6HD5tvdTPQZXTLVpM7GnLI=;
        b=Mywz5JKwhx0AP8koj/6F99+neFV4lGZHSZzsbojDNc3s62mAlGLd2p/LKuGAof/qVA
         lWnyp2vc9srHP9n0THRTLCHlrFr5QsNZc5/lXHtfd1pkqZholiXR2IIOYd1W59k78xVf
         nW2ak1R3eW5bb4fdvFMhqjwbP9v+PEPt3VxtlU020JyBW8bJm06pyvnjDKDHEIAe4FU8
         0rrzjj6jmBaeaeom34O/09KZArhkZsaIoEucLwUO1iGzZ6MZQQ/k0m9xrpvVgapsVDhW
         H7T9kSDUo9nEBknSQoN4hNLFRcMNZH6hyFCBJu2Ou2IG4NTs1E3YZ5uim2N/ZUqcxamT
         sDIg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id s60si2425207pjc.2.2019.07.30.05.35.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 05:35:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x6UCZ2s2025446
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jul 2019 14:35:02 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6UCZ1s5024064;
	Tue, 30 Jul 2019 14:35:01 +0200
Subject: Re: [Starter Question]Creating a new cell may fail?
To: Yanqiang Liu <oai@sjtu.edu.cn>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <2236da95-491a-4520-b604-6da78afefa2f@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7e153747-b00b-d362-ccf8-253517da053a@siemens.com>
Date: Tue, 30 Jul 2019 14:35:01 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <2236da95-491a-4520-b604-6da78afefa2f@googlegroups.com>
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

On 30.07.19 12:41, Yanqiang Liu wrote:
> Hi all,
> I am a starter to Jailhouse, and I have been reading the code. The issue =
I have
> noticed in the code is that when I am creating a new cell while the proce=
ss is
> on the CPU that will be reassigned, I will fail.=C2=A0
> This failure seems to occur again and again if I am unlucky. Is it true?=
=C2=A0 Or
> have I missed something?

Do you mean something like this:

taskset -c 2 jailhouse cell create config-which-uses-cpu2.cell

That is resolved by the driver module. It ensures that CPU 2 is taken offli=
ne
before the request is forwarded to the hypervisor. If that would not happen=
, not
only the jailhouse process would fail.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7e153747-b00b-d362-ccf8-253517da053a%40siemens.com.
