Return-Path: <jailhouse-dev+bncBC7PRA4F6QFBBKUOTCPQMGQE5JGYURA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3e.google.com (mail-io1-xd3e.google.com [IPv6:2607:f8b0:4864:20::d3e])
	by mail.lfdr.de (Postfix) with ESMTPS id A251C691A77
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Feb 2023 09:58:20 +0100 (CET)
Received: by mail-io1-xd3e.google.com with SMTP id x12-20020a5d990c000000b00707d2f838acsf3066526iol.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Feb 2023 00:58:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1676019499; cv=pass;
        d=google.com; s=arc-20160816;
        b=iVBAE/AHiML38FOyfasFAx1C9q57Wovu3NnoSkjgcocclKO6FErKovPVkJNg8IN+PC
         S0ZjZdoQvr8G+IbBl1hxpK9sffp9MRr75XvaLbsFS3dpNpDmh+rDumcbsiGQ0kSG7zZQ
         s1p2tr2lILyN1dgItTm864SH4nfrtIqNKhDqQhJxqoMmRJmDLZCaS2lNtJ518O8U5zbd
         3OXtIpfS/lT/9Z38HoA8az19MlwF/+O4zPpcB2g1Lidk0ZsJ2n4CY7rV4hP0V+A8fVNS
         tl1I1S23USjatp4xxpJ0qTLk562f5JLeN/xTzQVkDV3ft0wT6W2D3mbXQn0Tr52PKRtA
         fKfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:cc:date:message-id:subject
         :mime-version:from:sender:dkim-signature:dkim-signature;
        bh=49YezF3Ux8ja9AuZ6Kfpaaj2Dt5XRvYa74WGTJ4cAHY=;
        b=C1XY1JftFZh/x6vztyJWN5xy4BwK/Gk6rCoFJE2ae96dKH9n+WsCV2XbqZOoXRFQdJ
         u2G+YBgM787q93/qUK85V9FoQ48k2uxwgrnJxxdEtbjNF3kxk5eSMxHEZGsR9BmBocPi
         vY5mStiBYNp+/OnpbkWYnzhyMWf0FmA92voR8he8aoOeVjXfYONrTZDlnYvCZUEGOIsd
         QAyhComngZpz86f4isQ1aQuomh9tgUR2ZV+NrqCgMpBtjaCfR9bPqdiD3BFKnJTDGLzd
         7ol6S+97t8vWvOXpm0CKTxEi9tOw0BKG+tiLUP8tkdyhXTlV4U7aZQ3Cv+fQ6Q9rDpPX
         khyw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZHJa6L8U;
       spf=pass (google.com: domain of chenzhou1023cz@gmail.com designates 2607:f8b0:4864:20::1036 as permitted sender) smtp.mailfrom=chenzhou1023cz@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:cc:date:message-id:subject:mime-version:from
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=49YezF3Ux8ja9AuZ6Kfpaaj2Dt5XRvYa74WGTJ4cAHY=;
        b=Mfb5ktVtoibOjd0RkiPUbXwZa7MQqh7uYkhjt+f2xnxSwAkk3fVeGLkq5/qGhN80Su
         Zf84JqF//0w+84iXV8jFS9dP00ueOndANL0zI8d7357o0T+zr6gA/FiwKCTk/mllV6LZ
         cvq2zhBOIOfrE444Tw6Nzz3YPZTpzkW6ulBgHz7d+eATrAP4ZmVwZYTMC5b+S496N0d2
         X+WdAfMPR42TTcw6GtqqVUW6MlHHwC5EG1ujn4zSwuI3DlqLv17IUEwQXi5v9/ff6ec3
         wWNtrljk1rk0WAq87tiYF2/nAfVfXmWZ9VT6HVwkJaJV8fQFZox1f2HBwrnGKRkEcwVa
         ZLBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:cc:date:message-id:subject:mime-version:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=49YezF3Ux8ja9AuZ6Kfpaaj2Dt5XRvYa74WGTJ4cAHY=;
        b=Gwg3gTakFes53Cjbco/BNOCdDG5VFNdN+7CGmjDVTT6KNNqmEWuSNluIQEPyBcRNAw
         bpJMDDkF+8y9K5GHts8WRi1KkC7kZyly9tJ99AzGKIle/8VmLNuCgLyUdB5BVD4QbSGJ
         sWf3PMEM2HZ6Bo/upbgPYy+W0j4VHWcf+8qv3VXNMfscMm/5I/2BU/2Bj+KePHXbGyzY
         BqeaBZ/2Heb3butR3c/o+5y4SoILcoduF39z6q85qlfMCoBePQShmrWQuYIOU8hTYWR3
         fhPyCYMFo5GPO2iFNvLlAnomWflCsI4vag8VH1+AjRGeviVtpwMuCFcSbDqHxQ9lQnxM
         m0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:cc:date
         :message-id:subject:mime-version:from:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=49YezF3Ux8ja9AuZ6Kfpaaj2Dt5XRvYa74WGTJ4cAHY=;
        b=P6dq7ilOPjOAMTCK1Psi9mieajkIOsSkGtX0R9Jk5xQOsQrm4jsJMW8XXuakE+0yD/
         5cHppTTpbMXi/HbfTqlVEegkdTEq7DhXaUJ34esSJzv9Y3yXzujB7adCsZeKHxdXAekJ
         mxXy5zZgk7Itthq3QRxzR9+91CdrImaSmiHXgUe3/C4E2Cyio0M0aAKbGO9SoAwPkM2i
         jVdsQZDdFtrRdc9d5J74L+MdbSJxGXdTVl1zc89aaLzSb7X5J+YfkDn0T70uBOKXQtAV
         bHzc8j2yFEOIQIi3DUxaX1sZssh5u9+0Yz+qFoWhpS9iUsqSn2SsWI3PuKGkTZ7q6G24
         pAMg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKUK2B3nGaDiLkKHEC7dDdRQnRijW5Y1QhZEftBCqlYUxLG8Y48j
	l36z4Rg1f/ptuVT2dPkiPjc=
