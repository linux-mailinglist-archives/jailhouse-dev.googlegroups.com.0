Return-Path: <jailhouse-dev+bncBDTM5FV2VUCBB6NKSOXAMGQELQ24XAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id B947D84E1DB
	for <lists+jailhouse-dev@lfdr.de>; Thu,  8 Feb 2024 14:22:03 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id 4fb4d7f45d1cf-5597da35ebbsf1428709a12.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 08 Feb 2024 05:22:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1707398523; cv=pass;
        d=google.com; s=arc-20160816;
        b=BG2sRymMUxSS+OCgGkvahs1z6GhopicYGQbAXE5yw/d6v2Qyevz5GXGRh+2wrW2oxI
         pkNPXgFtwFDS2uihRdPjilVbUW8y/k6k/rEKwb1q6+Pg1h9Wftk4F1z4ijHq/x04zjm7
         AfhA70fXtfQ5KFVbR3gWItmygzoOWMgjbbSa+SJJe+oIEOH3Q9vvamkQi7jwcR3EdKoI
         EnuGmn2qGOMPDD4a3LzIs5gdw7r7OqSbtgxvC+EIfFwOATWO7s9MWHaH4sBEklpi0K1H
         BTabfGo0v4gY2NjmOpWUOsRIyCwyDO58kgCEbts3+J12fPgcLh0Yf/doOEkGfX5eabG+
         BVAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=3DafjssNVCNvgprsdQxBRGEaK5oNXfTGtkHrAi/G+DI=;
        fh=8niRJWgXT4uxzfwkp1nkca8ea50tJjTI75jvokiHVX8=;
        b=dze7QiQhQGqyn+2332A9ZXGy6mLTQd/d2/43oLeufbcI7kqPTOC679PnmpHq0LXqk/
         mPZaw6KbN538TScdc9hp/QUwYm3ydSED3l2wuQXeIWAb1cXgkGR7z/xxgwNINvpaNlsn
         xTmB63NlFchxxNv57zYJ8UicJkCnNErfPUQBhk9KUbA3RwkGQtvENtcOMPQf+EWWRTCQ
         iE8+tgv71kYcvvRu68W7CSBO9jAjLxXsjEu50xK26irDtyZfjio0TW4fGmLrGLasWkln
         XZPGg9cFCaSkAiYV19tP5MfeBBhYVu7OoHixSPfhsT61aElEExslJz4vm7jjitiFA8Cs
         sINQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=HZv4W17k;
       spf=pass (google.com: domain of choihang91@gmail.com designates 2a00:1450:4864:20::431 as permitted sender) smtp.mailfrom=choihang91@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1707398523; x=1708003323; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3DafjssNVCNvgprsdQxBRGEaK5oNXfTGtkHrAi/G+DI=;
        b=kdexs7JTd3TA2BBCW22822HZzzwkyYdNJwzJX6XW7Zu5SQcVRBFCqyqMeq4xz+TCRH
         4NAhomyeihgix5jnd3JO5duuKrr+ycsmSd0j4iU8YzHd65ARkElLOEDf+1LegMSCOeR5
         TKzDxoJ8kEE3o5iZoETSeRlZLGbajyRhOusQQK4QW1OqUNXM3RRHhdA8aRI4m7MCJK7q
         gO/yE/Pad/WScn+fqDnknrDbfiNPvLapWasZuefnixBVfsH9GVqTZzh24fbNnoXA53YG
         zvw1uWagGJVYlrVLEhRf4pw78bKaT2fbnrZdzR6ZbHg1ur7rRwi+sd7hnHp2zxTGuEIP
         arsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707398523; x=1708003323; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3DafjssNVCNvgprsdQxBRGEaK5oNXfTGtkHrAi/G+DI=;
        b=kuxVwtHva1Luc+hjAR/2giGzbyItBbxfmt+obOkJ+oya+Ab6Wh98Ja/q8vYI5uuW/E
         oxi2AsaC7jDUWd6URWPo3YVBD5aMMXYGnzPRBwrj6HFSz47EnXZ/eJZ6Q3uNpkW+8MCO
         V4G72BrDuCBHhNe4TXPvYomS3f+uBgIprvnhPyPMKUYirYdCkRtP+Nm8PakaxUzUZvfv
         tj7maFJlIhu3bmoib0JTZa7SjCfJT+kIzD0LW50ZukDgr6zsUcMOdwJN+b9PpzYnON+y
         +yUhJjbm44Zgh01NeIoKcCuejMO/ByZcy8o13xR2OZiO0iMKbxgYLEyT+fl4K1Y7cN6H
         k0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707398523; x=1708003323;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:x-beenthere:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3DafjssNVCNvgprsdQxBRGEaK5oNXfTGtkHrAi/G+DI=;
        b=beQbbv0PaUttgGqeZ7X4iKvsQNNPpMDcGQwBjgqvJkirEvbp2kG4lI4hqlKdvIHQv5
         +dTvn8fffdgSwbZEJhiHqT9aF4XBG9QcIQaf3CypbE0VvffY22XAcvdvKMux8pwXdKUB
         Ud6d7z6uSsmb6wQdP+ZY1VShs0+fYF6q/c4X8tFMHAWjEVaX7svGWl9/iS+kEeaHYzcv
         jsa8lnQhSvmsdg+IPGHsFAjJQg7V0J2eSCaxDPYM0dzPRCQm+OfJolGSz3630T3nwT+w
         ZQHeKKbmHvpcRJ0cNi91gWFhfV4ot4tjflNx5rSyneXIGsHszWUcnZKJVQtgcSOH+wP5
         b8FA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCXAi45SE0Mhu/NPV5WnugDicBGEErew959OtvoCSb+Y3iCGyfD6TBrUqqL0ns40Nkd7UiD6CcxtlOpVKd/ORgCx6BK+CmwXSxDHZz4=
