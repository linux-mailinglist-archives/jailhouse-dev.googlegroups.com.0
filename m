Return-Path: <jailhouse-dev+bncBC653PXTYYERBKNMSOEQMGQE45XUCYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id A37953F5D04
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 13:21:14 +0200 (CEST)
Received: by mail-qk1-x740.google.com with SMTP id 62-20020a3706410000b02903d2cdd9acf0sf13937827qkg.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 04:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QAhPHHd+pR7y0NvEqAR5xDZ3VgVUYM8CeKXVsIPgldw=;
        b=JK77Ob5aj8utNSo+Fgsei5AW3Notk4SjTxEw6OpxbYIeSPVZeC6jzvVeCWHgV95LnS
         oQ17bUT75dYMKwYgpqLWDwSU0JbmEpfjECJ4cMgzXah0/g+NSl3QxN+uVBuXgoi42j34
         EihvlRl3IkEWnr7FgZyfVQBJWt7rNJeqyluSdFZL2baMQD39RElX0erPIoXLfsOKlM0F
         obOGpapl3INcqWXuwtFUJV15zpdwah1oO8P0GS7ISkibkuKRO4+/L5hzrHLR5LkBYzS7
         MzdaG4ZvDjNhv+j4VhAoGJblGCQPJcMNL8/znmzbBOsNnn/pIvf6fFyZEjzulhWrqlaH
         /I4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QAhPHHd+pR7y0NvEqAR5xDZ3VgVUYM8CeKXVsIPgldw=;
        b=gS9mR30a6pIO57j2zQwxZu861TmAxgIYmnHHp/7rHAdzClgEVnQV5dT9iVPIo9/Fgh
         sRDJPf7m6CgOvm4Ms+UZcQOI5j2LwQb5Bh/j7A5GxUUxw5Dg7mgF+WKiEWG168UT8aam
         yVIvtWd1Nfqqueannbiv6RjQ/WUicczePU+DqxZ5TF+TMSUfi1SvbJuiH9Ew+fvD7ahu
         usCnGIJ3+kLZws3b0tg781WyFwZ/ou8aq2KlwwwyEK0Uoui9NdI9Vlrv5iSVjkwbQSOH
         xEeKsbV+ngjX8oqMlaDtKYcHDD1DYD/f7SO8KCU0u0I8+YghQq3S7oBl+mGJF7UxphTx
         +LFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QAhPHHd+pR7y0NvEqAR5xDZ3VgVUYM8CeKXVsIPgldw=;
        b=fUF6gRP76bVuB05ePKYxFz5JMCYsQwkQrbWO694f/Mep8ATBwXcsIcwTrQbGF4nH0h
         GP5+/5xlTA5Bsuu3+AS9oQ8tUPPizZD1BfBuJ+xdeEHaZpmFDOQdDJKFU42Yso84cYkX
         mNi8gZML/XCloOvsMGsUN1aqqEWvcyWloSdsXBJ4mavhElm9XcmprQMoI/1L8iYFrRvc
         V20wz1SZbmNscCxXvZlZqxMP55JAm6FmK1mQBhhcWHyYk16lhEO/pLvByfgeZ9hq8m+2
         dIHTJK1bLRkRetKqAn+HtJGjYZ4eZOBZODH/9Vx8PLs5Q0o3bfbv0CuZLCBZLMtS5Zjs
         W3rg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533RDhvTMyWMog/SpfK7tLgS30lvcs0QhPrZNpiX0jvZ9BH47wZ3
	sb0ktWwh1nUFtEa9k0pW/9Q=
X-Google-Smtp-Source: ABdhPJwqPJGcehLsivm+i+dH5CJnnlAhQT46PXVc6etfJaz+qN1wucSzZDKeg2HgChk/lza4RseH6A==
X-Received: by 2002:a37:9c8c:: with SMTP id f134mr25556507qke.349.1629804073251;
        Tue, 24 Aug 2021 04:21:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:20e5:: with SMTP id 5ls4874727qvk.10.gmail; Tue, 24
 Aug 2021 04:21:12 -0700 (PDT)
X-Received: by 2002:ad4:4a04:: with SMTP id m4mr19850104qvz.42.1629804072635;
        Tue, 24 Aug 2021 04:21:12 -0700 (PDT)
Date: Tue, 24 Aug 2021 04:21:12 -0700 (PDT)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ccffba76-599e-4776-9c37-691de5de7cdcn@googlegroups.com>
In-Reply-To: <dd34eca0-5093-ef58-2084-0bec72ac1b82@oth-regensburg.de>
References: <e76f8186-671f-45c8-afc8-8c85b3988c43n@googlegroups.com>
 <dd34eca0-5093-ef58-2084-0bec72ac1b82@oth-regensburg.de>
Subject: Re: Building a Baremetal OS for Raspberry Pi4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_718_1938381869.1629804072138"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_718_1938381869.1629804072138
Content-Type: multipart/alternative; 
	boundary="----=_Part_719_334168975.1629804072138"

------=_Part_719_334168975.1629804072138
Content-Type: text/plain; charset="UTF-8"


>Please attach a patch. Otherwise it's impossible to know what you 
>exactly did 

I am using Raspberry Pi4(4GB), Kernel 5.3.10, Jailhouse is working and 
added GPIO support. 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ccffba76-599e-4776-9c37-691de5de7cdcn%40googlegroups.com.

------=_Part_719_334168975.1629804072138
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br>&gt;Please attach a patch. Otherwise it's impossible to know what you <=
br>&gt;exactly did <br><br>I am using Raspberry Pi4(4GB), Kernel 5.3.10, Ja=
ilhouse is working and added GPIO support. <br>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ccffba76-599e-4776-9c37-691de5de7cdcn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ccffba76-599e-4776-9c37-691de5de7cdcn%40googlegroups.co=
m</a>.<br />

------=_Part_719_334168975.1629804072138--

------=_Part_718_1938381869.1629804072138--