X-Google-Smtp-Source: AK7set8gc0o73upJPjVqPrwhLnijTbWI0DiLWTbtLJjevF0Yz2IFWV73x2js/VYpV5572gcAFb/tjg==
X-Received: by 2002:a6b:c303:0:b0:71a:b7de:6e1c with SMTP id t3-20020a6bc303000000b0071ab7de6e1cmr8065330iof.87.1676019499146;
        Fri, 10 Feb 2023 00:58:19 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:6c11:0:b0:314:10d2:cf32 with SMTP id h17-20020a926c11000000b0031410d2cf32ls998760ilc.7.-pod-prod-gmail;
 Fri, 10 Feb 2023 00:58:18 -0800 (PST)
X-Received: by 2002:a05:6e02:214e:b0:314:fa6:323c with SMTP id d14-20020a056e02214e00b003140fa6323cmr4079719ilv.12.1676019498199;
        Fri, 10 Feb 2023 00:58:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676019498; cv=none;
        d=google.com; s=arc-20160816;
        b=C3Q+JaEnA+3W1dvLzx/JxH9L12grqnlSzTIOhugpB00XTrxlqdAMfeYAbeEjHs2NLt
         c6JoSLFHHE+RN901MiEv6PqqcxSDJsnD7lej5Xndhpi3RLFv9FmCMnMEEnt117Z9cdr6
         dpUZgEGWSgB8ln1o9RJBCowYdFlIZ99y5eP0ZaBiNpVOfxCc2IXC+1wgnWfbnMz6nWKX
         odf6ZfQJiULoDC0322ljWz3qsRnl/bdrmkmVPsjckQ7Hm4uAR1d+EWYIVgX0JZAx3y2I
         +bFGYY9z7UsF+yEZh+K1yh0nW/Tw2Ayv2fV73TdRikExYClPLCcXiIrob4VryZ//1vLy
         YIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:cc:date:message-id:subject:mime-version:from:dkim-signature;
        bh=IbjnB85sbP0/EsCstCV5Q+SF4EVWzVh6K5RaErFLeT0=;
        b=t6oX17ytw5c8j+dc+A82v8k6wvXrWq2IptIflzS4TxW11EstxSZg7kxZJfBfHgWHJr
         zYf76qBEpD9tnmZ/4NqTJ9YmiGkEiBitkNv18gWZskpYV+Ztb2fEa4PauXMTfINmZOP7
         FtKZlBVZgc+Y9+ZS4fW/bxMpqZ6i7kmwqzjrReNOjF0kXHvlMFyqNATAJ2m4bQCTybCr
         pBC0PiHVFSt1DIQinSVTyWOf30g6lAsWpZGsYGOWJzzM6tjrscu1QD//S+B/07ybb6wO
         6k6QonxeHtkU0/r2eSO7Sr9IMbj9qW52H8y76bSrCDDKEVRmhiXIqSqqvphiYpqLyhfp
         kOVA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZHJa6L8U;
       spf=pass (google.com: domain of chenzhou1023cz@gmail.com designates 2607:f8b0:4864:20::1036 as permitted sender) smtp.mailfrom=chenzhou1023cz@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com. [2607:f8b0:4864:20::1036])
        by gmr-mx.google.com with ESMTPS id y8-20020a05663824c800b003b8b7635cb2si502929jat.0.2023.02.10.00.58.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 00:58:18 -0800 (PST)