X-Gm-Message-State: AOJu0YxbSEBgbCQ/s+rreIaS0L4tZO4bGp2UgPUJOKtr/mmLWZ0KS0xH
	KdRDvji+fL3Hg6WJ5gQ6zF/ByN+aAHcAkQM+e7dBHHMuYJ0qGyDi
X-Google-Smtp-Source: AGHT+IEkTUKoumvDjswB+vxcMcWNynXqBnvmNlg8BQ0ZGpksePqVKpBVUxKD/dZqDGqc2EP4e1L0/A==
X-Received: by 2002:a05:6402:1651:b0:560:81c3:cadf with SMTP id s17-20020a056402165100b0056081c3cadfmr6077945edx.38.1707398522549;
        Thu, 08 Feb 2024 05:22:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:401e:b0:560:bb98:b04b with SMTP id
 d30-20020a056402401e00b00560bb98b04bls44907eda.2.-pod-prod-06-eu; Thu, 08 Feb
 2024 05:22:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVpX0wu9pS9lO5BQQzpcS3sOp0/vA9DX+HmiWLAQyE7+PoleQy4XnRzewqnsRaFfJ8Mh7iBfwlJO3rrYhCnLF47i/BF8O3eUHvoE314uo=
X-Received: by 2002:a17:906:7cc:b0:a38:e745:fb88 with SMTP id m12-20020a17090607cc00b00a38e745fb88mr1990262ejc.57.1707398520153;
        Thu, 08 Feb 2024 05:22:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707398520; cv=none;
        d=google.com; s=arc-20160816;
        b=NJBNzHqaOR/wWVmso7WtaOYZ/ABxgj4Q3Nn6spw6jaxeucVhsg9MPLwt4WawpP88tQ
         GQyoNu6t5L2RKqxI4/teabogBxiC/HowOMYF8bbiiPgBwj57D41Au6vDPnGjusXK02SQ
         BvGuXCPRyNytBq1iMBzonH7agrfxjTUYTZlC9m+qyYRnlhne0EVa8xO8iVqWSADObvQi
         Mvcoy30eVpwRV7PRrhII8zjBMqF/yzt+L7m8fm0DGywTxg6XFIv4JJy3/JMfxLs9DT2D
         tNS1Z9Mj7O8KYRgjHTHzQw9PofvHNYV0fI5veRLMLSCdNPxvsZPbkpLdeoH6qIdu0u/E
         zKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=r5wp21F5B9A/byxZ9Ag/T7CAzXg5mJVGYA5uA9+no4U=;
        fh=30MzskFEk7IuZGz/LkXVVMbElin30IpeBNm2cM6lGaw=;
        b=Mhl9uxyvlhv3guARZ0+hsMMAIW7fS24scThvdnjxCsDhjiaP2e11M5preA3mWjNtq7
         XQthNLpNXbp3zQsd/Pv6SRyTJ5DRLa9sq54C5k5aJqyAa+Wl2XsEY4mbEofgh20kz/Kk
         3o5tJj3E1q2AJAWoEYHCKgfJcNzT/LeNmPEb3Y5/DX6HMtGPqvyd+QyzslaKM5xB/wLm
         1pup+QTVN4nY7oRikLr3pEZCZfxcYmJfNbGJcAy5VB/doyeMwmsuAb9gRevCAhO3LUhQ
         f4B8ZLAslalD7t8QFe0Tqd6y/GxOvvc7iR1A2pyJmnZ/jg/ySMDgRUAhTQPnmOS5EaJC
         Ujpg==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=HZv4W17k;
       spf=pass (google.com: domain of choihang91@gmail.com designates 2a00:1450:4864:20::431 as permitted sender) smtp.mailfrom=choihang91@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
