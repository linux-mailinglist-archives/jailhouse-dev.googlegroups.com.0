Return-Path: <jailhouse-dev+bncBC653PXTYYERBWUP4GHAMGQENEL26YY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id 5062F4878A1
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jan 2022 15:02:05 +0100 (CET)
Received: by mail-qk1-x740.google.com with SMTP id g66-20020a379d45000000b0047792ef05a1sf2509874qke.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jan 2022 06:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+Yr6lM0lhcvcUzhmP9ZBo/6K2HRsCRRDItG4MdXSsBI=;
        b=Q/GdOOfRcv0lrkbPGl0WfbtxgcYR4fmHgq4yvWfAbWzf8cIsfbHTwS5QAzxjCmlyOi
         BLrHyz4OBY1YeUWJ7aW1tSil1uKLFWii7n+OeQcQHyAYgLPmCaQwcJklZJGAJLG4kNeg
         xwrvzjK06LjgbnGtsjgOkZTgV7X5hQx90zAXXPTvHrxL1bL7wxP3srupI4CDaAkmiy9i
         uOvbBUqsR9z0seu08TnzRcR5RbKWxJHImK9/YSZtekR7gFqKh0Zwxvn6yQfJjIeyZQOL
         9xxtWuWOJwPOvkCCmBW4b+S20zQQ9+YI6ottIUMJCvTY2utboyUstzSpU+NPk6T2RzX4
         /QmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+Yr6lM0lhcvcUzhmP9ZBo/6K2HRsCRRDItG4MdXSsBI=;
        b=HSHrF7C9jkNOqLvjmS0TBMx+k9BiEYsMCrdfp+hnkA0SE961aTRw/Qqs8JEDPNXwBO
         n+2cllD9uqJnLkJ4sW7qXWJ8nVji4Tn2LcWhz+mdCoS0wtlk8LOVwDlCboPssjkaOjmU
         JrqTRrhizSwy2CgEVmMfB7MrbBB4zweLyAlHPW/HoseGVoRXh8ncs7rDn9VRbQ7aXFSG
         1Jy/yWCMgnvXXSgoUxIWlQpj5Qwjq7H815UyZf0cJ+bVok56TeAlQXA9yIKCuu/rEvUT
         21F4uXTdOFaXZzqaSY0rV/qt1MPouyEpb8zRWj5MUGmayfDsG/lEnu6EI/6ULWBL0mSP
         xekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+Yr6lM0lhcvcUzhmP9ZBo/6K2HRsCRRDItG4MdXSsBI=;
        b=ZoP/LJks76PRFhAX7Pw2OKk1AUK/uS/oNcjeHSJnf+T7kOGRnYu74ckOvRnK6Rcnye
         jz68dpC/bmhadUjI1T9aLXWY+Q/l03XRjaoiuLz/m3oIdzO0ubA0A7UFHFfU8yUwj9rm
         nOdjDD7pRACKNok1MT/5HCMgbwnDloH2U9ZTam4Z1SOedusxS4NK/wvxoeFhbUum3re8
         1aHWlnWb6gIi6ccIYt5tDAlXuOF7LhlLbToY/LwNBPg6VoNmAoIg3wciqqJthTgPwOCI
         KiSNp4jf6LYZNkMELf2rryqxcXgpvsYbKH8juOu/DJR/sglir5ORpD5vk8IYUXl+yiCU
         b59A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533+LnWtI9MP0lXz308+WiIX/KXs5lpBRr7UoXDhDkjgHXlM2Tzy
	oMOIDGlfNxcQvavIE57ilrY=
X-Google-Smtp-Source: ABdhPJxX0QeeR7/qV51b4uQywn8MuSuPI9YCX6ZjKb2fPDq0BFQyeeuPtJJ70dgZGfMOl7Hck4ZxbQ==
X-Received: by 2002:a05:622a:193:: with SMTP id s19mr53434749qtw.266.1641564123115;
        Fri, 07 Jan 2022 06:02:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:1789:: with SMTP id s9ls2919961qtk.7.gmail; Fri, 07
 Jan 2022 06:02:02 -0800 (PST)
X-Received: by 2002:ac8:7e88:: with SMTP id w8mr55513625qtj.357.1641564122212;
        Fri, 07 Jan 2022 06:02:02 -0800 (PST)
Date: Fri, 7 Jan 2022 06:02:01 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7540ade7-6b49-4b3e-8cf2-aa6265305af7n@googlegroups.com>
In-Reply-To: <20220105204517.06c9af0a@md1za8fc.ad001.siemens.net>
References: <53464ac4.9478.17879314390.Coremail.caohp19@lzu.edu.cn>
 <20210329104747.2f396831@md1za8fc.ad001.siemens.net>
 <022d5f64-8a41-4128-9349-1f2d82b8727an@googlegroups.com>
 <20220105204517.06c9af0a@md1za8fc.ad001.siemens.net>
Subject: Re: HELP
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2566_1791213145.1641564121607"
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

------=_Part_2566_1791213145.1641564121607
Content-Type: multipart/alternative; 
	boundary="----=_Part_2567_1116752190.1641564121607"

------=_Part_2567_1116752190.1641564121607
Content-Type: text/plain; charset="UTF-8"

Thank your for your assistance. I have my desired setup now running on my 
ow Linux distribution. Yes, your advice regarding the defconfig of 
jailhouse-images is valuable.

Best regards
Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7540ade7-6b49-4b3e-8cf2-aa6265305af7n%40googlegroups.com.

------=_Part_2567_1116752190.1641564121607
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank your for your assistance. I have my desired setup now running on my o=
w Linux distribution. Yes, your advice regarding the defconfig of jailhouse=
-images is valuable.<br><br>Best regards<br>Moustafa Noufale

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7540ade7-6b49-4b3e-8cf2-aa6265305af7n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/7540ade7-6b49-4b3e-8cf2-aa6265305af7n%40googlegroups.co=
m</a>.<br />

------=_Part_2567_1116752190.1641564121607--

------=_Part_2566_1791213145.1641564121607--