Received-SPF: pass (google.com: domain of chenzhou1023cz@gmail.com designates 2607:f8b0:4864:20::1036 as permitted sender) client-ip=2607:f8b0:4864:20::1036;
Received: by mail-pj1-x1036.google.com with SMTP id o13so4593833pjg.2
        for <jailhouse-dev@googlegroups.com>; Fri, 10 Feb 2023 00:58:18 -0800 (PST)
X-Received: by 2002:a05:6a21:328b:b0:be:ea27:3c16 with SMTP id yt11-20020a056a21328b00b000beea273c16mr16250813pzb.35.1676019497441;
        Fri, 10 Feb 2023 00:58:17 -0800 (PST)
Received: from smtpclient.apple ([47.254.32.37])
        by smtp.gmail.com with ESMTPSA id n19-20020a62e513000000b005a852450b14sm2794603pff.183.2023.02.10.00.58.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Feb 2023 00:58:17 -0800 (PST)
From: Zhou Chen <chenzhou1023cz@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_5FD52AF8-A0F3-4429-B7EC-F9FF50FCEB97"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: [Question] About ioremap_page_range force nx in linux 5.15
Message-Id: <EC427149-B188-453F-8DA3-D28B76A8316A@gmail.com>
Date: Fri, 10 Feb 2023 16:58:11 +0800
Cc: jailhouse-dev@googlegroups.com
To: Jan Kiszka <jan.kiszka@web.de>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Original-Sender: chenzhou1023cz@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=ZHJa6L8U;       spf=pass
 (google.com: domain of chenzhou1023cz@gmail.com designates
 2607:f8b0:4864:20::1036 as permitted sender) smtp.mailfrom=chenzhou1023cz@gmail.com;
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


--Apple-Mail=_5FD52AF8-A0F3-4429-B7EC-F9FF50FCEB97
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

I met the "ioremap_page_range force nx" issue[1] when i run jailhouse with the latest kernel.
Any more ideas or updates about the option that use a different mapping mechanism or a
different page source to permit executable mappings you referenced?

[1] https://groups.google.com/g/jailhouse-dev/c/fhLERa0huX0 <https://groups.google.com/g/jailhouse-dev/c/fhLERa0huX0>
Thanks,
Chen Zhou

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/EC427149-B188-453F-8DA3-D28B76A8316A%40gmail.com.

