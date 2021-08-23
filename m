Return-Path: <jailhouse-dev+bncBC653PXTYYERBEEVR6EQMGQEVWPBIDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x438.google.com (mail-pf1-x438.google.com [IPv6:2607:f8b0:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CAD3F4E3B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 18:19:30 +0200 (CEST)
Received: by mail-pf1-x438.google.com with SMTP id 71-20020a62144a0000b02903cde387cf77sf8861943pfu.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 09:19:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629735569; cv=pass;
        d=google.com; s=arc-20160816;
        b=NFBEa59w+ToDwGCMWM1lb+eP4SxTXoTCbV1LBfPjm8zQ5UwbYc3GJVZb48N71I6MJg
         BWUiq69ZjeZjEmV/RerYjnen8kKIUFcHq9gf+mnIfWQkBh37dLTZ77KglLkzNjc6CeGc
         I7L3ziRAuGEwUqeHLxEGhM26RWkIaTo+ZesAPqjRxBoUA2Jt7sTOSmtBZNKWeRLbIjZ/
         YFF9xCKuCSk/vOr2wiYGXuDW0+uIqfOasmU2REfAYBmmobKHNRJylxW0vIbnYvM/TDPC
         5IiX6ldHOOZF0TVCZf55JWsrjFxrfK/3u2oKbjpjlyL+4RnhOMFuNtlINl+L1I0meaKf
         OR3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=MXVIbWg79Vn8BaSBAj8XcyeLv1/x7bqmTEjaF9Wwtq8=;
        b=NrO7eYutLxUvHJYIw97UvKzxCWe3KPj16hSL2V8RqEaSEHPQOrC5zFUB8UpfNlOtG/
         JokBjvXBTNQIgfEyl9QeQ6zL/J4wWWdL14vSYmUqtTAYB0wNPFSxX5OmvKvSw2elrSD+
         tWqUkjmr1ykppt2maimAaWZwSpZCx4DLQf6BeTDrCb2MfJLIDGuvhH099DHkFrrAfU0I
         f1Mt2Mps6/6EO3nIH+Sw76BUPAKO93jFl0+9N8jJ3sVTZAokpAolNkPqSiLDZP7suaXw
         2z3gIhG4gr6q5/REpOrMuD5/ZAgqkZ0R6mfbu3LelkFSmoQL4evSS/oNUexxFXthfOIM
         C5hg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=CNLOVYj8;
       spf=pass (google.com: domain of mustafa13e09940@gmail.com designates 2607:f8b0:4864:20::32f as permitted sender) smtp.mailfrom=mustafa13e09940@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MXVIbWg79Vn8BaSBAj8XcyeLv1/x7bqmTEjaF9Wwtq8=;
        b=Cs1kY7FivzMndQRomSFI6nkk/Kya0ShytqAN0zSzs7r46jzJr818zE3oO5rFWgOMv1
         cmTv0Ic6WvBjgiLqrgxXjvKU6D5fn5NoAno6id+i4ff09/3fOBMSNlV08VmF0WgfA1H/
         EVJqqTqCf4zBaIHEwcJGXwODdalwu6yZQVKB+ax5oWZlHPhYxNaxNrSPzfS4kD00yPiP
         bM4/E4sz8XUF7cQp4Y82I40WLVTrzJrUkvHQfKW2/RxeQvRiPOiP9HRKWDz7blOgfiVo
         O5LdMQQm0xRJhH734tYUxS7gDgEmyL/1TFXVUEoNSKEnjl7/W9Xllx1ug+M8NGfav8Mp
         p1sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MXVIbWg79Vn8BaSBAj8XcyeLv1/x7bqmTEjaF9Wwtq8=;
        b=Qj2i/ItptzPOazuBirwK+kGjhyo+g7BhoaAUPgIlW8ROa8H/FMbvIFn4OTeyj3laBK
         Kr5m63pOMCzMw6zxd+xY2mBUKl3gX58BzO++XXGIUgBUykHQj5xkL2w2p6vn6cR6qKKE
         I9nkCxUJGzvKs1juMohFRy1dMlvFTsDGUa3MOZLsNI+r0mxDUFGZm0ZCbjJFmcTxVKNV
         Tyu3hxjNKeZY1Q9Sgd5jWlNxDArsbN6Ee6rR9BOvQDQ1eJ5N6fcadGHNfHNKGQTAnW7N
         u6nLnd22N6Z/LapiiGwlXQNn1e3JrPy/FOb6ECJQLNV1+GmBkxmrAD+UF+q+WhZ2i6He
         n7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MXVIbWg79Vn8BaSBAj8XcyeLv1/x7bqmTEjaF9Wwtq8=;
        b=agZLkQsjTBGeAeiP4vg/des7n95p1qaFzvDsYg2Y6Fi4fh++8RZtSYEnT/wd/EOiRv
         Ggxa503OqIcsvTo6/DDg1S9FMzBZAIhBdmj+ilEeCBexbnBSWV1bPwnP3eeJE1pYkVQd
         sry50nyal1W/QAPV8BlOkMC+7yRI7j9n76NVsNaV3Bu1dvDahpinJODn/FFvBEIxpLRM
         E0yGGgs6/a8BcL2Vn4pPDZu0fuigmi/dipgOlkTL3R9k3M/FBpnuZ/7OC/Kvs9gwcjci
         Moul17xIp7ecjJV+L8hEG7Qr5tu1xG7O3M6Cga75GtxOj2S2peb8eVxwrPPczNRlaDvH
         TVRw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531p4xa8GEK0H67M+039DB485E6or2355Bt8Vsc//7mtk1fyQRyF
	4ci6+4FyTdKkTvrcDVQbe5c=
X-Google-Smtp-Source: ABdhPJx51BnnYRUCVRnYWh5jGST6PUIYbgDb1pYWuec3UIlxOqCMF/dAU0kDZroLjY1z/6c8r9UHLA==
X-Received: by 2002:a05:6a00:1903:b029:3b6:7918:7ddf with SMTP id y3-20020a056a001903b02903b679187ddfmr34716349pfi.53.1629735569086;
        Mon, 23 Aug 2021 09:19:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:144:: with SMTP id 65ls6742820pfb.3.gmail; Mon, 23 Aug
 2021 09:19:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:24ca:b0:3e1:14fc:e34c with SMTP id d10-20020a056a0024ca00b003e114fce34cmr33844581pfv.76.1629735568505;
        Mon, 23 Aug 2021 09:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629735568; cv=none;
        d=google.com; s=arc-20160816;
        b=gwy1eYqf/LTWKyskuUbjSkiuJ95DzDdkuWF+HcnTsES4x4d9H6H0JpFvOr4ClkJgR+
         kBzxg+YzIvHXKc7XnepDLVZ/99wmhaEZwq+N1Iw0LBY/yaYVB6g1jUjcm5+EDQFha83z
         7qVh+CDUoRmXL/FcZ/OnMhNHhXFmowXzGQtvQNizlzlbPvgvmJ9gWhBrZQ5+8f7KmZ1R
         ggOe0nXDCxGj1fDESeQY2XrCC+ZRrqX7OsdSp33Mzc6To3pkfzu6rBhZ84ggXPkGNyc2
         MeZrkt1O0Tb15+eIiI6eHsenzFSy0fwVhE/Hlfx1QP1mQlRhoWY4lPh+yjOcoPIntJGl
         s80Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4ZvjLP8vFZZLCRfZS6XqSqe3US5n91BHwATonAXL1I4=;
        b=BzU7pX5tImgXljopC8Mkmix2WZrkWfWRHEwC7jLmTy6ayAfI/Cr7QCXhM+pUBxSqLC
         uJ7JMPhPyDx7wDCMXLBrK0TXejX2WCjmxDUWFfqyDrAuIkxjqdE2pX+wldyo+QJbGGoz
         hJPrY2wwiFLGxa1uTbXGXLKrEEqcu/NKsvWcn7V7Y/Y1+wn9z62CIx2HaBdNvKhDimb/
         Nra9QMxuVZX5inYgbm1a6JNB9uRhpMH9/WDBi9evbwO1+nGoNQCZ8IFDerVqsayQRJ0u
         JvWRvP2B/Tsm2FUcKVDf2D7j9J/nm47OFaYBx8/tztpRZqbigpov93qDTQDHUlIaBGcm
         5Jtg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=CNLOVYj8;
       spf=pass (google.com: domain of mustafa13e09940@gmail.com designates 2607:f8b0:4864:20::32f as permitted sender) smtp.mailfrom=mustafa13e09940@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com. [2607:f8b0:4864:20::32f])
        by gmr-mx.google.com with ESMTPS id r9si778106pls.4.2021.08.23.09.19.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 09:19:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of mustafa13e09940@gmail.com designates 2607:f8b0:4864:20::32f as permitted sender) client-ip=2607:f8b0:4864:20::32f;
