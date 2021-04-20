Return-Path: <jailhouse-dev+bncBCSPHTXQ2UMRB7U67KBQMGQE35H5IOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2F6365403
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 10:23:27 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id 91-20020adf92e40000b029010470a9ebc4sf9424687wrn.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 01:23:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618907007; cv=pass;
        d=google.com; s=arc-20160816;
        b=GfKFswAOSVxDjgzqXVN6EdhCosisi72A4V6KUQqevBk6uPU4J0FQSpb//rtcOexkfe
         ZQcHIrMDixLxh18GyuZiJ6SAAbNz4GjKf/sV6ooK0pN+sZOy99nXJLq23ezQ4oUt2hDt
         s7GOmj7QFNRnqTZP5BgxaDjtmiazLsf3YqJFLCrvok9OLHzd6KsJe79iKkXs04JnVTB+
         6NvNi+1YKlQKQGbp0vHC50V6B9NGUNr/qHvylAEgUTQ2ig0IglSDqGkj3d/K1KWUcvOX
         gHpEoUXTa7FObbCEpJoIA/pQcPsIbQiiz1aeDU8Fp0sHJjSQTrlBo0Ior/VyTf68aT0v
         0L9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=PfMqM2jzD4vlevHoEKZHFgI8YTQdsdnR31OEdMvPNUg=;
        b=ak2nyDGzMLAZgOwH4izLruBAHDzA5gYmWp4+oglvq+EuJYuB76OhfJ0ObGBy4PGesv
         TzJeewkP+O+ibdgXHeLhqA5MgWHM3QKX/CvZhr4xIazUqyclKn9eeRhWZjjHdg5Wodr9
         owU+X1qfM+NBoUMSpuVM3GD5BjcFN97FSuYf3PwuCNMrdhT7A+jrt4nrQn00xO2sAnqY
         PyOqcqGGg8q/lGeiGlFovnqlqpASlUCvASNBVtUKihs1lsl7F1f7hcuqLbqWYMEokvwo
         Sr7950sht8fxPjkCugFDrReOq9kLrpHxddeq6y8XVHWMmaybl3ceqw4cUDD0069CDz4F
         v3YQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MppTpfag;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::62d as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:in-reply-to:references:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PfMqM2jzD4vlevHoEKZHFgI8YTQdsdnR31OEdMvPNUg=;
        b=bt/XqOj2Y61eTMpbB0OLOsfu+hsU6xcmGmiUD6i/594ogHHCVpcvn7ZF2NwfwJZ+gr
         QsI4aKZ96LdU/I4kpNvCKXXteVfGJLJaiZZrvnDsvfCSq6DrA+wDdcHgZKEP95UxzIFf
         3yXaY+3syoUFY4v/7Tonw7T6TVLsSYB5fa0Q5DOk9Abk050MWcufPeqeLaNPoupLHmIK
         fxADyEg2NtPA5+/Xu9FgqagUmIhyvLNTXHwpWQXwZtOpaYeaYeQmXTAbKrWJoH/Zjema
         WLTf/X+cOSxYhJ63hwT4k4k2Yr7TQ9MZxyNFFN7gP1XaN7nvTryg6Pm5uW+w3tQc8HFy
         +aOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PfMqM2jzD4vlevHoEKZHFgI8YTQdsdnR31OEdMvPNUg=;
        b=DIsVMVd13mCLhED1W/xSN1C9UmrEWMGIB6wEmGG1kXRuKzbgVhoGnz6ye5sX2Y1F7X
         3c1VeTYlhtNVL1xpWNtJAcVKfQfvqNA9T1pLTJRSpQYaf5yG7Ws+l1pTLvrqt3QRVx9e
         P8ckBREGNvtthtmec9N8WX5WQuvMBGXKAF+QGObdlbqiAqH7779a7v2FvXS8wGxBCZ4H
         GyPQIvMRL1NZugKgg5uVmtxOfvmZZYKLmG0Jx9cwy1ueZX97z6JXA6xKuhG61g4cn9NX
         DwUH3e3duEGWJ6J8inrUmcxEMxwaRSI1rlHsh6+WoS+kYEPMl9s5SleIPc3ADRxnOTjC
         WauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:in-reply-to:references:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PfMqM2jzD4vlevHoEKZHFgI8YTQdsdnR31OEdMvPNUg=;
        b=pEH4+M0gxUrrx6Blbg2CTCdnRS5ukaGUh2iUo+//s9kRnJcn7wPMy8qcSTMn3xxEZM
         NIO4yWdf9Q/kpXKDHeZif9EaRc2PGyCktElg41QF18tvcMi6B5Thh1vl6lA5MZxPbWa7
         Es1xQQSTz9+CAekyBFn+omOcBHTHtm4Xg0EMXvQYbWXzBd7TXDMR7X8uiAsmAJNjA6qC
         Jm2tldspOip2imWP/sZmZuYxDN6AYJVQB7JSGYm8S0HK1OKVHR5vtOj0Pp2XSfn5Xhki
         Yw8K/3eoqQ82Aj91e4RdiiuEEskxs2X8oI9d+0IwFEvbO0zose6ymCaHm+02EFea6g72
         u/Vg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Uji+V9GNejGB5edBkGPAP6nJu0g+SLTdim9C70Ojzm736KYVi
	kCkqQSDwnzvnvNgJVVFmzFw=