--Apple-Mail=_5FD52AF8-A0F3-4429-B7EC-F9FF50FCEB97
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dus-ascii"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode=
: space; line-break: after-white-space;" class=3D""><!--text_ne_inode_%7B%2=
2type%22%3A%22fragment%22%2C%22name%22%3A%22%23fragment%22%2C%22children%22=
%3A%5B%7B%22type%22%3A%22element%22%2C%22id%22%3A%22u09861693%22%2C%22name%=
22%3A%22p%22%2C%22attrs%22%3A%7B%7D%2C%22children%22%3A%5B%7B%22type%22%3A%=
22text%22%2C%22id%22%3A%22u9380a497%22%2C%22name%22%3A%22%23text%22%2C%22at=
trs%22%3A%7B%22fontsize%22%3A12%7D%2C%22data%22%3A%22%5BQuestion%5D%20About=
%20%22%7D%2C%7B%22type%22%3A%22text%22%2C%22id%22%3A%22u5048bcec%22%2C%22na=
me%22%3A%22%23text%22%2C%22attrs%22%3A%7B%7D%2C%22data%22%3A%22ioremap_page=
_range%20force%20nx%20in%20linux%205.15%22%7D%5D%7D%2C%7B%22type%22%3A%22el=
ement%22%2C%22id%22%3A%22ua426abdb%22%2C%22name%22%3A%22p%22%2C%22attrs%22%=
3A%7B%7D%2C%22children%22%3A%5B%7B%22type%22%3A%22text%22%2C%22id%22%3A%22u=
eabc7842%22%2C%22name%22%3A%22%23text%22%2C%22attrs%22%3A%7B%7D%2C%22data%2=
2%3A%22Hi%20%22%7D%2C%7B%22type%22%3A%22text%22%2C%22id%22%3A%22ua316cec9%2=
2%2C%22name%22%3A%22%23text%22%2C%22attrs%22%3A%7B%22color%22%3A%22rgb(0%2C=
%200%2C%200)%22%2C%22fontsize%22%3A12%7D%2C%22data%22%3A%22Jan%2C%22%7D%5D%=
7D%2C%7B%22type%22%3A%22element%22%2C%22id%22%3A%22ud4ad9fa9%22%2C%22name%2=
2%3A%22p%22%2C%22attrs%22%3A%7B%7D%2C%22children%22%3A%5B%7B%22type%22%3A%2=
2text%22%2C%22id%22%3A%22u2e4ff8d2%22%2C%22name%22%3A%22%23text%22%2C%22att=
rs%22%3A%7B%22fontsize%22%3A12%7D%2C%22data%22%3A%22I%20also%20met%20the%20=
%5C%22%22%7D%2C%7B%22type%22%3A%22text%22%2C%22id%22%3A%22ud2e073bc%22%2C%2=
2name%22%3A%22%23text%22%2C%22attrs%22%3A%7B%7D%2C%22data%22%3A%22ioremap_p=
age_range%20force%20nx%5C%22%22%7D%2C%7B%22type%22%3A%22text%22%2C%22id%22%=
3A%22ufce5ea01%22%2C%22name%22%3A%22%23text%22%2C%22attrs%22%3A%7B%22fontsi=
ze%22%3A12%7D%2C%22data%22%3A%22%20issue%5B1%5D%20when%20i%20run%20jailhous=
e%20with%20the%20latest%20kernel.%20%22%7D%5D%7D%2C%7B%22type%22%3A%22eleme=
nt%22%2C%22id%22%3A%22u42e5a4af%22%2C%22name%22%3A%22p%22%2C%22attrs%22%3A%=
7B%7D%2C%22children%22%3A%5B%7B%22type%22%3A%22text%22%2C%22id%22%3A%22u740=
fdf3a%22%2C%22name%22%3A%22%23text%22%2C%22attrs%22%3A%7B%22fontsize%22%3A1=
2%7D%2C%22data%22%3A%22Any%20more%20ideas%20or%20updates%20about%20the%20%5=
C%22%22%7D%2C%7B%22type%22%3A%22text%22%2C%22id%22%3A%22u5c5e0c2b%22%2C%22n=
ame%22%3A%22%23text%22%2C%22attrs%22%3A%7B%22color%22%3A%22rgba(0%2C%200%2C=
%200%2C%200.87)%22%2C%22fontsize%22%3A14%7D%2C%22data%22%3A%22using%20a%20d=
ifferent%20mapping%20mechanism%20or%20a%20different%20page%22%7D%2C%7B%22ty=
pe%22%3A%22text%22%2C%22id%22%3A%22u67903271%22%2C%22name%22%3A%22%23text%2=
2%2C%22attrs%22%3A%7B%7D%2C%22data%22%3A%22%5Cn%22%7D%2C%7B%22type%22%3A%22=
text%22%2C%22id%22%3A%22uf0e038b8%22%2C%22name%22%3A%22%23text%22%2C%22attr=
s%22%3A%7B%22color%22%3A%22rgba(0%2C%200%2C%200%2C%200.87)%22%2C%22fontsize=
%22%3A14%7D%2C%22data%22%3A%22source%22%7D%2C%7B%22type%22%3A%22text%22%2C%=
22id%22%3A%22ua688a41c%22%2C%22name%22%3A%22%23text%22%2C%22attrs%22%3A%7B%=
22fontsize%22%3A12%7D%2C%22data%22%3A%22%5C%22%20option%20%20you%20referenc=
ed%3F%22%7D%5D%7D%2C%7B%22type%22%3A%22element%22%2C%22id%22%3A%22u952e54a9=
%22%2C%22name%22%3A%22p%22%2C%22attrs%22%3A%7B%7D%2C%22children%22%3A%5B%7B=
%22type%22%3A%22text%22%2C%22id%22%3A%22ueade6ad8%22%2C%22name%22%3A%22%23t=
ext%22%2C%22attrs%22%3A%7B%22fontsize%22%3A12%7D%2C%22data%22%3A%22%5B1%5D%=
20%22%7D%2C%7B%22type%22%3A%22element%22%2C%22id%22%3A%22ue41ecb9c%22%2C%22=
name%22%3A%22link%22%2C%22attrs%22%3A%7B%22external%22%3Atrue%2C%22src%22%3=
A%22https%3A%2F%2Fgroups.google.com%2Fg%2Fjailhouse-dev%2Fc%2FfhLERa0huX0%2=
2%7D%2C%22children%22%3A%5B%7B%22type%22%3A%22text%22%2C%22id%22%3A%22ub52b=
5139%22%2C%22name%22%3A%22%23text%22%2C%22attrs%22%3A%7B%7D%2C%22data%22%3A=
%22https%3A%2F%2Fgroups.google.com%2Fg%2Fjailhouse-dev%2Fc%2FfhLERa0huX0%22=
%7D%5D%7D%2C%7B%22type%22%3A%22text%22%2C%22id%22%3A%22u0c42eb6e%22%2C%22na=
me%22%3A%22%23text%22%2C%22attrs%22%3A%7B%22fontsize%22%3A12%7D%2C%22data%2=
2%3A%22%5Cn%22%7D%5D%7D%2C%7B%22type%22%3A%22element%22%2C%22id%22%3A%22u63=
f1bfa9%22%2C%22name%22%3A%22p%22%2C%22attrs%22%3A%7B%7D%2C%22children%22%3A=
%5B%7B%22type%22%3A%22text%22%2C%22id%22%3A%22u34df1ca7%22%2C%22name%22%3A%=
22%23text%22%2C%22attrs%22%3A%7B%22fontsize%22%3A12%7D%2C%22data%22%3A%22Th=
anks%2C%22%7D%5D%7D%2C%7B%22type%22%3A%22element%22%2C%22id%22%3A%22udf7e77=
8e%22%2C%22name%22%3A%22p%22%2C%22attrs%22%3A%7B%7D%2C%22children%22%3A%5B%=
7B%22type%22%3A%22text%22%2C%22id%22%3A%22ud4038cab%22%2C%22name%22%3A%22%2=
3text%22%2C%22attrs%22%3A%7B%22fontsize%22%3A12%7D%2C%22data%22%3A%22Chen%2=
0Zhou%22%7D%5D%7D%5D%2C%22attrs%22%3A%7B%7D%7D--><div class=3D"lake-content=
" typography=3D"classic"><div style=3D"margin: 0px; padding: 0px; min-heigh=
t: 24px;" class=3D""><!--text_ne_inode_%7B%22type%22%3A%22fragment%22%2C%22=
name%22%3A%22%23fragment%22%2C%22children%22%3A%5B%7B%22type%22%3A%22elemen=
t%22%2C%22id%22%3A%22ub3491be8%22%2C%22name%22%3A%22p%22%2C%22attrs%22%3A%7=
B%7D%2C%22children%22%3A%5B%7B%22type%22%3A%22text%22%2C%22id%22%3A%22ufd5c=
90f3%22%2C%22name%22%3A%22%23text%22%2C%22attrs%22%3A%7B%7D%2C%22data%22%3A=
%22Hi%20Jan%2C%22%7D%5D%7D%2C%7B%22type%22%3A%22element%22%2C%22id%22%3A%22=
u7f18a253%22%2C%22name%22%3A%22p%22%2C%22attrs%22%3A%7B%7D%2C%22children%22=
%3A%5B%7B%22type%22%3A%22text%22%2C%22id%22%3A%22ud1d1c683%22%2C%22name%22%=
3A%22%23text%22%2C%22attrs%22%3A%7B%7D%2C%22data%22%3A%22I%20met%20the%20%5=
C%22ioremap_page_range%20force%20nx%5C%22%20issue%5B1%5D%20when%20i%20run%2=
0jailhouse%20with%20the%20latest%20kernel.%22%7D%5D%7D%2C%7B%22type%22%3A%2=
2element%22%2C%22id%22%3A%22u5f19abcb%22%2C%22name%22%3A%22p%22%2C%22attrs%=
22%3A%7B%7D%2C%22children%22%3A%5B%7B%22type%22%3A%22text%22%2C%22id%22%3A%=
22ub18a1109%22%2C%22name%22%3A%22%23text%22%2C%22attrs%22%3A%7B%7D%2C%22dat=
a%22%3A%22Any%20more%20ideas%20or%20updates%20about%20the%20option%20that%2=
0using%20a%20different%20mapping%20mechanism%22%7D%5D%7D%2C%7B%22type%22%3A=
%22element%22%2C%22id%22%3A%22ub6ee7387%22%2C%22name%22%3A%22p%22%2C%22attr=
s%22%3A%7B%7D%2C%22children%22%3A%5B%7B%22type%22%3A%22text%22%2C%22id%22%3=
A%22u986f7a62%22%2C%22name%22%3A%22%23text%22%2C%22attrs%22%3A%7B%7D%2C%22d=
ata%22%3A%22or%20a%20different%20page%20source%20that%20permit%20executable=
%20mappings%20you%20referenced%3F%22%7D%5D%7D%2C%7B%22type%22%3A%22element%=
22%2C%22id%22%3A%22uae450da2%22%2C%22name%22%3A%22p%22%2C%22attrs%22%3A%7B%=
7D%2C%22children%22%3A%5B%7B%22type%22%3A%22text%22%2C%22id%22%3A%22u42959a=
82%22%2C%22name%22%3A%22%23text%22%2C%22attrs%22%3A%7B%7D%2C%22data%22%3A%2=
2%22%7D%5D%7D%2C%7B%22type%22%3A%22element%22%2C%22id%22%3A%22u8c1f7085%22%=
2C%22name%22%3A%22p%22%2C%22attrs%22%3A%7B%7D%2C%22children%22%3A%5B%7B%22t=
ype%22%3A%22text%22%2C%22id%22%3A%22u66e6e19d%22%2C%22name%22%3A%22%23text%=
22%2C%22attrs%22%3A%7B%7D%2C%22data%22%3A%22%5B1%5D%20%22%7D%2C%7B%22type%2=
2%3A%22element%22%2C%22id%22%3A%22u88f3c4e7%22%2C%22name%22%3A%22link%22%2C=
%22attrs%22%3A%7B%22external%22%3Atrue%2C%22src%22%3A%22https%3A%2F%2Fgroup=
s.google.com%2Fg%2Fjailhouse-dev%2Fc%2FfhLERa0huX0%22%7D%2C%22children%22%3=
A%5B%7B%22type%22%3A%22text%22%2C%22id%22%3A%22ubbd960f8%22%2C%22name%22%3A=
%22%23text%22%2C%22attrs%22%3A%7B%7D%2C%22data%22%3A%22https%3A%2F%2Fgroups=
.google.com%2Fg%2Fjailhouse-dev%2Fc%2FfhLERa0huX0%22%7D%5D%7D%5D%7D%2C%7B%2=
2type%22%3A%22element%22%2C%22id%22%3A%22u30bcf624%22%2C%22name%22%3A%22p%2=
2%2C%22attrs%22%3A%7B%7D%2C%22children%22%3A%5B%7B%22type%22%3A%22text%22%2=
C%22id%22%3A%22uf95dc725%22%2C%22name%22%3A%22%23text%22%2C%22attrs%22%3A%7=
B%7D%2C%22data%22%3A%22Thanks%2C%22%7D%5D%7D%2C%7B%22type%22%3A%22element%2=
2%2C%22id%22%3A%22ubb1e663e%22%2C%22name%22%3A%22p%22%2C%22attrs%22%3A%7B%7=
D%2C%22children%22%3A%5B%7B%22type%22%3A%22text%22%2C%22id%22%3A%22uc150a86=
e%22%2C%22name%22%3A%22%23text%22%2C%22attrs%22%3A%7B%7D%2C%22data%22%3A%22=
Chen%20Zhou%22%7D%5D%7D%5D%2C%22attrs%22%3A%7B%7D%7D--><div class=3D"lake-c=
ontent" typography=3D"classic"><div style=3D"margin: 0px; padding: 0px; min=
-height: 24px;" class=3D""><span class=3D"ne-text">Hi Jan,</span></div><div=
 style=3D"margin: 0px; padding: 0px; min-height: 24px;" class=3D""><span cl=