Received: by mail-ot1-x32f.google.com with SMTP id o16-20020a9d2210000000b0051b1e56c98fso22931549ota.8
        for <jailhouse-dev@googlegroups.com>; Mon, 23 Aug 2021 09:19:28 -0700 (PDT)
X-Received: by 2002:a9d:7ac9:: with SMTP id m9mr9126960otn.244.1629735568157;
 Mon, 23 Aug 2021 09:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <cd1adc59-e867-4ce1-a6ea-371ae1754cdan@googlegroups.com>
 <434c3e0d-3f9d-cef4-faa8-e94248176db8@oth-regensburg.de> <560fff74-e071-4713-a1ec-e29b842f7564n@googlegroups.com>
 <a30c722d-4fc3-fd3a-f2c2-5dd80b2d8887@oth-regensburg.de> <12f6f39b-14fa-47c4-9fe6-6ca0897e14c0n@googlegroups.com>
 <66d9ac5b-8e2c-621d-d948-ff921aa0aa5e@oth-regensburg.de> <bf8c269c-0868-4296-b97a-edc841ac530cn@googlegroups.com>
 <6c3b1b62-84fc-fc39-1115-8f695897e712@oth-regensburg.de> <CAEKTTKzJQEj9Wp7H6vO92k1uDgqEiZv-JixK7Cur52j7m9=ipg@mail.gmail.com>
 <a66b2c70-26f2-6ac4-4a0c-74f963ead91b@oth-regensburg.de>