X-Google-Smtp-Source: ABdhPJyCzKFv9lY4OwxC/BzBPQ/+imEi9D/HCBwNSWXV3WfkPhtx2iaHOSWRrDrow0o4Kt8chw3wew==
X-Received: by 2002:a7b:ca52:: with SMTP id m18mr3147287wml.155.1618907007170;
        Tue, 20 Apr 2021 01:23:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fb47:: with SMTP id c7ls11478900wrs.0.gmail; Tue, 20 Apr
 2021 01:23:26 -0700 (PDT)
X-Received: by 2002:adf:dbc2:: with SMTP id e2mr18026797wrj.398.1618907006052;
        Tue, 20 Apr 2021 01:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618907006; cv=none;
        d=google.com; s=arc-20160816;
        b=PnPLynt8fDmLCGqUbEc0/uB/zhRt164FiX+nwOC/I77vFtPo7IWlYLvt2p+di5Y/Ff
         QWfA2arJrnL0J9QcmiOyyOX8+74tVstf6iQL/t7bMrk1feoin1obytr7nLhcQcgy6s7e
         L4SchzbqagU12rF0oY9k3J+y6vdplI+D1Ii7hxtVcXob8+kfPdFrKb3iKZVoaJS+8uFI
         72R8YgOkgKRh3TYxDhQIRYtIxk062XTa56pUELRZiF/wnIgPoCX07f+yp83tZM4ZCeLS
         EFhnXlUpWXhcDSRgpOx1KZieBVls+Xa/2X16GEeauLxXJgb/eqtLSNS9O1G8ZTtTHnlx
         OrPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=GzXbwxJMHl7B8kbx0L7YfNans20QfKLvzTIZYEFeqJU=;
        b=pFxnu7adXdgDuHX/+DGbe1MluQ+36VXbN6BAF+cnfMIdfztvk/g+mLaUYSVGhy8Z6a
         NOkW2+ZfYfGGpQNG1dXx3JAhdkLvF+ETNE9nG4kVb0yMzKdxsTO1ycwY9bhdpqUSW5Sm
         YwINeURSrojct4O1jOSILKsljZ+uv1oPSNeoo+TeFOhy67j36B4JJub4IZpykqf6HEjN
         eSvnYbu+YeLPiWqM+7k6PK5304ADdTpkrzGUHwqFz/9h0Rd80Zxkqs+2wNAR5NkGMIkp
         ey1bmybKs7aXJ1VdDVUr7UGxWRrNKv3kGK88rddNO6qDOwfoV+u/kNz6fzVImLjcOufY
         dLOQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MppTpfag;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::62d as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com. [2a00:1450:4864:20::62d])
        by gmr-mx.google.com with ESMTPS id w2si501101wmb.4.2021.04.20.01.23.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 01:23:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::62d as permitted sender) client-ip=2a00:1450:4864:20::62d;