ass=3D"ne-text"><br class=3D""></span></div><div style=3D"margin: 0px; padd=
ing: 0px; min-height: 24px;" class=3D""><span class=3D"ne-text">I met the "=
ioremap_page_range force nx" issue[1] when i run jailhouse with the latest =
kernel.</span></div><div style=3D"margin: 0px; padding: 0px; min-height: 24=
px;" class=3D""><span class=3D"ne-text">Any more ideas or updates about the=
 option that use a different mapping mechanism&nbsp;</span>or a</div><div s=
tyle=3D"margin: 0px; padding: 0px; min-height: 24px;" class=3D"">different =
page source to permit executable mappings you referenced?</div><p id=3D"uae=
450da2" class=3D"ne-p" style=3D"margin: 0; padding: 0; min-height: 24px"><s=
pan class=3D"ne-text"></span><br class=3D"webkit-block-placeholder"></p><di=
v style=3D"margin: 0px; padding: 0px; min-height: 24px;" class=3D""><span c=
lass=3D"ne-text">[1] </span><a href=3D"https://groups.google.com/g/jailhous=
e-dev/c/fhLERa0huX0" data-href=3D"https://groups.google.com/g/jailhouse-dev=
/c/fhLERa0huX0" target=3D"_blank" class=3D"ne-link"><span class=3D"ne-text"=
>https://groups.google.com/g/jailhouse-dev/c/fhLERa0huX0</span></a></div><d=
iv style=3D"margin: 0px; padding: 0px; min-height: 24px;" class=3D""><span =
class=3D"ne-text">Thanks,</span></div><div style=3D"margin: 0px; padding: 0=
px; min-height: 24px;" class=3D""><span class=3D"ne-text">Chen Zhou</span><=
/div></div></div></div></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/EC427149-B188-453F-8DA3-D28B76A8316A%40gmail.com?u=
tm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/ja=
ilhouse-dev/EC427149-B188-453F-8DA3-D28B76A8316A%40gmail.com</a>.<br />

--Apple-Mail=_5FD52AF8-A0F3-4429-B7EC-F9FF50FCEB97--