In-Reply-To: <a66b2c70-26f2-6ac4-4a0c-74f963ead91b@oth-regensburg.de>
From: Moustafa Nofal <mustafa13e09940@gmail.com>
Date: Mon, 23 Aug 2021 18:19:18 +0200
Message-ID: <CAEKTTKz_rPxrcHKbYGa-YN0b8ik=a4xgsS81550-oZ9M7CDtcw@mail.gmail.com>
Subject: Re: [EXT] Re: Editing Inmate to add GPIO for Raspberry Pi4
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="0000000000009e2ea205ca3c6129"
X-Original-Sender: mustafa13e09940@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=CNLOVYj8;       spf=pass
 (google.com: domain of mustafa13e09940@gmail.com designates
 2607:f8b0:4864:20::32f as permitted sender) smtp.mailfrom=mustafa13e09940@gmail.com;
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

--0000000000009e2ea205ca3c6129
Content-Type: text/plain; charset="UTF-8"

>Ah, I see, Ack. In that case, the UART is taken away from the root cell.
>You can overcome this with the JAILHOUSE_MEM_ROOTSHARED flag. But be
>aware that the inmate is then allowed to the UART device as well. So if
>latencies that are introduced by hypervisor intervention due to
>subpaging are not an issue for you, then subpaging is probably what you
>want.
I think, I will use subpaging.
Thanks for your concrete feedback.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAEKTTKz_rPxrcHKbYGa-YN0b8ik%3Da4xgsS81550-oZ9M7CDtcw%40mail.gmail.com.

--0000000000009e2ea205ca3c6129
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&gt;Ah, I see, Ack. In that case, the UAR=
T is taken away from the root cell.<br>&gt;You can overcome this with the J=
AILHOUSE_MEM_ROOTSHARED flag. But be<br>&gt;aware that the inmate is then a=
llowed to the UART device as well. So if<br>&gt;latencies that are introduc=
ed by hypervisor intervention due to<br>&gt;subpaging are not an issue for =
you, then subpaging is probably what you<br>&gt;want.=C2=A0=C2=A0<br>I thin=
k, I will use subpaging.=C2=A0<br>Thanks for your concrete feedback.</div><=
/div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAEKTTKz_rPxrcHKbYGa-YN0b8ik%3Da4xgsS81550-oZ9M7CD=
tcw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAEKTTKz_rPxrcHKbYGa-YN0b8ik%3Da4xgsS8155=
0-oZ9M7CDtcw%40mail.gmail.com</a>.<br />

--0000000000009e2ea205ca3c6129--