X-Forwarded-Encrypted: i=1; AJvYcCV91krNx3Tq3pEMHVeuvL8Ik7YuerGZMUXS/PlDPjE/6Yp6DtO+dGd21Hr8bMNHSVB1xOg0S0UpDDNuxr3MY/ND+bEHyxwKHzZf40LSCVc=
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com. [2a00:1450:4864:20::431])
        by gmr-mx.google.com with ESMTPS id oq27-20020a170906cc9b00b00a381eedee30si7297ejb.0.2024.02.08.05.22.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 05:22:00 -0800 (PST)
Received-SPF: pass (google.com: domain of choihang91@gmail.com designates 2a00:1450:4864:20::431 as permitted sender) client-ip=2a00:1450:4864:20::431;
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-33b4e6972f6so1150493f8f.2
        for <jailhouse-dev@googlegroups.com>; Thu, 08 Feb 2024 05:22:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXRqAVqAAz/OHNb/7tlZsGZhMkx6OH4eIUEAFjwYpciFhFM6U/mLzESzs0mJ7ra8KCobXs3xZUOc5DsazZI1czbDessDL1JHzDYYrMLOQ=
X-Received: by 2002:a5d:5887:0:b0:337:b315:5643 with SMTP id
 n7-20020a5d5887000000b00337b3155643mr1257693wrf.6.1707398519583; Thu, 08 Feb
 2024 05:21:59 -0800 (PST)
MIME-Version: 1.0
From: choi hang <choihang91@gmail.com>
Date: Thu, 8 Feb 2024 13:19:28 +0100
Message-ID: <CAOyhcX1uTF=HFPbwzAk=ZQBm6DCtPsHsd+DKBeZpLoZHo_SjPg@mail.gmail.com>
Subject: From Mrs.Choi
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000003ff8d80610deb2ff"
X-Original-Sender: choihang91@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20230601 header.b=HZv4W17k;       spf=pass
 (google.com: domain of choihang91@gmail.com designates 2a00:1450:4864:20::431
 as permitted sender) smtp.mailfrom=choihang91@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000003ff8d80610deb2ff
Content-Type: text/plain; charset="UTF-8"

Hello Beloved

Greetings to you in the name of the Lord. My name is Mrs.Choi Hang. There
is something very important I want to discuss with you. I'm a very
influential and wealthy woman but I'm sick and dying.

I'm suffering from severe malignancy and have a few months to live. I am
sending you this message because I want to make a donation to you for
charity purposes in your country.
Get back to me so I can send you more details about my donation.

Warm Regards,

Mrs.Choi Hang

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAOyhcX1uTF%3DHFPbwzAk%3DZQBm6DCtPsHsd%2BDKBeZpLoZHo_SjPg%40mail.gmail.com.

--0000000000003ff8d80610deb2ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Beloved<br><br>Greetings to you in the name of the L=
ord. My name is Mrs.Choi Hang. There is something very important I want to =
discuss with you. I&#39;m a very influential and wealthy woman but I&#39;m =
sick and dying.<br><br>I&#39;m suffering from severe malignancy and have a =
few months to live. I am sending you this message because I want to make a =
donation to you for charity purposes in your country.<br>Get back to me so =
I can send you more details about my donation.<br><br>Warm Regards,<br><br>=
Mrs.Choi Hang </div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAOyhcX1uTF%3DHFPbwzAk%3DZQBm6DCtPsHsd%2BDKBeZpLoZ=
Ho_SjPg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CAOyhcX1uTF%3DHFPbwzAk%3DZQBm6DCtPsHs=
d%2BDKBeZpLoZHo_SjPg%40mail.gmail.com</a>.<br />

--0000000000003ff8d80610deb2ff--
