Return-Path: <jailhouse-dev+bncBDQMPO7P34FBBEW6TKAAMGQEBP7C5TY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73e.google.com (mail-qk1-x73e.google.com [IPv6:2607:f8b0:4864:20::73e])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA212FB51E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 19 Jan 2021 11:06:11 +0100 (CET)
Received: by mail-qk1-x73e.google.com with SMTP id b206sf19692143qkc.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 19 Jan 2021 02:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lxlDz6mtFOo4kkbbxJQ10yLmydD4Wqvve0T1LmXVS18=;
        b=a2t5On6nrUa4VizUefgS09c/9ukbpEkXOpQjK0Pi/qRFnXMsDAxnTvjJok+RvxCQKA
         TOt4CzMrQmuzBLBCSG3PwuIFixVaV31Z/XyrhCFZHuRfXF9o7dvijHIc4dUsTehiQiye
         SIlIyWbSSVOkB/eEuvtMz6KeylmADzBzMrubide2JIghHke5As3Q8Lk9TOR4rzmO6uVt
         TnxInOLwdfXDmiWSvMX+AwQLD0OJWR1qj167kvyW/zaE4f2iPhSfQXP5g8kdsXrAF6fm
         GJfwR93TuCnQudRVwH+sSMCMgsoJ22Qvzh7pYVmK56YF5jBWu76YgO8Ftk9fnWh870Dt
         LMWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lxlDz6mtFOo4kkbbxJQ10yLmydD4Wqvve0T1LmXVS18=;
        b=f+Uyyx7OCgtghCj16d2Q/1ajo0OMoOtVgtHEky1NXeEbwmpbqI23vNM0W4cefw8Jxh
         vpNTDR08uCeb+QSp5umDU2B7aReyi0dTHCUvmqVTW9lmdcpLb/J5zr+/XSlshvNIZ0R6
         SP8WXDd6aAwee8wR/ahVUa4QvQV3hZuhK6XX8w9uTTJl7Z15As6vKhbW01kO7ZQJr477
         8XK96iI22v+v+pdg2+ghHMei5ACIh+mfVtl4W8giwKo98VIyxzhvayzZ91rZvhfBYLyw
         kwQEBVRfwjjR5C8+Vwlsm364/lylYBO9N/6ITyQBQKkydbzxDwhHKwn9qkYgEs0qFhqR
         LRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lxlDz6mtFOo4kkbbxJQ10yLmydD4Wqvve0T1LmXVS18=;
        b=QQIJHhpam0weuJPwANKe2g9/4Nwe8jWo9V750L05ycuV/9KQyMW/694DlBr7fvhxEw
         /B0xcZDwCg6C31KGQpfrlnGPfrDqN6Qc2OOIbmPo5Gfflh+e8NCKEyESQ8Eco2v4CGkE
         uxyZjiGARvOkWPtz7rBv3yM8R59GFJqZ5EBZ+10aLCV/zsN8qL+iZb7J10VrTgjdlcHb
         4IrNV2XqiFVx9Mmt41Jyu/ql2uRu1i0f47oIBt+bhcn9g4IREWkiChbSGvh7YWMSAU0E
         sTT+GGRdsqCR6IZYsOkb4wuXS33eJKcxogGa8GSIkdLPvq9en0FU+dsJ3QBeLYYbz0e3
         suFA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532JBWTBFFdAWhsvqzuaciA7js5Ux2hYUYyzHomEf7YYsDMiP9mO
	FH3/VlxUp97NFrF9fpNss58=
X-Google-Smtp-Source: ABdhPJxsGXh4IsoDmw/ICJTHVP7JAtPhzidcFy7jq/REU8Ut29bA7lOr4UC8Lbafiv6yEKGRHMIN/g==
X-Received: by 2002:ad4:4f4a:: with SMTP id eu10mr3672859qvb.17.1611050770515;
        Tue, 19 Jan 2021 02:06:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:702:: with SMTP id 2ls10583725qkc.11.gmail; Tue, 19
 Jan 2021 02:06:10 -0800 (PST)
X-Received: by 2002:a37:9205:: with SMTP id u5mr3558411qkd.345.1611050769809;
        Tue, 19 Jan 2021 02:06:09 -0800 (PST)
Date: Tue, 19 Jan 2021 02:06:09 -0800 (PST)
From: Luca Belluardo <luca.bellu95@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3583efdb-f9b6-469a-9eb3-bfce0c4116b9n@googlegroups.com>
Subject: IVSHMEM between 2 VMs
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3172_143843413.1611050769290"
X-Original-Sender: luca.bellu95@gmail.com
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

------=_Part_3172_143843413.1611050769290
Content-Type: multipart/alternative; 
	boundary="----=_Part_3173_974396495.1611050769290"

------=_Part_3173_974396495.1611050769290
Content-Type: text/plain; charset="UTF-8"

I'm new in hypervisor and in Jailhouse. I read some articles and the 
documentation and I have seen that it is possible create a shared memory 
between 2 virtual machines on Jailhouse.
But I don't understand some things. Can someone help me to write a sample 
code for my case? I have to shared a struct like this below between 2 VMs
struct my_struct{
       mutex mtx,
       bool has_msg,
       type msg
}.
If it is possible I want a sample code with some comment for my case, so I 
go alone in the development of the communication.
The mutex is necessary or the mutual exclusion is granted by Jailhouse?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3583efdb-f9b6-469a-9eb3-bfce0c4116b9n%40googlegroups.com.

------=_Part_3173_974396495.1611050769290
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>I'm new in hypervisor and in Jailhouse. I read some articles and the d=
ocumentation and I have seen that it is possible create a shared memory bet=
ween 2 virtual machines on Jailhouse.</div><div>But I don't understand some=
 things. Can someone help me to write a sample code for my case? I have to =
shared a struct like this below between 2 VMs</div><div>struct my_struct{</=
div><div>&nbsp; &nbsp; &nbsp; &nbsp;mutex mtx,</div><div>&nbsp; &nbsp; &nbs=
p; &nbsp;bool has_msg,</div><div>&nbsp; &nbsp; &nbsp; &nbsp;type msg</div><=
div>}.</div><div>If it is possible I want a sample code with some comment f=
or my case, so I go alone in the development of the communication.</div><di=
v>The mutex is necessary or the mutual exclusion is granted by Jailhouse?</=
div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/3583efdb-f9b6-469a-9eb3-bfce0c4116b9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/3583efdb-f9b6-469a-9eb3-bfce0c4116b9n%40googlegroups.co=
m</a>.<br />

------=_Part_3173_974396495.1611050769290--

------=_Part_3172_143843413.1611050769290--
