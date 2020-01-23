Return-Path: <jailhouse-dev+bncBCDJXM4674ERBLU5UXYQKGQEVRSLHIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 303CE1462CB
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jan 2020 08:43:44 +0100 (CET)
Received: by mail-ot1-x338.google.com with SMTP id d36sf1121359otb.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jan 2020 23:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ok6yVN0F8a71vrQnIoyRAhk7VhSkPO7TfW4z1qc/IpE=;
        b=QvDxRl3DwYg3uBqT/c3Ic96aWwWaeWTLk5eDFdU+ZlzVrTT+NQcIjN/K2+rZ4V1/Ws
         x9eFf3F/d3Syyza3JxxdcjtMfeWJCh9BK7wp+P8HLmxUllrJmFDZr5MWFl2skce3DcyG
         JJWE7qana9Vdmtv3lf6IgN1RMGmFBcRuLpmCwrrqpvyzzwvDlh4A95ywUhbquDAyW9e0
         8f6AkJbdNvQK1mdm0WkTAUYLdcJ7ujKDuNmcdojPwpXRpFVjVd16CCAUIujEFGW34Q9Y
         fmcGc9WVG3t4XpQAWLtLa6GWg8HAucQ4bhvM4w8dpS+QiXEyhHJWJ1GIWjSmK5zA9m/B
         ALzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ok6yVN0F8a71vrQnIoyRAhk7VhSkPO7TfW4z1qc/IpE=;
        b=QoVmmE7jmQw73hqBzBnyDWVMEf82iqLDjtRlDLoEFWAMSDJoYdjszFbhcCiwRihTzr
         oMolkVBjjCInT8HoxmqPO7Pqc491NfmJjU1MKIem8u/UqtXgU7CjlQEhMuF2o20poabG
         Z1lXC6y7AtFqKzFpyuG/AGZGaO9fjUxcbJaXp9z47Iw7JZ96uKlS0/zfijAHJHI7ctxL
         LZ7kyCVYnkVcgm5tK6zh6WQXayxe0xoKlYkp3hRhPBg8IPjDgkfh5mOAWTx9rf8ihYSL
         HqXAy92HbEfjkMhGIhbhLFD5SJLsgQzAoIVbtlWZgZ0efL279wQBvuSu3+LCtRHxXEkg
         ZNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Ok6yVN0F8a71vrQnIoyRAhk7VhSkPO7TfW4z1qc/IpE=;
        b=Ip1zID+4Kg4lqtYnWqh9bGixSrPkZ/+k07Cg0ZKhh39s8OJOjL5uMliQjM+cfh8Rf2
         N5IE2bGa3CXNKr7NC74KZY6JiCMuqRIsl3kHcR4oXzq50L7i8UN7H3HuHuO7rmTplXTx
         ZcVwT65Nm1z2BI0cd47eqgBJ+TFXV0wFQxiZDBNNMb5/i1QiCmk4hHPW/0sXX/0Fhy+x
         JrjS01+jr1HMEpEGswYKXJ48Fs6LDURebT5Zii+CXmSPiWUMyWolRMTT87nkBkWHESXx
         a5aLm+8G2vC5AVIDwIgnIazlyGEsgWx+erfDLUkAiXsLS85Pbg8k2hu4MpxhMzKBfUN5
         d0pw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUyOoU7EczDXVw1D7iqUgWvyvP8eM+GZ55V/uXYmaw+crQDzfKA
	+RQcjKP2JPtORAbcNHA9QNI=
X-Google-Smtp-Source: APXvYqyQvhzajf1l79bFNUIMn2s0fVKvHHJWPf0y59EHHF7SD4uhTrF6HGVGFdj5W/cAOjDegzcJ5Q==
X-Received: by 2002:a05:6830:1bd5:: with SMTP id v21mr10956148ota.154.1579765422817;
        Wed, 22 Jan 2020 23:43:42 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7999:: with SMTP id h25ls7720923otm.2.gmail; Wed, 22 Jan
 2020 23:43:42 -0800 (PST)
X-Received: by 2002:a9d:4902:: with SMTP id e2mr10601411otf.116.1579765422240;
        Wed, 22 Jan 2020 23:43:42 -0800 (PST)
Date: Wed, 22 Jan 2020 23:43:41 -0800 (PST)
From: Michael Hinton <michael.g.hinton@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2c22faaa-1d5a-4ace-a7ed-7d614773a37c@googlegroups.com>
In-Reply-To: <c4f524ea-1273-0bb4-bd8d-c4a0599e40e0@oth-regensburg.de>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
 <c4f524ea-1273-0bb4-bd8d-c4a0599e40e0@oth-regensburg.de>
Subject: Re: Difference in execution duration between root cell and inmate
 for same code
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2703_1201852164.1579765421560"
X-Original-Sender: Michael.G.Hinton@gmail.com
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

------=_Part_2703_1201852164.1579765421560
Content-Type: multipart/alternative; 
	boundary="----=_Part_2704_866431274.1579765421560"

------=_Part_2704_866431274.1579765421560
Content-Type: text/plain; charset="UTF-8"

On Monday, January 20, 2020 at 4:32:45 AM UTC-7, Ralf Ramsauer wrote:
>
> Hi Michael, 
>
> More exits, more overall penalty. Depends on your test case. You can use 
> jailhouse cell stats to account for exits. 
>

Great idea. I started recording deltas in vmexit totals to better 
understand what is going on. Thanks.

I experienced a similar performance drop a while ago. In my case, it was 
> misconfigured CAT -- too little cache for the non-root cell hit the 
> performance. 
>

Is CAT Intel's Cache Allocation Technology? I was unaware that Jailhouse 
had support for this yet. My configs don't specify anything regarding the 
cache, so what happens by default? Do you have more information you can 
refer me to?

I'm going to describe my setup in more detail in my next post.

-Michael

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2c22faaa-1d5a-4ace-a7ed-7d614773a37c%40googlegroups.com.

------=_Part_2704_866431274.1579765421560
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Monday, January 20, 2020 at 4:32:45 AM UTC-7, Ralf Rams=
auer wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left=
: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">Hi Michael,
<br>
<br>More exits, more overall penalty. Depends on your test case. You can us=
e
<br>jailhouse cell stats to account for exits.
<br></blockquote><div><br></div><div>Great idea. I started recording deltas=
 in vmexit totals to better understand what is going on. Thanks.</div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left:=
 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">I experienced a simi=
lar performance drop a while ago. In my case, it was
<br>misconfigured CAT -- too little cache for the non-root cell hit the
<br>performance.
<br></blockquote><div><br></div><div>Is CAT Intel&#39;s Cache Allocation Te=
chnology? I was unaware that Jailhouse had support for this yet. My configs=
 don&#39;t specify anything regarding the cache, so what happens by default=
? Do you have more information you can refer me to?</div><div><br></div><di=
v>I&#39;m going to describe my setup in more detail in my next post.</div><=
div><br></div><div>-Michael</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2c22faaa-1d5a-4ace-a7ed-7d614773a37c%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/2c22faaa-1d5a-4ace-a7ed-7d614773a37c%40googlegroups.com<=
/a>.<br />

------=_Part_2704_866431274.1579765421560--

------=_Part_2703_1201852164.1579765421560--