Received: by mail-ej1-x62d.google.com with SMTP id x12so36186372ejc.1
        for <jailhouse-dev@googlegroups.com>; Tue, 20 Apr 2021 01:23:26 -0700 (PDT)
X-Received: by 2002:a17:907:9691:: with SMTP id hd17mr26686413ejc.205.1618907005843;
 Tue, 20 Apr 2021 01:23:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:f48:0:0:0:0 with HTTP; Tue, 20 Apr 2021 01:23:25
 -0700 (PDT)
In-Reply-To: <b7e6ad49-db2c-bc78-b2c8-ecd182297cab@siemens.com>
References: <CADiTV-03GyURVJ2De-Fe5reAcvveWQq7JxAUTh2kES2DSbwcWA@mail.gmail.com>
 <DB6PR0402MB2760F544F58FFF3AB688F19688499@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <9234b1f8-0275-b438-a1f9-9c274dd74c04@siemens.com> <DB6PR0402MB2760A15B9F7D6B9864B8D67E88489@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <b7e6ad49-db2c-bc78-b2c8-ecd182297cab@siemens.com>
From: Angelo Ruocco <angelo.ruocco.90@gmail.com>
Date: Tue, 20 Apr 2021 10:23:25 +0200
Message-ID: <CADiTV-3sBJs3sqd1fyOV8tLamorCihJ+15mT07ZY-kREsNrBfQ@mail.gmail.com>
Subject: Re: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Peng Fan <peng.fan@nxp.com>, Jailhouse <jailhouse-dev@googlegroups.com>, 
	Marco Solieri <marco.solieri@unimore.it>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: angelo.ruocco.90@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=MppTpfag;       spf=pass
 (google.com: domain of angelo.ruocco.90@gmail.com designates
 2a00:1450:4864:20::62d as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

On 20/04/2021, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> On 20.04.21 02:56, Peng Fan wrote:
>>> Subject: Re: Arm zero exits and zynqmp ATF SDEI-enabling patch
>>> upstreaming
>>>
>>> On 19.04.21 15:28, Peng Fan wrote:
>>>>> Subject: Arm zero exits and zynqmp ATF SDEI-enabling patch
>>>>> upstreaming
>>>>
>>>> Not sure whether you are aware.
>>>> FYI: SDEI not work with OP-TEE for now.
>>>>
>>>
>>> Thanks for the info. None of the targets I played with - so far - had
>>> OP-TEE
>>> included. AT-F bug or a conceptual conflict?
>>
>> The design of SDEI not take TEE into consideration. SDEI requires secure
>> interrupts
>> taken into EL3, but op-tee requires non-secure FIQ taken into secure EL1.

This is new to me. I though that FIQs were could only be secure,
reason why they can only be used in EL3 and secure EL1.

If non-secure FIQs are an option we should be able to skip patching
the ATF altogether.


> Do you mean the implementation in TF-A? Or even the specification of the
> service??

My understanding of SDEI is that, even though the method of signaling
is not determined in theory, in practice they use FIQs, and then you
incur in the same problem we're trying to solve with IRQs that routed
to EL1 cannot be used in EL2: if you use FIQs as a signaling method
for SDEI in EL3, you cannot use FIQs in other exception levels, like
in secure EL1 OPTEEs.

> Jan
>
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux


-- 
Angelo

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CADiTV-3sBJs3sqd1fyOV8tLamorCihJ%2B15mT07ZY-kREsNrBfQ%40mail.gmail.com.
